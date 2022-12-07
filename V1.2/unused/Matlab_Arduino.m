function Matlab_Arduino(numero_muestras,delay,puerto)

% Matlab + Arduino Serial Port communication


close all;
clc;
y=zeros(1,1000); %Vector donde se guardarán los datos
%Inicializo el puerto serial que utilizaré
delete(instrfind({'Port'},{puerto}));
puerto_serial=serial(puerto);
puerto_serial.BaudRate=9600;
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

%Abro el puerto serial
fopen(puerto_serial); 

%Declaro un contador del número de muestras ya tomadas
contador_muestras=1;

%Creo una ventana para la gráfica
figure('Name','Serial communication: Matlab + Arduino.')
title('SERIAL COMMUNICATION MATLAB+ARDUINO');
xlabel('Tiempo[s]');
ylabel('Voltaje (V)');
ylim([0 5.1]); 
grid on;
hold on;

%Bucle while para que tome y dibuje las muestras que queremos
while contador_muestras<=numero_muestras
        ylim([0 5.1]); 
        xlim([(contador_muestras-20)/delay (contador_muestras+5)/delay]);
        valor_potenciometro=fscanf(puerto_serial,'%d')';
        %y(contador_muestras)=(valor_potenciometro(1));
        y(contador_muestras)=(valor_potenciometro(1))*5/1024;
        plot(contador_muestras/delay,y(contador_muestras),'X-r');        
        drawnow
        contador_muestras=contador_muestras+1;
end

%Cierro la conexión con el puerto serial y elimino las variables
fclose(puerto_serial); 
delete(puerto_serial);
clear all;

end

