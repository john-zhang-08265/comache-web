#include <ESP8266WiFi.h>
#include <MySQL_Connection.h>
#include <MySQL_Cursor.h>

//TO DO:
//Get time
//Set up LM35 logic
//Write to database

IPAddress server_addr;   // IP of the MySQL server
const char* endpoint = "johns-rds.cuntunfadttt.ap-southeast-2.rds.amazonaws.com";
char user[] = "root";                     // MySQL user login username
char password[] = "root1234";    

WiFiClient client;
MySQL_Connection conn((Client *)&client);

int temperaturePin = 0;

void setup()
{

  Serial.begin(115200);
  Serial.println();

  //Read temperature data and time stamp (Using a moving average filter)
  Serial.println("Reading Values...");
  double sum = 0;
  for (int i = 0; i < 10; i++) {
    int quantVal = analogRead(temperaturePin);
    double rawVal = ((double)quantVal * 3.3)/1024;
    sum += rawVal;
  }
  double finalVal = sum/5.0;

  //MIGHT NEED TO CHANGE CALIBRATION PARAMETERS
  double val = finalVal/10.0;
  


  //Store data in buffer

  //Connect to Wifi
  WiFi.begin("SPARK-PRR97E", "QVYJACQX39");
  Serial.print("Connecting");
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(1000);
    Serial.print(".");
  }
  Serial.println();
  Serial.print("Connected, IP address: ");
  Serial.println(WiFi.localIP());

  //Ping RDS endpoint for IP address
  WiFi.hostByName(endpoint, server_addr);

  //Connect to AWS RDS through IP address
  if (server_addr) {
    Serial.print("DB - Connecting... to IP ");
    Serial.println(server_addr);
    while (conn.connect(server_addr, 3306, user, password) != true) {
      delay(1000);
      Serial.print ( "." );
    }
    Serial.print('CONNECTED TO AWS RDS INSTANCE');
    //WRITE TO DATABASE
    String macAddr = WiFi.macAddress();

    char USE_DB[] = "USE SmartHome_DEV";
    char INSERT_SQL[] = "INSERT INTO DeviceValue VALUES"; //COMPLETE

    MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
    cur_mem->execute(USE_DB);
    Serial.println("Database Selected");
    //cur_mem->execute(INSERT_SQL);
    delete cur_mem;

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
