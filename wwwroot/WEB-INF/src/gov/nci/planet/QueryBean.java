package gov.nci.planet;

import java.sql.*;
import oracle.jdbc.*;
import gov.nci.util.ConnPoolBean;

public class QueryBean
{
    private static Connection conn;

    public QueryBean() throws SQLException
    {
	conn = ConnPoolBean.getConnection();
    }
    
    public void close() throws SQLException
    {
        conn.close();
    }

    public ResultSet getStateList() throws SQLException
    {
        CallableStatement stmt = conn.prepareCall("{call dccps.planet_pkg.GetStateList(?)}");
	stmt.registerOutParameter(1, OracleTypes.CURSOR);
	stmt.execute();
	return ((OracleCallableStatement)stmt).getCursor(1);
    }
    
    public ResultSet getPartners(String topic) throws SQLException
    {
        CallableStatement stmt = conn.prepareCall("{call dccps.planet_pkg.GetPartners(?, ?)}");
        stmt.setString(1, topic);
	stmt.registerOutParameter(2, OracleTypes.CURSOR);
	stmt.execute();
	return ((OracleCallableStatement)stmt).getCursor(2);
    }
    
    public ResultSet getPartners(String topic, String stateAbbreviation) throws SQLException
    {
        CallableStatement stmt = conn.prepareCall("{call dccps.planet_pkg.GetPartners(?, ?, ?)}");
        stmt.setString(1, topic);
        stmt.setString(2, stateAbbreviation);
	stmt.registerOutParameter(3, OracleTypes.CURSOR);
	stmt.execute();
	return ((OracleCallableStatement)stmt).getCursor(3);
    }
};
