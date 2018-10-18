#include <ESP8266WiFi.h>
#include <MySQL_Connection.h>
#include <MySQL_Cursor.h>

IPAddress server_addr(13,238,180,245);   // IP of the MySQL server
char user[] = "root";                     // MySQL user login username
char password[] = "root1234";    

WiFiClient client;
MySQL_Connection conn((Client *)&client);

void setup()
{
  int deviceID = 1;
  double val = 0; //READ SERIAL
  Serial.begin(115200);
  Serial.println();

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

  Serial.println("DB - Connecting...");
   while (conn.connect(server_addr, 3306, user, password) != true) {
     delay(500);
     Serial.print ( "." );
   }
}

void loop() {
  Serial.print("TRAME");
}
