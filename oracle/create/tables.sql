/* $Id: tables.sql,v 1.4 2003-05-21 15:24:53 juranj Exp $ */

CREATE TABLE cc_partners (
    id                NUMBER(5,0),
    abbreviation      VARCHAR2(5)   NOT NULL,
    cctopic           VARCHAR2(1),
    name              VARCHAR2(50)  NOT NULL,
    CONSTRAINT cc_partners_pk PRIMARY KEY (id));

CREATE TABLE cc_partner_states (
    abbreviation  VARCHAR2(2),
    name          VARCHAR2(32)    NOT NULL,
    type          VARCHAR2(1),
    CONSTRAINT cc_partner_states_pk PRIMARY KEY (abbreviation));

CREATE TABLE cc_partner_contacts (
    id              NUMBER(10,0),
    partner_id,
    region                          NOT NULL,
    partner         VARCHAR2(5),
    topic           VARCHAR2(1),
    type            VARCHAR2(1),
    contact         VARCHAR2(1),
    name            VARCHAR2(100),
    degree          VARCHAR2(20),
    title           VARCHAR2(100),
    org1            VARCHAR2(100),
    org2            VARCHAR2(100),
    orgurl          VARCHAR2(200),
    address1        VARCHAR2(100),
    address2        VARCHAR2(100),
    city            VARCHAR2(50),
    state           VARCHAR2(3),
    zip             VARCHAR2(15),
    phone           VARCHAR2(50),
    fax             VARCHAR2(50),
    cell            VARCHAR2(50),
    email           VARCHAR2(100),
    CONSTRAINT cc_partner_contact_pk PRIMARY KEY (id),
    CONSTRAINT cc_partner_contact_partner_fk FOREIGN KEY (partner_id)
        REFERENCES cc_partners(id),
    CONSTRAINT cc_partner_contacts_region_fk FOREIGN KEY (region)
        REFERENCES cc_partner_states(abbreviation));
