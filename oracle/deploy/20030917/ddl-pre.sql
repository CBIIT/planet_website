/* $Id: ddl-pre.sql,v 1.1 2003-09-16 18:59:45 juranj Exp $ */

CREATE TABLE cc_partner_topic_list (
    cctopic            VARCHAR(1),
    description        VARCHAR2(50),
    CONSTRAINT cc_partner_topic_list_pk PRIMARY KEY (cctopic));

CREATE TABLE cc_partner_topics (
    cc_partner_id,
    cctopic,
    CONSTRAINT cc_partner_topics_pk PRIMARY KEY (cc_partner_id, cctopic),
    CONSTRAINT cc_partner_topic_partner_fk FOREIGN KEY (cc_partner_id)
        REFERENCES cc_partners(id),
    CONSTRAINT cc_partner_topic_topic_fk FOREIGN KEY (cctopic)
        REFERENCES cc_partner_topic_list(cctopic));

ALTER TABLE cc_partners ADD (
    all_topic_flag VARCHAR2(1),
    CONSTRAINT cc_partners_all_topic_chk CHECK (all_topic_flag = 'Y'));

CREATE TABLE cc_partner_contact_states (
    state_abbr,
    partner_contact_id,
    CONSTRAINT cc_partner_contact_states PRIMARY KEY (state_abbr, partner_contact_id),
    CONSTRAINT cc_partner_con_states_state_fk FOREIGN KEY (state_abbr)
        REFERENCES cc_partner_states(abbreviation),
    CONSTRAINT cc_partner_con_states_con_fk FOREIGN KEY (partner_contact_id)
        REFERENCES cc_partner_contacts(id))
ORGANIZATION INDEX;
