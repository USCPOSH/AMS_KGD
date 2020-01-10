function [out,fig] = specXyce(file)
out  =    plotXyce('test_aafilter.cir.prn', 0);
N = 101;
t1 = [4e-6: 4e-6/N: 8e-6];
v1 = interp1(  out.data(:, 2) , out.data(:, 7), t1(1:end-1).' );
xf = fft(v1)/N;
xf1 = [xf(1) ,  xf(2:(N+1)/2).'*2];
xf2 = 20*log10( abs(xf1) );
IM3 = xf2(13) - xf2(15);
freqs = [0: 1/4e-6: 25/4e-6 ]; 
%plot(freqs(1:26),  xf2(1:26) );
bar(freqs(1:26),  xf2(1:26), 0.2 );
% The N is the number of time points to sample the time domain waveform. N=101 produce IM3 around 69dB. 
% If you use N=71, IM3 = 66.8dB. IM3 = 66.86dB in their slides. 
