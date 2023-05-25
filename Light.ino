#include <SoftwareSerial.h>
#include <LiquidCrystal_I2C.h>

SoftwareSerial HM10(2, 3);
LiquidCrystal_I2C lcd(0x27, 16, 2);

char appData;

String systemChange = "";
String appString = "";

void setup() {
  HM10.begin(9600);
  HM10.setTimeout(100);

  for(int i = 5; i <= 13; i++) {
    pinMode(i, OUTPUT);
    digitalWrite(i, LOW);
  }

  pinMode(4, INPUT);

  lcd.init();
  lcd.backlight();
  lcd.clear();
}
void loop() {  
  HM10.listen();

  while (digitalRead(4) == LOW) { 
    appData = HM10.read();
    appString = String(appData);
    LEDEffect(appString);
    if (appString == "\n") {
      break;
    }
  }

  while (digitalRead(4) == HIGH) {
    appString = "";
    appString = HM10.readString();
    lcd.setCursor(0, 0);
    lcd.print(appString);
  }
}

void LEDEffect(String ledData) {
  if (ledData == "0") {
    for(int i = 5; i <= 13; i++) {
      digitalWrite(i, LOW);
    }
  }
  if (ledData == "1") {
    digitalWrite(5, HIGH);
  }
  if (ledData == "2") {
    digitalWrite(6, HIGH);
  }
  if (ledData == "3") {
    digitalWrite(7, HIGH);
  }
  if (ledData == "4") {
    digitalWrite(8, HIGH);
  }
  if (ledData == "5") {
    digitalWrite(9, HIGH);
  }
  if (ledData == "6") {
    digitalWrite(10, HIGH);
  }
  if (ledData == "7") {
    digitalWrite(11, HIGH);
  }
  if (ledData == "8") {
    digitalWrite(12, HIGH);
  }
  if (ledData == "9") {
    digitalWrite(13, HIGH);
  }
}
