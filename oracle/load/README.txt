Changes necessary to load data:

1. Change table names
2. Add column names to insert statements
3. Remove "bad" columns from cc_partner_contacts table (all NULLs, invalid partner field)
4. Replace \' with '' to make literal single quotes work with Oracle.
5. Run load scripts in the following order:
    - cc_partners
    - cc_partner_states
    - cc_partner_contacts
6. Run postload.sql script to adjust database data and structure.
