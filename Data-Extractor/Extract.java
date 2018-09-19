

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