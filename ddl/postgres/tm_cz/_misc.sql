--
-- Name: median(anyelement); Type: AGGREGATE; Schema: tm_cz; Owner: -
--
CREATE AGGREGATE median(anyelement) (
    SFUNC = array_append,
    STYPE = anyarray,
    INITCOND = '{}',
    FINALFUNC = _final_median
);


SET default_with_oids = false;

--
-- Name: emt_temp_seq; Type: SEQUENCE; Schema: tm_cz; Owner: -
--
CREATE SEQUENCE emt_temp_seq
    START WITH 11621
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;

--
-- Name: rtqalimits_testid_seq; Type: SEQUENCE; Schema: tm_cz; Owner: -
--
CREATE SEQUENCE rtqalimits_testid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;

--
-- Name: rtqastatslist_testid_seq; Type: SEQUENCE; Schema: tm_cz; Owner: -
--
CREATE SEQUENCE rtqastatslist_testid_seq
    START WITH 80000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;

--
-- Name: seq_child_rollup_id; Type: SEQUENCE; Schema: tm_cz; Owner: -
--
CREATE SEQUENCE seq_child_rollup_id
    START WITH 1681
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;

--
-- Name: seq_cz_job_id; Type: SEQUENCE; Schema: tm_cz; Owner: -
--
CREATE SEQUENCE seq_cz_job_id
    START WITH 413
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;

--
-- Name: seq_cz_job_message; Type: SEQUENCE; Schema: tm_cz; Owner: -
--
CREATE SEQUENCE seq_cz_job_message
    START WITH 63
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 2;

--
-- Name: seq_cz_test; Type: SEQUENCE; Schema: tm_cz; Owner: -
--
CREATE SEQUENCE seq_cz_test
    START WITH 8259
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 2;

--
-- Name: seq_cz_test_category; Type: SEQUENCE; Schema: tm_cz; Owner: -
--
CREATE SEQUENCE seq_cz_test_category
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 2;

--
-- Name: seq_region_id; Type: SEQUENCE; Schema: tm_cz; Owner: -
--
CREATE SEQUENCE seq_region_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
/*
--
-- Type: TYPE; Owner: TM_CZ; Name: T_STRING_AGG
--
  CREATE TYPE t_string_agg AS
(
  g_string  character varying(32767)
);

CREATE OR REPLACE FUNCTION TStringAggregateInitialize(
       sctx  IN OUT  t_string_agg
)
    RETURNS t_string_agg AS $body$
  BEGIN
    sctx := t_string_agg(NULL);
    RETURN;
  END;
$body$
LANGUAGE PLPGSQL;


CREATE OR REPLACE FUNCTION TStringAggregateIterate(
       self   IN OUT  t_string_agg,
       value  IN      text
)
     RETURNS t_string_agg AS $body$
  BEGIN
    self.g_string := self.g_string || ',' || value;
    RETURN;
  END;
$body$
LANGUAGE PLPGSQL;


CREATE OR REPLACE FUNCTION TStringAggregateTerminate(
       self     IN   t_string_agg,
       returnValue  OUT  text,
       flags        IN   bigint
)
    RETURNS text AS $body$
  BEGIN
    returnValue := RTRIM(LTRIM(SELF.g_string, ','), ',');
    RETURN;
  END;

$body$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION TStringAggregateMerge(
       self  IN OUT  t_string_agg,
       ctx2  IN      t_string_agg
)
    RETURNS t_string_agg AS $body$
 BEGIN
    self.g_string := self.g_string || ',' || ctx2.g_string;
    RETURN;
  END;

$body$
LANGUAGE PLPGSQL;
*/
