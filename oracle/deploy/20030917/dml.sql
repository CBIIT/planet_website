INSERT INTO cc_partner_contact_states (state_abbr, partner_contact_id)
SELECT region, id
FROM cc_partner_contacts;

INSERT INTO cc_partner_topic_list (cctopic, description)
    VALUES ('C', 'Cancer Control Partners');
INSERT INTO cc_partner_topic_list (cctopic, description)
    VALUES ('T', 'Potential Tobacco Control Partners');
INSERT INTO cc_partner_topic_list (cctopic, description)
    VALUES ('P', 'Potential Physical Activity Partners');
INSERT INTO cc_partner_topic_list (cctopic, description)
    VALUES ('B', 'Breast Cancer Control Partners');
INSERT INTO cc_partner_topic_list (cctopic, description)
    VALUES ('V', 'Cervical Cancer Control Partners');

INSERT INTO cc_partner_topics (cc_partner_id, cctopic)
    VALUES (2, 'C');
INSERT INTO cc_partner_topics (cc_partner_id, cctopic)
    VALUES (4, 'T');
INSERT INTO cc_partner_topics (cc_partner_id, cctopic)
    VALUES (5, 'P');
