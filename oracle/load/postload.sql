/* $Id */

/* Update data and database structure now that data is loaded */

UPDATE cc_partner_contacts pc
SET partner_id = (
    SELECT id
    FROM cc_partners p
    WHERE pc.partner = p.abbreviation
        AND (pc.topic = p.cctopic OR p.cctopic IS NULL));

ALTER TABLE cc_partner_contacts MODIFY partner_id NOT NULL;
ALTER TABLE cc_partner_contacts DROP (partner, topic);
