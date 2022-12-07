%number of frequencies
n = 50000;
%sampling frequency
f_sample = 2e8; %Hz
%transfer function numerator
b = [9.875702215802889e+04,6.459317537238607e+09];
%transfer function denominator
a = [1,1.844463395715939e+05,5.691593683410083e+09];
%calculate tranfer function response
[h_calc, w_calc] = freqz(b,a,n,f_sample);
%plot transfer function
figure(3)
plot(w_calc,abs(h_calc))
set(gca,'XScale','log')
set(gca,'YScale','log')
xlabel('Frequency (Hz)')
ylabel('Filter Response')

