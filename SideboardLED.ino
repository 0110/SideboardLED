/*
   Fuses:
   avrdude -c avrispmkii -p atmega8 -U lfuse:w:0xee:m -U hfuse:w:0xd9:m -U efuse:w:0xfc:m

   Arduino Settings:
   Board: Arduino NG / or older
   Processor: Atmega8
*/

#include <FastLED.h>

/****************** LED output ***********************/

#define LED_PIN     3

// Information about the LED strip itself
#define NUM_LEDS    45  /* aka 75cm at 60LEDs per 100cm */
#define CHIPSET     WS2812
#define COLOR_ORDER GRB
CRGB leds[NUM_LEDS];
CRGBSet ledset(leds, NUM_LEDS);

#define BRIGHTNESS  128   /** Average brightness, that shall not exeeded */
#define FADEBLACK   -2

/****************** Command line ***********************/
int CMD_MAX = 128;
char myCmd[128];

void setup() {
  // start serial port at 9600 bps:
  Serial.begin(9600);
  Serial.println("Sideboard LED running...");
  // It's important to set the color correction for your LED strip here,
  // so that colors can be more accurately rendered through the 'temperature' profiles
  FastLED.addLeds<CHIPSET, LED_PIN, COLOR_ORDER>(leds, NUM_LEDS);

  //TODO: Can this line be removed?
  //FastLED.setBrightness( BRIGHTNESS );

  
  // Turn the LED on, then pause
  leds[0] = CRGB::Red;
  FastLED.show();
  delay(500);
  // Now turn the LED off, then pause
  leds[0] = CRGB::Black;
  FastLED.show();
  delay(500);
}

void clearCmdArray(){
  //clear the cmd array
  for (int i = 0; i < CMD_MAX; i++){
    myCmd[i] = '\0';
  }
}

  //returns number of read bytes
  int readFromSerialIntoCmdArray(){ 
  //read from the serial buffer and flush
  int inputSize = Serial.available();
  
  //give serial a chance to receive all bytes
  if(inputSize > 0){
    delay(100);
    inputSize = Serial.available();
  }
  
  if(inputSize > 0 && inputSize < CMD_MAX){
    Serial.print("inputSize: ");
    Serial.println(inputSize);
    for (int i = 0; i < inputSize; i++){
      myCmd[i] = Serial.read();
    }
  }else if(inputSize >= CMD_MAX){
   Serial.flush();
   Serial.println("too much data, flush");
  }
  return inputSize;
}

//check if command has the required prefix
int checkCmdArrayForPrefix(){
   if (myCmd[0] == 'o'
     && myCmd[1] == 'l'
     && myCmd[2] == 'l'
     && myCmd[3] == 'p'
     && myCmd[4] == 'e'){
      return 1;
   }
  return 0;
}

void sendAckOverSerial(){
  Serial.println(F("ACK"));
}

void sendNackOverSerial(){
  Serial.println(F("NACK"));
}

void sendPingAckOverSerial(){
  Serial.println(F("PACK"));
}


