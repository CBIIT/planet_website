CREATE OR REPLACE PACKAGE BODY planet_pkg
AS
    /* $Id: planet.sql,v 1.2 2003-09-12 19:47:36 juranj Exp $ */
    PROCEDURE GetStateList(p_cursor OUT refcursor)
    IS
    BEGIN
        OPEN p_cursor FOR
            SELECT type, abbreviation, name
            FROM cc_partner_states
            ORDER BY type, name;
    END GetStateList;

    PROCEDURE GetPartners(p_topic IN cc_partners.cctopic%TYPE, p_cursor OUT refcursor)
    IS
    BEGIN
        OPEN p_cursor FOR
            SELECT region state_abbreviation, ps.name state_name,
                p.abbreviation partner_abbreviation, p.name partner_name,
                pc.type, pc.name contact_name,
                degree, title, org1, org2, orgurl, address1, address2, city,
                pc.state address_state, zip, phone, fax, cell, email
            FROM cc_partners p, cc_partner_contacts pc, cc_partner_states ps
            WHERE p.id = pc.partner_id
                AND pc.region = ps.abbreviation
                AND pc.type <> 'N'
                AND (cctopic IS NULL OR cctopic = p_topic)
            ORDER BY ps.name, p.abbreviation, pc.type, contact;
    END GetPartners;

    PROCEDURE GetPartners(p_topic IN cc_partners.cctopic%TYPE,
                         p_state cc_partner_contacts.region%TYPE, p_cursor OUT refcursor)
    IS
    BEGIN
        OPEN p_cursor FOR
            SELECT region state_abbreviation, ps.name state_name,
                p.abbreviation partner_abbreviation, p.name partner_name,
                pc.type, pc.name contact_name,
                degree, title, org1, org2, orgurl, address1, address2, city,
                pc.state address_state, zip, phone, fax, cell, email
            FROM cc_partners p, cc_partner_contacts pc, cc_partner_states ps
            WHERE p.id = pc.partner_id
                AND pc.region = ps.abbreviation
                AND pc.type <> 'N'
                AND (cctopic IS NULL OR cctopic = p_topic)
                AND region = p_state
            ORDER BY ps.name, p.abbreviation, pc.type, contact;
    END GetPartners;

   FUNCTION GetTopicDescription(p_topic IN cc_partner_topics.cctopic%TYPE)
        RETURN cc_partner_topics.description%TYPE
   IS
       l_descrip cc_partner_topics.description%TYPE;
   BEGIN
       SELECT description
       INTO l_descrip
       FROM cc_partner_topics
       WHERE cctopic = p_topic;

       RETURN l_descrip;
   END GetTopicDescription;
END planet_pkg;
/
