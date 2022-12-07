//const int LDR = A1;
//float adc_MQ;
int F = 1;                                                   //frequency of the signal
int Fs = 500;                                                //sampling frequency
int n = 500;                                                 //number of samples
float t;                                                     //Time instance
int sampling_interval;
byte samples[500];                                           // to store the samples

void setup() {
  //Serial.begin(9600);
  pinMode(10, OUTPUT);
  for (int n = 0; n < 500; n++)
  {
    t = (float) n / Fs;                                       //creating time isntance to find the 500 samples
    samples[n] = (byte) (127.0 * sin(2 * 3.1415926535897932384626433832795 * t) + 127.0 ); //calculating the sin value at each time instance
  }
  sampling_interval = 1000000 / (F * n);                      
  //sampling interval Ts = 1/frequency x number of sample (Ts = 1/Fn or Ts = T/n)x1000000 to convert it in µS
}

void loop() {
  for (int j = 0; j < 500; j++) {
    analogWrite(10, samples[j]);
    delayMicroseconds(sampling_interval);   // 2 ms en este caso //time interval
  }
  
  
}
