CREATE OR REPLACE TRIGGER cc_partners_bi
BEFORE INSERT ON cc_partners
FOR EACH ROW
BEGIN
    SELECT cc_partners_seq.nextval
    INTO :new.id
    FROM dual;
END;
/

CREATE OR REPLACE TRIGGER cc_partner_contacts_bi
BEFORE INSERT ON cc_partner_contacts
FOR EACH ROW
BEGIN
    SELECT cc_partner_contacts_seq.nextval
    INTO :new.id
    FROM dual;
END;
/
