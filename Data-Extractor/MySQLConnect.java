

import java.sql.*;
import java.io.*;

import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.core.*;

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
        rs = null;
        try {
        	System.out.println("EXECUTING QUERY");
        	Statement st  = conn.createStatement();
        	rs = st.executeQuery(queryString);
        	System.out.println("QUERY EXECUTED");
        } catch (SQLException e) {
  
        }
    }


    void AddToJson(int timeCol, int dataCol) {
        try {
            Array timeArr = rs.getArray(timeCol);
            Array dataArr = rs.getArray(dataCol);

            try {
            	ObjectMapper objectMapper = new ObjectMapper();
            	//NEED TO CHANGE THIS
            	objectMapper.writeValue(new File("/../Json-Resources/car.json"), timeArr);
            } catch (IOException ioe) {
            	System.out.println("ERROR WRITING JSON");
            }
            

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