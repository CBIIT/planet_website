CREATE OR REPLACE PACKAGE planet_pkg
AS
    /* $Id: planet.sql,v 1.3 2003-09-16 14:57:01 juranj Exp $ */
    TYPE refcursor IS REF CURSOR;

    /* Key to cursor data types:
    (l) = Long (Integer)
    (s) = String
    (d) = Date
    (n) = Number (May have decimals)

    /***************************************************************************
    NAME  : GetStateList
    DESC  : Retreives list of states and territories used in partner maps.
            States are sorted by type (state or territory) then by name.
    IN    : none
    OUT   : none
    CURSOR: type(s)         - S if this is a state, T if this is a territory.
            abbreviation(s) - two-letter postal abbreviation for the state/territory.
            name(s)         - full name for state/territory.
    ******************************************************************************/
    PROCEDURE GetStateList(p_cursor OUT refcursor);

    /***************************************************************************
    NAME  : GetPartners
    DESC  : Retreives list of partners for the given topic.
    IN    : topic(s) - C for Comprehensive, T for tobacco control, P for physical activity.
    OUT   : none
    CURSOR: state_abbreviation(s)    - two-letter postal abbreviation of
                                       state to which the contact belongs.
            state_name(s)            - Name of state to which this person belongs.
            partner_abbreviation(s)  - acronym of partner organization (e.g., CDC)
            partner_name(s)          - full name of partner organization
                                       (e.g., Centers for Disease Control).
            type(s)                  - Type of contact
            contact_name(s)          - Name of contact
            degree(s)                - Degree(s) held by contact person
            title(s)                 - Title of contact person
            org1(s)                  - Line 1 of organization to which this person belongs
            org2(s)                  - Line 2 of organization to which this person belongs
            orgurl(s)                - Web site for organization to which this person belongs
            address1(s)              - Street address line 1
            address2(s)              - Street address line 2
            city(s)                  - City portion of mailing address
            address_state(s)         - State portion of mailing address
            zip(s)                   - ZIP code
            phone(s)                 - phone number
            fax(s)                   - fax number
            cell(s)                  - cell phone number
            email(s)                 - Email address
    ******************************************************************************/
    PROCEDURE GetPartners(p_topic IN cc_partner_topics.cctopic%TYPE, p_cursor OUT refcursor);

    /***************************************************************************
    NAME  : GetPartners
    DESC  : Retreives list of partners for the given topic and the given state.
    IN    : topic(s) - C for Comprehensive, T for tobacco control, P for physical activity.
          : state(s) - two-letter postal abbreviation for state or territory to which query
                       should be limited.
    OUT   : none
    CURSOR: same as above procedure.
    ******************************************************************************/
    PROCEDURE GetPartners(p_topic IN cc_partner_topics.cctopic%TYPE,
                         p_state cc_partner_contact_states.state_abbr%TYPE, p_cursor OUT refcursor);

    /***************************************************************************
    NAME  : GetTopicDescription
    DESC  : Retreive description of a given topic
    IN    : topic(s) - C for Comprehensive, T for tobacco control, etc.
    RETURN: description(s) - description of the topic
    ******************************************************************************/
    FUNCTION GetTopicDescription(p_topic IN cc_partner_topic_list.cctopic%TYPE)
        RETURN cc_partner_topic_list.description%TYPE;
END planet_pkg;
/
