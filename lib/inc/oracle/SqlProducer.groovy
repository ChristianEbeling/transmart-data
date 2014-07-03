package inc.oracle

import groovy.sql.Sql

import java.sql.Connection
import java.sql.DriverManager

import static java.lang.System.getenv
import static groovyx.gpars.GParsPool.withPool

class SqlProducer {
    static Sql createFromEnv(String user = null, String password = null, Boolean enhance = false) {
        Class.forName 'oracle.jdbc.driver.OracleDriver'
        def url = "jdbc:oracle:thin:@${getenv 'ORAHOST'}:${getenv 'ORAPORT'}:${getenv "ORASID"}"

        Connection connection = DriverManager.getConnection(url,
                user ?: getenv('ORAUSER'),
                password ?: getenv('ORAPASSWORD'))
        connection.autoCommit = false
        /* by creating an Sql from a Connection, we ensure only that connection
         * is used by the Sql; it will not generate connections by itself.
         * The effect is basically the same as if we were running always under
         * Sql::cacheConnection() */
        def sql = new Sql(connection)
        if (enhance) {
            sql = new EnhancedSql(sql)
        }
        sql
    }

    static List<Sql> createMultipleFromEnv(Integer n,
                                           String user = null,
                                           String password = null,
                                           Boolean enhance = false) {
        withPool n, {
            def sqlProducerAsync = SqlProducer.&createFromEnv.curry(user, password, enhance).asyncFun()
            Collections.nCopies(n, sqlProducerAsync)*.call()*.get()
        }
    }

    static closeConnections(Collection<Sql> sqls, Closure beforeShutdown = null) {
        if (sqls.empty) {
            return
        }

        withPool sqls.size(), {
            sqls.eachParallel { Sql sql ->
                if (beforeShutdown) {
                    beforeShutdown.call sql
                }
                sql.close()
            }
        }
    }
}
