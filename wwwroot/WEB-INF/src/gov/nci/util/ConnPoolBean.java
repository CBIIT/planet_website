package gov.nci.util;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class ConnPoolBean {

	private static int count = 0;

    // Get a Logical connection
    public static synchronized Connection getConnection() throws SQLException
    {
        //return occi.getConnection();
		Connection conn = null;

        try {
            Context ctx = (Context) new InitialContext().
                 lookup("java:comp/env");
			javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("jdbc-ds");
            conn = ds.getConnection();
        }
        catch (Exception e) {
            e.printStackTrace(System.err);
            throw new SQLException();
        }
        count++;
        System.out.println("GET:" + count);
        return conn;
    }

    public static synchronized boolean closeConnection(Connection conn) throws SQLException {
    	
    	if (!conn.isClosed()){
    		conn.close();
        	count--;
            System.out.println("PUT:" + count);
    	}
    	conn = null;
    	return true;
    	
    }

}