package MySQLConnect;

import java.sql.*;

public class MySQLConnect {

    Connection conn;
    ResultSet rs;

    MySQLConnect(String connString) {
        try {
            System.out.println("Trying to connect...");
            conn = DriverManager.getConnection(connString);
            System.out.println("CONNECTION SUCCESSFUL TO JOHN'S DATABASE");
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("PROBLEM CONNECTING!");
        }
    }

    

    void ExecuteQuery(String queryString) {
        //IMPLEMENT
        //RETURN RESULT SET
        rs = null;
        try {
        	System.out.println("EXECUTING QUERY");
        	Statement st  = conn.createStatement();
        	rs = st.executeQuery(queryString);
        	System.out.println("QUERY EXECUTED");
        } catch (SQLException e) {
  
        }
    }

    void PrintResultSet() {
    	try {
    		while (rs.next()) {
    			System.out.println(rs.getString(2));
    		}
    	} catch (SQLException e) {

    	}
    	
    }
}