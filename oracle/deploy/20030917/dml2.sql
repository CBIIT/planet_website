insert into cc_partners (abbreviation, name)
values ('CDC', 'The National Breast and Cervical Cancer Early Detection Program');

INSERT INTO cc_partner_topics (cc_partner_id, cctopic)
VALUES (2, 'B');
INSERT INTO cc_partner_topics (cc_partner_id, cctopic)
VALUES (2, 'V');
INSERT INTO cc_partner_topics (cc_partner_id, cctopic)
VALUES (6, 'B');
INSERT INTO cc_partner_topics (cc_partner_id, cctopic)
VALUES (6, 'V');

INSERT INTO cc_contact_types (type_code, description)
VALUES ('R', 'Regional Contact');

INSERT INTO cc_contact_types (type_code, description)
VALUES ('B', 'Tribal Contact');

INSERT INTO cc_contact_types (type_code, description)
VALUES ('T', 'Territorial');

INSERT INTO cc_contact_types (type_code, description)
VALUES ('S', 'State');

INSERT INTO cc_contact_types (type_code, description)
VALUES ('N', 'Not a Contact');

INSERT INTO cc_contact_types (type_code, description)
VALUES ('W', 'Web Site');

INSERT INTO cc_partner_contacts (partner_id, type, orgurl, orgurl2)
VALUES (6, 'W', 'http://www.cdc.gov/cancer/nbccedp/contacts.htm',
    'http://www.cdc.gov/cancer/nbccedp/');


INSERT INTO cc_partner_contact_states (state_abbr, partner_contact_id)
SELECT abbreviation, 281
FROM cc_partner_states
WHERE type = 'S';
