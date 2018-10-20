#include <ESP8266WiFi.h>
#include <MySQL_Connection.h>
#include <MySQL_Cursor.h>

//TO DO:
//Get time
//Set up LM35 logic
//Write to database

IPAddress server_addr;   // IP of the MySQL server
String endpoint;
char user[] = "root";                     // MySQL user login username
char password[] = "root1234";    

WiFiClient client;
MySQL_Connection conn((Client *)&client);


void setup()
{

  Serial.begin(115200);
  Serial.println();

  //Read temperature data and time stamp (Using a moving average filter)
  int deviceID = 1;
  double val = 0; //READ SERIAL
  double rawVal = 0;

  //Store data in buffer

  //Connect to Wifi
  WiFi.begin("SPARK-PRR97E", "QVYJACQX39");
  Serial.print("Connecting");
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println();
  Serial.print("Connected, IP address: ");
  Serial.println(WiFi.localIP());

  //Ping RDS endpoint for IP address
  Wifi.hostByName(endpoint, server_addr);

  //Connect to AWS RDS through IP address
  if server_addr {
    Serial.println("DB - Connecting...");
    while (conn.connect(server_addr, 3306, user, password) != true) {
      delay(1000);
      Serial.print ( "." );
    }
    Serial.print('CONNECTED TO AWS RDS INSTANCE');
    //WRITE TO DATABASE
    String macAddr = Wifi.macAddress();

  } else {
    //If either wifi or database fails to connect, store in buffer
  }
  //If sucess, purge buffer
  //
  //Sleep
  


  

  

  

  

  

  
}

void loop() {
  Serial.print("TRAME");
}
