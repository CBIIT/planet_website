package gov.nci.util;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class ConnPoolBean {

    // Get a Logical connection
    public static Connection getConnection() throws SQLException
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
        
        return conn;
    }

}