package gov.nci.planet;
import java.sql.*;
import java.util.Iterator;
import java.util.Vector;

import oracle.jdbc.*;
import gov.nci.util.ConnPoolBean;
import gov.nci.planet.bean.*;

public class QueryBean {
	
	public QueryBean(){
	}

	public Vector getStateList()
	{
		ResultSet rs = null;
		Connection conn =null;
		CallableStatement stmt =null;
		Vector stateList = null;
		
		try {
			conn = ConnPoolBean.getConnection();
			stmt = conn.prepareCall("{call dccps.planet_pkg.GetStateList(?)}");
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.execute();
			rs = (ResultSet)stmt.getObject(1);
			
			String typeString = "S";
			String topic = "C";
			
			
			if (rs.next())
			{
				
				stateList = new Vector();
				int count= 0;
				do
				{
					StateBean state = new StateBean();
					
					state.setType(rs.getString("type"));
					state.setName(rs.getString("name"));
					state.setAbbreviation(rs.getString("abbreviation"));
					
					stateList.add(state);
					
				} while (rs.next());
			}
			
		    rs.close();
		    rs = null;
		    stmt.close();
		    stmt = null;
		    //conn.close(); // Return to connection pool
		    //conn = null;  // Make sure we don't close it twice
		    ConnPoolBean.closeConnection(conn);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs!= null){
				try {
					rs.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				rs = null;
			}
			if (stmt!=null){
				try {
					stmt.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				stmt = null;
			}
			if (conn!=null) {
				try {
					//conn.close();
					ConnPoolBean.closeConnection(conn);
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				conn = null;
			}
		}
		
		return stateList;
	}	
	
	public String getTopicDescription(String topic) {
		
		ResultSet rs = null;
		Connection conn =null;
		CallableStatement stmt =null;
		String topicTitle = null;
		
		try {
			conn = ConnPoolBean.getConnection();
			stmt = conn.prepareCall("{? = call dccps.planet_pkg.GetTopicDescription(?)}");
			stmt.registerOutParameter(1, Types.VARCHAR);
			stmt.setString(2, topic);
			stmt.execute();
			topicTitle = stmt.getString(1);
			
		 
		    stmt.close();
		    stmt = null;
		    //conn.close(); // Return to connection pool
		    //conn = null;  // Make sure we don't close it twice
		    
		    ConnPoolBean.closeConnection(conn);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs!= null){
				try {
					rs.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				rs = null;
			}
			if (stmt!=null){
				try {
					stmt.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				stmt = null;
			}
			if (conn!=null) {
				try {
					//conn.close();
					ConnPoolBean.closeConnection(conn);
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				conn = null;
			}
		}

		
		return topicTitle;
	}
	
	public String getTopicID(Integer topicIN) {
		ResultSet rs = null;
		Connection conn =null;
		CallableStatement stmt =null;
		String topicID = null;
		
		try {
			conn = ConnPoolBean.getConnection();
				
			stmt = conn.prepareCall("{? = call dccps.planet_pkg.GetTopicID(?)}");
			stmt.registerOutParameter(1, Types.VARCHAR);
			stmt.setInt(2, topicIN.intValue());
			stmt.execute();
			topicID =  stmt.getString(1);
			
		    
		    stmt.close();
		    stmt = null;
		    //conn.close(); // Return to connection pool
		    //conn = null;  // Make sure we don't close it twice
		    
		    ConnPoolBean.closeConnection(conn);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs!= null){
				try {
					rs.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				rs = null;
			}
			if (stmt!=null){
				try {
					stmt.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				stmt = null;
			}
			if (conn!=null) {
				try {
					//conn.close();
					ConnPoolBean.closeConnection(conn);
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				conn = null;
			}
		}
		
		return topicID;
	}
	
	public int getTopicID(String topicIN) {
		ResultSet rs = null;
		Connection conn =null;
		CallableStatement stmt =null;
		int topicID = 0;
		
		try {
			conn = ConnPoolBean.getConnection();
			
			stmt = conn.prepareCall("{? = call dccps.planet_pkg.GetTopicID(?)}");
			stmt.registerOutParameter(1, Types.INTEGER);
			stmt.setString(2, topicIN);
			stmt.execute();
			topicID = stmt.getInt(1);
			
		    
		    stmt.close();
		    stmt = null;
		    //conn.close(); // Return to connection pool
		    //conn = null;  // Make sure we don't close it twice
		    
		    ConnPoolBean.closeConnection(conn);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs!= null){
				try {
					rs.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				rs = null;
			}
			if (stmt!=null){
				try {
					stmt.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				stmt = null;
			}
			if (conn!=null) {
				try {
					//conn.close();
					ConnPoolBean.closeConnection(conn);
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				conn = null;
			}
		}

		return topicID;
	}
	
	public Vector getPartners(String topic) {
		ResultSet rs = null;
		Connection conn =null;
		CallableStatement stmt =null;
		Vector partners = null;
		
		try {
			conn = ConnPoolBean.getConnection();
		
			stmt = conn.prepareCall("{call dccps.planet_pkg.GetPartners(?, ?)}");
			stmt.setString(1, topic);
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			stmt.execute();
			rs = (ResultSet) stmt.getObject(2);
			if (rs.next())
		    {
				partners = new Vector();
		        do
		        {
		        	PartnerBean partnerBean = new PartnerBean();
		        	
		        	// set the values of the bean
		        	partnerBean.setAddress1(rs.getString("address1"));
		        	partnerBean.setAddress2(rs.getString("address2"));
		        	partnerBean.setCell(rs.getString("cell"));
		        	partnerBean.setCity(rs.getString("city"));
		        	partnerBean.setDegree(rs.getString("degree"));
		        	partnerBean.setEmail(rs.getString("email"));
		        	partnerBean.setFax(rs.getString("fax"));
		        	partnerBean.setOrg1(rs.getString("org1"));
		        	partnerBean.setOrg2(rs.getString("org2"));
		        	partnerBean.setOrgurl(rs.getString("orgurl"));
		        	partnerBean.setOrgurl2(rs.getString("orgurl2"));
		        	partnerBean.setPartnerAbbreviation(rs.getString("partner_abbreviation"));
		        	partnerBean.setPartnerId(rs.getInt("partner_id"));
		        	partnerBean.setPartnerName(rs.getString("partner_name"));
		        	partnerBean.setPhone(rs.getString("phone"));
		        	partnerBean.setStateName(rs.getString("state_name"));
		        	partnerBean.setTitle(rs.getString("title"));
		        	partnerBean.setType(rs.getString("type"));
		        	partnerBean.setTypeDescription(rs.getString("type_description"));
		        	partnerBean.setAddressState(rs.getString("address_state"));
					partnerBean.setZip(rs.getString("zip"));
					partnerBean.setContactName(rs.getString("contact_name"));
		        	
		        	// add them to the vector
		        	partners.add(partnerBean);
			
		        } while (rs.next());
		    }
			
		    rs.close();
		    rs = null;
		    stmt.close();
		    stmt = null;
		    //conn.close(); // Return to connection pool
		    //conn = null;  // Make sure we don't close it twice

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs!= null){
				try {
					rs.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				rs = null;
			}
			if (stmt!=null){
				try {
					stmt.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				stmt = null;
			}
			if (conn!=null) {
				try {
					//conn.close();
					ConnPoolBean.closeConnection(conn);
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				conn = null;
			}
		}

		return partners;
	}
	
	public Vector getPartners(String topic, String stateAbbreviation) {
		
		ResultSet rs = null;
		Connection conn =null;
		CallableStatement stmt =null;
		Vector partners = null;
		
		try {
			conn = ConnPoolBean.getConnection();
		
			stmt = conn.prepareCall("{call dccps.planet_pkg.GetPartners(?, ?, ?)}");
			stmt.setString(1, topic);
			stmt.setString(2, stateAbbreviation);
			stmt.registerOutParameter(3, OracleTypes.CURSOR);
			stmt.execute();
			rs = (ResultSet) stmt.getObject(3);
			
			if (rs.next())
		    {
				partners = new Vector();
		        do
		        {
		        	PartnerBean partnerBean = new PartnerBean();
		        	
		        	// set the values of the bean
		        	partnerBean.setAddress1(rs.getString("address1"));
		        	partnerBean.setAddress2(rs.getString("address2"));
		        	partnerBean.setCell(rs.getString("cell"));
		        	partnerBean.setCity(rs.getString("city"));
		        	partnerBean.setDegree(rs.getString("degree"));
		        	partnerBean.setEmail(rs.getString("email"));
		        	partnerBean.setFax(rs.getString("fax"));
		        	partnerBean.setOrg1(rs.getString("org1"));
		        	partnerBean.setOrg2(rs.getString("org2"));
		        	partnerBean.setOrgurl(rs.getString("orgurl"));
		        	partnerBean.setOrgurl2(rs.getString("orgurl2"));
		        	partnerBean.setPartnerAbbreviation(rs.getString("partner_abbreviation"));
		        	partnerBean.setPartnerId(rs.getInt("partner_id"));
		        	partnerBean.setPartnerName(rs.getString("partner_name"));
		        	partnerBean.setPhone(rs.getString("phone"));
		        	partnerBean.setStateName(rs.getString("state_name"));
		        	partnerBean.setTitle(rs.getString("title"));
		        	partnerBean.setType(rs.getString("type"));
		        	partnerBean.setTypeDescription(rs.getString("type_description"));
		        	partnerBean.setAddressState(rs.getString("address_state"));
					partnerBean.setZip(rs.getString("zip"));
		        	partnerBean.setContactName(rs.getString("contact_name"));
		        	
		        	// add them to the vector
		        	partners.add(partnerBean);
			
		        } while (rs.next());
		    }
			
		    rs.close();
		    rs = null;
		    stmt.close();
		    stmt = null;
		    //conn.close(); // Return to connection pool
		    //conn = null;  // Make sure we don't close it twice
		    
		    ConnPoolBean.closeConnection(conn);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs!= null){
				try {
					rs.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				rs = null;
			}
			if (stmt!=null){
				try {
					stmt.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				stmt = null;
			}
			if (conn!=null) {
				try {
					//conn.close();
					ConnPoolBean.closeConnection(conn);
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				conn = null;
			}
		}

		return partners;
		
	}
	
	public String getTopicDescription(Integer topic) {
		ResultSet rs = null;
		Connection conn =null;
		CallableStatement stmt =null;
		String desc = null;
		
		try {
			conn = ConnPoolBean.getConnection();
			
			stmt = conn.prepareCall("{? = call dccps.planet_pkg.GetTopicDescription(?)}");
			stmt.registerOutParameter(1, Types.VARCHAR);
			stmt.setInt(2, topic.intValue());
			stmt.execute();
			desc = stmt.getString(1);
			
		    stmt.close();
		    stmt = null;
		    //conn.close(); // Return to connection pool
		    //conn = null;  // Make sure we don't close it twice
		    
		    ConnPoolBean.closeConnection(conn);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs!= null){
				try {
					rs.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				rs = null;
			}
			if (stmt!=null){
				try {
					stmt.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				stmt = null;
			}
			if (conn!=null) {
				try {
					//conn.close();
					ConnPoolBean.closeConnection(conn);
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				conn = null;
			}
		}
		
		return desc;
	}
	
	public Vector getResearchers(Integer topic) {
		ResultSet rs = null;
		Connection conn =null;
		CallableStatement stmt =null;
		Vector researchers = null;
		
		try {
			conn = ConnPoolBean.getConnection();
			
			
			
			stmt = conn.prepareCall("{call dccps.planet_pkg.GetResearchers(?, ?)}");
			stmt.setInt(1, topic.intValue());
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			stmt.execute();
			rs = (ResultSet) stmt.getObject(2);
			
			if (rs.next())
		    {
				researchers = new Vector();
		        do
		        {
		        	ResearcherBean researcherBean = new ResearcherBean();
		        	
		        	// set the values of the bean
		        	researcherBean.setAddress1(rs.getString("address1"));
		        	researcherBean.setAddress2(rs.getString("address2"));
		        	researcherBean.setCell(rs.getString("cell"));
		        	researcherBean.setCity(rs.getString("city"));
		        	researcherBean.setDegree(rs.getString("degree"));
		        	researcherBean.setEmail(rs.getString("email"));
		        	researcherBean.setFax(rs.getString("fax"));
		        	researcherBean.setOrg1(rs.getString("org1"));
		        	researcherBean.setOrg2(rs.getString("org2"));
		        	researcherBean.setOrgurl(rs.getString("orgurl"));
		        	researcherBean.setOrgurl2(rs.getString("orgurl2"));
		        	researcherBean.setPhone(rs.getString("phone"));
		        	researcherBean.setStateName(rs.getString("state_name"));
		        	researcherBean.setTitle(rs.getString("title"));
		        	researcherBean.setAddressState(rs.getString("address_state"));
		        	researcherBean.setZip(rs.getString("zip"));
		        	
		        	researcherBean.setStateAbbreviation(rs.getString("state_abbreviation"));
		        	researcherBean.setResearcherId(rs.getInt("researcher_id"));
		        	researcherBean.setResearcherName(rs.getString("researcher_name"));
		        	
		        	researcherBean.setTopicId(rs.getInt("topic_id"));
		        	
		        	// add them to the vector
		        	researchers.add(researcherBean);
			
		        } while (rs.next());
		    }
			
		    rs.close();
		    rs = null;
		    stmt.close();
		    stmt = null;
		    //conn.close(); // Return to connection pool
		    //conn = null;  // Make sure we don't close it twice
		    
		    ConnPoolBean.closeConnection(conn);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs!= null){
				try {
					rs.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				rs = null;
			}
			if (stmt!=null){
				try {
					stmt.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				stmt = null;
			}
			if (conn!=null) {
				try {
					//conn.close();
					ConnPoolBean.closeConnection(conn);
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				conn = null;
			}
		}

		return researchers;
	}
	
	public Vector getResearchers(Integer topic, String stateAbbreviation) {
		
		ResultSet rs = null;
		Connection conn =null;
		CallableStatement stmt =null;
		Vector researchers = null;
		
		try {
			conn = ConnPoolBean.getConnection();
			
			stmt = conn.prepareCall("{call dccps.planet_pkg.GetResearchers(?, ?, ?)}");
			stmt.setInt(1, topic.intValue());
			stmt.setString(2, stateAbbreviation);
			stmt.registerOutParameter(3, OracleTypes.CURSOR);
			stmt.execute();
			rs = (ResultSet) stmt.getObject(3);
			
			if (rs.next())
		    {
				researchers = new Vector();
		        do
		        {
		        	ResearcherBean researcherBean = new ResearcherBean();
		        	
		        	// set the values of the bean
		        	researcherBean.setAddress1(rs.getString("address1"));
		        	researcherBean.setAddress2(rs.getString("address2"));
		        	researcherBean.setCell(rs.getString("cell"));
		        	researcherBean.setCity(rs.getString("city"));
		        	researcherBean.setDegree(rs.getString("degree"));
		        	researcherBean.setEmail(rs.getString("email"));
		        	researcherBean.setFax(rs.getString("fax"));
		        	researcherBean.setOrg1(rs.getString("org1"));
		        	researcherBean.setOrg2(rs.getString("org2"));
		        	researcherBean.setOrgurl(rs.getString("orgurl"));
		        	researcherBean.setOrgurl2(rs.getString("orgurl2"));
		        	researcherBean.setPhone(rs.getString("phone"));
		        	researcherBean.setStateName(rs.getString("state_name"));
		        	researcherBean.setTitle(rs.getString("title"));
		        	researcherBean.setAddressState(rs.getString("address_state"));
		        	researcherBean.setZip(rs.getString("zip"));
		        	
		        	researcherBean.setStateAbbreviation(rs.getString("state_abbreviation"));
		        	researcherBean.setResearcherId(rs.getInt("researcher_id"));
		        	researcherBean.setResearcherName(rs.getString("researcher_name"));
		        	
		        	researcherBean.setTopicId(rs.getInt("topic_id"));
		        	
		        	// add them to the vector
		        	researchers.add(researcherBean);
			
		        } while (rs.next());
		    }
			
		    rs.close();
		    rs = null;
		    stmt.close();
		    stmt = null;
		    //conn.close(); // Return to connection pool
		    //conn = null;  // Make sure we don't close it twice

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs!= null){
				try {
					rs.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				rs = null;
			}
			if (stmt!=null){
				try {
					stmt.close();
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				stmt = null;
			}
			if (conn!=null) {
				try {
					//conn.close();
					ConnPoolBean.closeConnection(conn);
				} catch (SQLException ee){
					ee.printStackTrace();
				}
				conn = null;
			}
		}

		return researchers;		
	}
	
	/*
	public ResultSet getStatePlans() throws SQLException {
		CallableStatement stmt = conn.prepareCall("{call dccps.planet_pkg.GetStatePlans(?)}");
		stmt.registerOutParameter(1, OracleTypes.CURSOR);
		stmt.execute();
		return (ResultSet) stmt.getObject(1);
	}

	public String getTopicDescription(Integer topic) throws SQLException {
		stmt = conn
		.prepareCall("{? = call dccps.planet_pkg.GetTopicDescription(?)}");
		stmt.registerOutParameter(1, Types.VARCHAR);
		stmt.setInt(2, topic.intValue());
		stmt.execute();
		return stmt.getString(1);
	}
	public ResultSet getTopicsResearcherCount() throws SQLException {
		stmt = conn
		.prepareCall("{call dccps.planet_pkg.GetTopicsResearcherCount(?)}");
		stmt.registerOutParameter(1, OracleTypes.CURSOR);
		stmt.execute();
		return (ResultSet) stmt.getObject(1);
	}
	public ResultSet getTopicsResearcherCount(String stateAbbreviation)
	throws SQLException {
		stmt = conn
		.prepareCall("{call dccps.planet_pkg.GetTopicsResearcherCount(?,?)}");
		stmt.registerOutParameter(1, OracleTypes.CURSOR);
		stmt.setString(2, stateAbbreviation);
		stmt.execute();
		return (ResultSet) stmt.getObject(1);
	}
	public int getTopicResearcherCount(Integer topic) throws SQLException {
		stmt = conn
		.prepareCall("{? = call dccps.planet_pkg.GetTopicResearcherCount(?)}");
		stmt.registerOutParameter(1, Types.INTEGER);
		stmt.setInt(2, topic.intValue());
		stmt.execute();
		return stmt.getInt(1);
	}
	public int getTopicResearcherCount(Integer topic, String stateAbbreviation)
	throws SQLException {
		stmt = conn
		.prepareCall("{? = call dccps.planet_pkg.GetTopicResearcherCount(?,?)}");
		stmt.registerOutParameter(1, Types.INTEGER);
		stmt.setInt(2, topic.intValue());
		stmt.setString(3, stateAbbreviation);
		stmt.execute();
		return stmt.getInt(1);
	}
	public void saveFeedback(String feedbackText, String email, String phone)
	throws SQLException {
		stmt = conn
		.prepareCall("{call dccps.products_order_pkg.save_feedback(?, ?, ?, ?)}");
		stmt.setString(1, feedbackText);
		stmt.setString(2, email);
		stmt.setString(3, phone);
		stmt.setString(4, "PLANET");
		stmt.execute();
	}
	*/
};