void loop() { 
  /* spcial rainbow mode */
  static long rainbowIndex = -1;
  static CRGB color;
  if (rainbowIndex < 0) {
    //delay needed to have a chance to get the whole message
    delay(200);
    clearCmdArray();
    if (rainbowIndex == FADEBLACK) {
      ledset.fadeToBlackBy(40);
    }
    FastLED.show();
  } else {
    if (rainbowIndex >= 256) {
      /* one byte used -> simulate overflow */
      rainbowIndex=0;
    }
    ledset.fill_rainbow(rainbowIndex++);
    FastLED.delay(30);
  }
 
  int inputSize = readFromSerialIntoCmdArray();
  if (inputSize > 0)
  {
    rainbowIndex=-1; /* command -> deactivate rainbow */
    int checkCmd = checkCmdArrayForPrefix();
    if(checkCmd == 0){
       Serial.println(F("if you dont know what to do type \"ollpehelp\""));
       sendNackOverSerial();
       return; 
    } else if(myCmd[5] == 'p' 
            && myCmd[6] == 'i' 
            && myCmd[7] == 'n' 
            && myCmd[8] == 'g')
    {
       sendPingAckOverSerial();
    }
    else if(myCmd[5] == 'h' 
            && myCmd[6] == 'e' 
            && myCmd[7] == 'l' 
            && myCmd[8] == 'p')
    {
       sendHelpOverSerial();
    }
    else if(myCmd[5] == 'a')
    {
      parseColor(myCmd+6, &color);
      Serial.print("RGB:");
      Serial.print(color.r);
      Serial.print(";");
      Serial.print(color.g);
      Serial.print(";");
      Serial.println(color.b);
      ledset.fill_solid(color);
      sendAckOverSerial();
    }
    else if(myCmd[5] == 'c')
    {
      rainbowIndex = FADEBLACK;
      sendAckOverSerial();
    }
    else if(myCmd[5] == 'm')
    {
      rainbowIndex=0; /* activate rainbow */
      Serial.println(F("Rainbow started"));
      sendAckOverSerial();
    }
    else if(myCmd[5] == 'w')
    {
      int index = (myCmd[6]-'0') * 10 + (myCmd[7]-'0');
      if (index > NUM_LEDS) {
        Serial.println(F("Index too large"));
        sendNackOverSerial();
      } else {
        parseColor(myCmd+8, &color);
        leds[index] = color;
        sendAckOverSerial();
      }
    }
    else if(myCmd[5] == 'r')
    {
      int index = (myCmd[6]-'0') * 10 + (myCmd[7]-'0');
      if (index > NUM_LEDS) {
        Serial.println(F("Index too large"));
        sendNackOverSerial();
      } else {
       Serial.println(leds[index]);
      }
    }
  }
}

/**
 * Extract the color from the given LED command
 */
void parseColor(char* pCmd, CRGB *pColor) {
  unsigned int colorParts[3]; /* 0: red, 1: green, 2: blue */
  unsigned long colorSum = 0;
  for(int i=0; i < (2*3); i+= 2) {
    Serial.print(pCmd[i]);Serial.print(" and "); Serial.println(pCmd[i+1]);
    colorParts[i/2] = (pCmd[i] <= '9') ? ((pCmd[i]-'0') << 4) : (((pCmd[i]-'A')+10) << 4);
    if (colorParts[i/2] < 0) { Serial.print("calcErr:"); Serial.println(colorParts[i/2]); }
    colorParts[i/2] += (pCmd[i+1] <= '9') ? ((pCmd[i+1]-'0')) : (((pCmd[i+1]-'A')+10));
  }
  pColor->r = colorParts[0]; /* fill red */
  pColor->g = colorParts[1]; /* fill green */
  pColor->b = colorParts[2]; /* fill blue */

  colorSum = pColor->r;
  colorSum += pColor->g;
  colorSum += pColor->b;
  /* Generate the average brightness */
  colorSum = (colorSum / 3);
  Serial.print("sum:");
  Serial.println(colorSum);
  if (colorSum > BRIGHTNESS) {
    /* scale the brightness, if the values are too high */
    pColor->r = pColor->r * BRIGHTNESS / colorSum;
    pColor->g = pColor->g * BRIGHTNESS / colorSum;
    pColor->b = pColor->b * BRIGHTNESS / colorSum;
  }
}

/*
 * Give the user some helpfull advice.
 * (Text is stored in the flash to save RAM of the Arduino)
 */
void sendHelpOverSerial()
{
  Serial.println(F("----help is coming----"));
  Serial.println(F("all commands must be prefixed with \"ollpe\""));
  Serial.println(F("----commands----"));
  Serial.println(F("axxxxxx\t set all leds to RRGGBB (hex: 0-9A-F)"));
  Serial.println(F("w00xxxxxx\t set led 0 (first) to RRGGBB (hex: 0-9A-F)"));  
  Serial.println(F("r00\t returns state of led 0 (first)"));
  Serial.println(F("c\t clear all leds (000000h)"));
  Serial.println(F("m\t magic rainbow for all leds until next command is received"));
  Serial.println(F("ping\t returns \"PACK\""));
  Serial.println(F("help\t prints this help"));
  Serial.println(F("----help end----"));
}
