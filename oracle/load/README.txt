Changes necessary to load data:

1. Change table names
2. Add column names to insert statements
3. Remove "bad" columns from cc_partner_contacts table (all NULLs, invalid partner field)
4. Replace \' with '' to make literal single quotes work with Oracle.
