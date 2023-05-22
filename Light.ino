#include <SoftwareSerial.h>
SoftwareSerial HM10(2, 3);
char appData;
String inData = "";
void setup() {
  HM10.begin(9600);
  for(int i = 5; i <= 13; i++) {
    pinMode(i, OUTPUT);
    digitalWrite(i, LOW);
  }
}
void loop() {  
  HM10.listen();
  while (HM10.available() > 0) { 
    appData = HM10.read();
    inData = String(appData);
  }
  if ( inData == "C") {
    for(int i = 5; i <= 13; i++) {
      digitalWrite(i, LOW);
    }
  }
  if ( inData == "1") {
    digitalWrite(5, HIGH);
  }
  if ( inData == "2") {
    digitalWrite(6, HIGH);
  }
  if ( inData == "3") {
    digitalWrite(7, HIGH);
  }
  if ( inData == "4") {
    digitalWrite(8, HIGH);
  }
  if ( inData == "5") {
    digitalWrite(9, HIGH);
  }
  if ( inData == "6") {
    digitalWrite(10, HIGH);
  }
  if ( inData == "7") {
    digitalWrite(11, HIGH);
  }
  if ( inData == "8") {
    digitalWrite(12, HIGH);
  }
  if ( inData == "9") {
    digitalWrite(13, HIGH);
  }
}
