--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-07-16 19:08:56 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 24793)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    cd_cliente integer NOT NULL,
    endereco_cd_endereco integer,
    nm_razaosocial character varying(30),
    nm_fantasia character varying(60),
    ds_email character varying(30),
    cod_identificacao character varying(30),
    tipo_cliente character varying(20),
    tp_visivel character(1)
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 24801)
-- Name: enderco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE enderco (
    cd_endereco integer NOT NULL,
    nm_rua character varying(30),
    nr_casa integer,
    ds_complemento character varying(30),
    nm_bairro character varying(20),
    nm_cidade character varying(20),
    ds_cep character varying(8),
    telefone1 numeric(11,0),
    telefone2 numeric(11,0)
);


ALTER TABLE enderco OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 24806)
-- Name: funcao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcao (
    cd_funcao integer NOT NULL,
    ds_funcao character varying(30),
    tp_visivel character(1)
);


ALTER TABLE funcao OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 24809)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcionario (
    cd_funcionario integer NOT NULL,
    funcao_cd_funcao integer,
    endereco_cd_endereco integer,
    nm_funcionario character varying(40),
    ds_senha character varying(50),
    nick character varying(50),
    tp_visivel character(1)
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 24815)
-- Name: ordem_servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ordem_servico (
    cd_ordem_servico integer NOT NULL,
    funcionario_cd_funcionario integer NOT NULL,
    cliente_cd_cliente integer,
    dt_ordem_servico date,
    vl_total numeric(7,2),
    bool_fechado boolean
);


ALTER TABLE ordem_servico OWNER TO postgres;

--
-- TOC entry 2165 (class 0 OID 24793)
-- Dependencies: 181
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (cd_cliente, endereco_cd_endereco, nm_razaosocial, nm_fantasia, ds_email, cod_identificacao, tipo_cliente, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2166 (class 0 OID 24801)
-- Dependencies: 182
-- Data for Name: enderco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enderco (cd_endereco, nm_rua, nr_casa, ds_complemento, nm_bairro, nm_cidade, ds_cep, telefone1, telefone2) FROM stdin;
\.


--
-- TOC entry 2167 (class 0 OID 24806)
-- Dependencies: 183
-- Data for Name: funcao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcao (cd_funcao, ds_funcao, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2168 (class 0 OID 24809)
-- Dependencies: 184
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcionario (cd_funcionario, funcao_cd_funcao, endereco_cd_endereco, nm_funcionario, ds_senha, nick, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2169 (class 0 OID 24815)
-- Dependencies: 185
-- Data for Name: ordem_servico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ordem_servico (cd_ordem_servico, funcionario_cd_funcionario, cliente_cd_cliente, dt_ordem_servico, vl_total, bool_fechado) FROM stdin;
\.


--
-- TOC entry 2035 (class 2606 OID 24797)
-- Name: pk_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (cd_cliente);


--
-- TOC entry 2037 (class 2606 OID 24805)
-- Name: pk_endereco; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enderco
    ADD CONSTRAINT pk_endereco PRIMARY KEY (cd_endereco);


--
-- TOC entry 2039 (class 2606 OID 24825)
-- Name: pk_funcao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcao
    ADD CONSTRAINT pk_funcao PRIMARY KEY (cd_funcao);


--
-- TOC entry 2043 (class 2606 OID 24827)
-- Name: pk_funcionario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT pk_funcionario PRIMARY KEY (cd_funcionario);


--
-- TOC entry 2046 (class 2606 OID 24841)
-- Name: pk_ordem_servico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ordem_servico
    ADD CONSTRAINT pk_ordem_servico PRIMARY KEY (cd_ordem_servico, funcionario_cd_funcionario);


--
-- TOC entry 2033 (class 1259 OID 24823)
-- Name: fki_endereco; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_endereco ON cliente USING btree (endereco_cd_endereco);


--
-- TOC entry 2040 (class 1259 OID 24833)
-- Name: fki_funcionario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_funcionario ON funcionario USING btree (funcao_cd_funcao);


--
-- TOC entry 2041 (class 1259 OID 24839)
-- Name: fki_funcionarioendereco; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_funcionarioendereco ON funcionario USING btree (endereco_cd_endereco);


--
-- TOC entry 2044 (class 1259 OID 24847)
-- Name: fki_ordem_servico; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ordem_servico ON ordem_servico USING btree (cliente_cd_cliente);


--
-- TOC entry 2047 (class 2606 OID 24818)
-- Name: fk_endereco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT fk_endereco FOREIGN KEY (endereco_cd_endereco) REFERENCES enderco(cd_endereco);


--
-- TOC entry 2048 (class 2606 OID 24828)
-- Name: fk_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_funcionario FOREIGN KEY (funcao_cd_funcao) REFERENCES funcionario(cd_funcionario);


--
-- TOC entry 2049 (class 2606 OID 24834)
-- Name: fk_funcionarioendereco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_funcionarioendereco FOREIGN KEY (endereco_cd_endereco) REFERENCES enderco(cd_endereco);


--
-- TOC entry 2050 (class 2606 OID 24842)
-- Name: fk_ordem_servico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ordem_servico
    ADD CONSTRAINT fk_ordem_servico FOREIGN KEY (cliente_cd_cliente) REFERENCES cliente(cd_cliente);


--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-07-16 19:08:57 BRT

--
-- PostgreSQL database dump complete
--

