package gov.nci.util;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import oracle.jdbc.pool.*;

public class ConnPoolBean {
	
	private static int count = 0;

    // Get a Logical connection
    public static synchronized Connection getConnection() throws SQLException
    {
		if (null!=occi)
		{
			return occi.getConnection();
		}
        //return occi.getConnection();
		Connection conn = null;

        try {
            Context ctx = (Context) new InitialContext().
                 lookup("java:comp/env");
			javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("jdbc-ds");
            conn = ds.getConnection();
            count++;
            System.out.println("GET:" + count + "  THREAD:" + Thread.currentThread().getName());
        }
        catch (Exception e) {
            e.printStackTrace(System.err);
            throw new SQLException();
        }
        return conn;
    }
    
    public static synchronized boolean closeConnection(Connection conn) throws SQLException {
    	
    	if (!conn.isClosed()){
    		conn.close();
            System.out.println("PUT:" + count + "  THREAD:" +  Thread.currentThread().getName());
            count--;
    	}
    	conn = null;
    	return true;
    	
    }


	/* suppport for previous version of connection pooling */

	private static OracleConnectionPoolDataSource ocpds;
    private static OracleConnectionCacheImpl occi;

    public static void init(String driver, String username,
                            String password, int minLimit) throws SQLException
    {
        ocpds = new OracleConnectionPoolDataSource();

        ocpds.setURL(driver);
        ocpds.setUser(username);
        ocpds.setPassword(password);

        // Create a pooled connection
        occi = new OracleConnectionCacheImpl(ocpds);
        occi.setMinLimit(minLimit);
    }


    public static void init(String driver, String username,
                            String password, int minLimit, int maxLimit) throws SQLException
    {
        ocpds = new OracleConnectionPoolDataSource();

        ocpds.setURL(driver);
        ocpds.setUser(username);
        ocpds.setPassword(password);

        // Create a pooled connection
        occi = new OracleConnectionCacheImpl(ocpds);
        occi.setMinLimit(minLimit);
        occi.setMaxLimit(maxLimit);
    }

    // Close the pooled connection
    protected void finalize() throws SQLException
    {
		if (null!=occi)
		{		
			occi.close();
			occi = null;
		}
    }
}