--
-- Name: search_auth_user_sec_access; Type: TABLE; Schema: searchapp; Owner: -
--
CREATE TABLE search_auth_user_sec_access (
    search_auth_user_sec_access_id bigint NOT NULL,
    search_auth_user_id bigint,
    search_secure_object_id bigint,
    search_sec_access_level_id bigint
);

--
-- Name: search_sec_a_u_s_a_pk; Type: CONSTRAINT; Schema: searchapp; Owner: -
--
ALTER TABLE ONLY search_auth_user_sec_access
    ADD CONSTRAINT search_sec_a_u_s_a_pk PRIMARY KEY (search_auth_user_sec_access_id);

--
-- Name: tf_trgi_search_a_u_sec_access_id(); Type: FUNCTION; Schema: searchapp; Owner: -
--
CREATE FUNCTION tf_trgi_search_a_u_sec_access_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.SEARCH_AUTH_USER_SEC_ACCESS_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_AUTH_USER_SEC_ACCESS_ID ;       end if;    RETURN NEW; end;



$$;

--
-- Name: trgi_search_a_u_sec_access_id; Type: TRIGGER; Schema: searchapp; Owner: -
--
CREATE TRIGGER trgi_search_a_u_sec_access_id BEFORE INSERT ON search_auth_user_sec_access FOR EACH ROW EXECUTE PROCEDURE tf_trgi_search_a_u_sec_access_id();

--
-- Name: search_sec_a_u_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: -
--
ALTER TABLE ONLY search_auth_user_sec_access
    ADD CONSTRAINT search_sec_a_u_fk FOREIGN KEY (search_auth_user_id) REFERENCES search_auth_user(id);

--
-- Name: search_sec_s_a_l_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: -
--
ALTER TABLE ONLY search_auth_user_sec_access
    ADD CONSTRAINT search_sec_s_a_l_fk FOREIGN KEY (search_sec_access_level_id) REFERENCES search_sec_access_level(search_sec_access_level_id);

--
-- Name: search_sec_s_o_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: -
--
ALTER TABLE ONLY search_auth_user_sec_access
    ADD CONSTRAINT search_sec_s_o_fk FOREIGN KEY (search_secure_object_id) REFERENCES search_secure_object(search_secure_object_id);

