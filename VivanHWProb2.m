% This program will  calculate  neper frequency, resnonat frequency, and roots of the characteristic
% equation of a series or parallel RLC source-free only based on the user input. It will be ask to the user if the circuit
% is in parallel as a string. Also the user will enter the values of resistor R, inductor L, and Capacitor C, as a vector.
clear
clc

Type_cir = input ('Enter if the circuit is series or parallel RLC: ','s');
RLC = input('Enter value of R, L, and C in this order as a vector:  ');
R= RLC(1);
L= RLC(2);
C = RLC(3);

switch (Type_cir)


       case 'Parallel'
        Neper_f = 1/(2*R.*C);
        Resonant_f= sqrt(1/(L.*C));
        S1= -Neper_f + sqrt((Neper_f.^2- Resonant_f^2));
        S2 = -Neper_f - sqrt((Neper_f.^2- Resonant_f^2));
        if (Neper_f > Resonant_f)
        fprintf ('Since neper frequency > Resonant frequency, circuit is overdamped with neper frequency = %5.0f rad /sec, resonant frequency = %6.3f rad /sec, and roots of the characteristic equation to be %5.4f + %5.4fi rad/sec and  %5.4f + %5.4fi rad/ sec. ',Neper_f, Resonant_f,real(S1),imag(S1), real(S2), imag(S2));

        elseif (Neper_f < Resonant_f)
        fprintf ('Since neper frequency < Resonant frequency, circuit is underdamped with neper frequency = %0.2f rad /sec, resonant frequency = %0.2f rad /sec, and roots of the characteristic equation to be %5.4f + %5.4fi rad/sec and  %5.4f + %5.4fi rad/ sec. ',Neper_f, Resonant_f,real(S1),imag(S1), real(S2), imag(S2));
        else
       fprintf ('Since neper frequency = Resonant frequency, circuit is critically damped with neper frequency = %0.2f rad /sec, resonant frequency = %0.2f rad /sec, and roots of the characteristic equation to be %5.4f + %5.4fi rad/sec and  %5.4f + %5.4fi rad/ sec.',Neper_f, Resonant_f,real(S1),imag(S1), real(S2), imag(S2));
    end

       case 'Series'

         Neper_fs = R./(2.*L);
        Resonant_fs = sqrt( 1/ (L.*C));
        S1= -Neper_fs + sqrt((Neper_fs.^2- Resonant_fs^2));
        S2 = -Neper_fs - sqrt((Neper_fs.^2- Resonant_fs^2));

         if (Neper_fs > Resonant_fs)
        fprintf ('Since neper frequency > Resonant frequency, circuit is overdamped with neper frequency = %6.0f rad /sec, resonant frequency = %0.2f rad /sec, and roots of the characteristic equation to be %5.4f + %5.4fi rad/sec and  %5.4f + %5.4fi rad/ sec. ',Neper_fs, Resonant_fs,real(S1),imag(S1), real(S2), imag(S2));

        elseif(Neper_fs < Resonant_fs)
       if (imag(S1)==0)
        fprintf ('Since neper frequency < Resonant frequency, circuit is underdamped with neper frequency = %6.0f rad /sec, resonant frequency = %6.0f rad /sec, and roots of the characteristic equation to be %6.0f rad/sec and %6.0 rad/sec. ', Neper_fs, Resonant_fs, S1,S2);
      else

     fprintf('Since neper frequency < Resonant frequency, circuit is underdamped with neper frequency = %6.0f rad /sec, resonant frequency = %6.0f rad /sec, and roots of the characteristic equation to be %6.0f + %6.0f i rad/sec and %6.0 - %6.0f i rad/sec. \n', Neper_fs, Resonant_fs, real(S1),abs(imag(S1)),real(S2),abs(imag(S2)));
      end
      else
        fprintf ('Since neper frequency = Resonant frequency, circuit is critically damped with neper frequency = %0.2f rad /sec, resonant frequency = %0.2f rad /sec, and roots of the characteristic equation to be %5.4f + %5.4fi rad/sec and  %5.4f + %5.4fi rad/ sec.',Neper_fs, Resonant_fs,real(S1),imag(S1), real(S2),imag(S2));

       end

     otherwise
          fprintf ('\n Your selection is invalid, please type only if it is Parallel or a Series circuit. ')
   end
