package gov.nci.planet;

import java.sql.*;
import oracle.jdbc.*;
import gov.nci.util.ConnPoolBean;

public class QueryBean
{
    private Connection conn;
    private CallableStatement stmt;

    public QueryBean() throws SQLException
    {
	conn = ConnPoolBean.getConnection();
    }

	public void closeStatement() throws SQLException
    {
        stmt.close();
    }

    public void close() throws SQLException
    {
        closeStatement();
        conn.close();
    }

    public ResultSet getStateList() throws SQLException
    {
        stmt = conn.prepareCall("{call dccps.planet_pkg.GetStateList(?)}");
		stmt.registerOutParameter(1, OracleTypes.CURSOR);
		stmt.execute();
		return (ResultSet)stmt.getObject(1);
    }

    public ResultSet getStatePlans() throws SQLException
    {
        CallableStatement stmt = conn.prepareCall("{call dccps.planet_pkg.GetStatePlans(?)}");
	stmt.registerOutParameter(1, OracleTypes.CURSOR);
	stmt.execute();
	return (ResultSet)stmt.getObject(1);
    }

    public ResultSet getPartners(String topic) throws SQLException
    {
        stmt = conn.prepareCall("{call dccps.planet_pkg.GetPartners(?, ?)}");
        stmt.setString(1, topic);
		stmt.registerOutParameter(2, OracleTypes.CURSOR);
		stmt.execute();
		return (ResultSet)stmt.getObject(2);
    }

    public ResultSet getPartners(String topic, String stateAbbreviation) throws SQLException
    {
        stmt = conn.prepareCall("{call dccps.planet_pkg.GetPartners(?, ?, ?)}");
        stmt.setString(1, topic);
        stmt.setString(2, stateAbbreviation);
				stmt.registerOutParameter(3, OracleTypes.CURSOR);
				stmt.execute();
				return (ResultSet)stmt.getObject(3);
    }

    public getTopicID(Integer topicIN) throws SQLException
    {
	    stmt = conn.prepareCall("{? = call dccps.planet_pkg.GetTopicID(?)}");
	    stmt.registerOutParameter(1, Types.VARCHAR);
	    stmt.setInt(2,topicIN.intValue());
	    stmt.execute();
	    return stmt.getString(1);
	}

    public getTopicID(String topicIN) throws SQLException
    {
	    stmt = conn.prepareCall("{? = call dccps.planet_pkg.GetTopicID(?)}");
	    stmt.registerOutParameter(1, Types.INTEGER);
	    stmt.setString(2,topicIN);
	    stmt.execute();
	    return stmt.getInt(1);
	}

	public ResultSet getResearchers(Integer topic) throws SQLException
    {
        stmt = conn.prepareCall("{call dccps.planet_pkg.GetResearchers(?, ?)}");
        stmt.setInt(1, topic.intValue());
				stmt.registerOutParameter(2, OracleTypes.CURSOR);
				stmt.execute();
				return (ResultSet)stmt.getObject(2);
    }

    public ResultSet getResearchers(Integer topic, String stateAbbreviation) throws SQLException
    {
        stmt = conn.prepareCall("{call dccps.planet_pkg.GetResearchers(?, ?, ?)}");
        stmt.setInt(1, topic.intValue());
        stmt.setString(2, stateAbbreviation);
				stmt.registerOutParameter(3, OracleTypes.CURSOR);
				stmt.execute();
				return (ResultSet)stmt.getObject(3);
    }

    public String getTopicDescription(String topic) throws SQLException
    {
        stmt = conn.prepareCall("{? = call dccps.planet_pkg.GetTopicDescription(?)}");
        stmt.registerOutParameter(1, Types.VARCHAR);
        stmt.setString(2, topic);
        stmt.execute();
        return stmt.getString(1);
    }

    public String getTopicDescription(Integer topic) throws SQLException
    {
        stmt = conn.prepareCall("{? = call dccps.planet_pkg.GetTopicDescription(?)}");
        stmt.registerOutParameter(1, Types.VARCHAR);
        stmt.setInt(2, topic.intValue());
        stmt.execute();
        return stmt.getString(1);
    }

    public ResultSet getTopicsResearcherCount() throws SQLException
    {
	    	stmt = conn.prepareCall("{call dccps.planet_pkg.GetTopicsResearcherCount(?)}");
	    	stmt.registerOutParameter(1, OracleTypes.CURSOR);
	    	stmt.execute();
	    	return (ResultSet)stmt.getObject(1);
	  }

    public ResultSet getTopicsResearcherCount(String stateAbbreviation) throws SQLException
    {
	    	stmt = conn.prepareCall("{call dccps.planet_pkg.GetTopicsResearcherCount(?,?)}");
	    	stmt.registerOutParameter(1, OracleTypes.CURSOR);
	    	stmt.setString(2, stateAbbreviation);
	    	stmt.execute();
	    	return (ResultSet)stmt.getObject(1);
	  }

    public int getTopicResearcherCount(Integer topic) throws SQLException
    {
	    	stmt = conn.prepareCall("{? = call dccps.planet_pkg.GetTopicResearcherCount(?)}");
	    	stmt.registerOutParameter(1, Types.INTEGER);
	    	stmt.setInt(2, topic.intValue());
	    	stmt.execute();
	    	return stmt.getInt(1);
	  }

    public int getTopicResearcherCount(Integer topic, String stateAbbreviation) throws SQLException
    {
	    	stmt = conn.prepareCall("{? = call dccps.planet_pkg.GetTopicResearcherCount(?,?)}");
	    	stmt.registerOutParameter(1, Types.INTEGER);
	    	stmt.setInt(2, topic.intValue());
	    	stmt.setString(3, stateAbbreviation);
	    	stmt.execute();
	    	return stmt.getInt(1);
	  }

    public void saveFeedback(String feedbackText, String email, String phone) throws SQLException
    {
        stmt = conn.prepareCall("{call dccps.products_order_pkg.save_feedback(?, ?, ?, ?)}");
        stmt.setString(1, feedbackText);
        stmt.setString(2, email);
        stmt.setString(3, phone);
        stmt.setString(4, "PLANET");
        stmt.execute();
    }
};
