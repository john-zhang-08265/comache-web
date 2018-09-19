import java.sql.*;

class MySQLConnect {

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


/*
NEEDS TO:
-EXTRACT DATA FROM THE DATABASE
-AGGREGATE INTO PROPER FORMATING
-DECIDE ON THE TYPE OF SERVER RUNNING IN THE BACKGROUND
-POSSIBLY HAVE AN EC3 INSTANCE RUNNING THE APACHE WEBSERVER, OR NGINX SERVER
*/

class Extract {
    public static void main(String args[]) {

        //String connString = "jdbc:mysql://johns-aws-rds.cuntunfadttt.ap-southeast-2.rds.amazonaws.com/mysql?useSSL=false&user=root&password=root1234";
        String connString = "jdbc:mysql://127.0.0.1:3306/sensor_db?useSSL=false&user=root&password=root1234";

        MySQLConnect conn = new MySQLConnect(connString);

        String queryString = "SELECT * FROM lightSensor";

        conn.ExecuteQuery(queryString);
        conn.PrintResultSet();

    }
}
