const int LDR=A1;
float adc_MQ, voltaje;

void setup() {
  Serial.begin(38400);
}

void loop() {
  adc_MQ = analogRead(LDR); 
  Serial.println(adc_MQ);
  delay(10);
}
