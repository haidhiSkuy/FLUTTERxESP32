#if defined(ESP32)
#include <WiFi.h>
#include <FirebaseESP32.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#endif


#include <addons/TokenHelper.h>
#include <addons/RTDBHelper.h>

#define WIFI_SSID "YOUR SSID"
#define WIFI_PASSWORD "YOUR WIFI PASSWORD"

#define API_KEY "IGyAb3eR6WKWKWKNlhpW76GMsjLLLLcRL1WWKWKKnvR8rjJT"
#define DATABASE_URL "https://esp69-zza69-default-rtdb.wakanda-southeast1.firebasedatabase.app/"


//Define Firebase Data object
FirebaseData fbdo;

FirebaseAuth auth;
FirebaseConfig config;


// LCD
#include <Wire.h> // Library komunikasi I2C 
#include <LiquidCrystal_I2C.h> // Library modul I2C LCD
LiquidCrystal_I2C lcd = LiquidCrystal_I2C(0x27, 16, 2); 

// SERVO
#include <ESP32Servo.h>
Servo myservo;

//rgb LED
#define PIN_RED    16 // GIOP23
#define PIN_GREEN  17 // GIOP22
#define PIN_BLUE   5 // GIOP21

void setup()
{
  Serial.begin(115200);
  delay(2000);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

  /* Assign the api key (required) */
  config.api_key = API_KEY;
  config.database_url = DATABASE_URL;
  Firebase.begin(DATABASE_URL, API_KEY);
  Firebase.setDoubleDigits(5);





  //YOUR LED, SENSOR, SERVO, etc
  pinMode(18, OUTPUT); //LED
  myservo.attach(13); //SERVO

  pinMode(PIN_RED,   OUTPUT);
  pinMode(PIN_GREEN, OUTPUT);
  pinMode(PIN_BLUE,  OUTPUT);

  //LCD
  lcd.init();
  lcd.backlight();
}


// ################### PROGRAM RUNS HERE ###################
void loop(){
  //LED
  digitalWrite(18, LEDon());

  //SERVO
  myservo.write(servoValue()); 

  //rgb LED
  setColor(RED(), GREEN(), BLUE());

  //LCD
  lcd.clear();
  lcd.setCursor(1, 0); 
  lcd.print(LINE1()); 

  lcd.setCursor(1, 1); 
  lcd.print(LINE2());
  delay(1000);
}


// ################### FUNCTION TO READ FIREBASE DATA ###################
bool LEDon(){
  if(Firebase.ready()){
    if(Firebase.getInt(fbdo, "/LED/LED")){
      int ledStatus = fbdo.to<int>();
      if(ledStatus == 1){
        return HIGH;
      } else { 
        return LOW;
      }

    } else { 
      Serial.println(fbdo.errorReason());
    }
  }
} //end of function

int servoValue(){
  if(Firebase.ready()){
    if(Firebase.getInt(fbdo, "/SERVO/SERVO")){
      return fbdo.to<int>();
    } else { 
      Serial.println(fbdo.errorReason());
    }
  }
} //end of function


// ################### RGB LED ###################
int RED(){
  if(Firebase.ready()){
    if(Firebase.getInt(fbdo, "/RGB/RED")){
      return fbdo.to<int>();
    } else { 
      Serial.println(fbdo.errorReason());
    }
  }
} //end of function

int GREEN(){
  if(Firebase.ready()){
    if(Firebase.getInt(fbdo, "/RGB/GREEN")){
      return fbdo.to<int>();
    } else { 
      Serial.println(fbdo.errorReason());
    }
  }
} //end of function

int BLUE(){
  if(Firebase.ready()){
    if(Firebase.getInt(fbdo, "/RGB/BLUE")){
      return fbdo.to<int>();
    } else { 
      Serial.println(fbdo.errorReason());
    }
  }
} //end of function

void setColor(int R, int G, int B) {
  analogWrite(PIN_RED,   R);
  analogWrite(PIN_GREEN, G);
  analogWrite(PIN_BLUE,  B);
}


// ################### LCD WRITER ###################
String LINE1(){
  if(Firebase.ready()){
    if(Firebase.getString(fbdo, "/LCD/LINE_1")){
      return fbdo.to<String>();
    } else { 
      Serial.println(fbdo.errorReason());
    }
  }
} //end of function

String LINE2(){
  if(Firebase.ready()){
    if(Firebase.getString(fbdo, "/LCD/LINE_2")){
      return fbdo.to<String>();
    } else { 
      Serial.println(fbdo.errorReason());
    }
  }
} //end


