function temperature = temperature_measurement (y)
  persistent T
  persistent dT
  T
  dT
  %clear T
  %T
  %dT
  if isempty(T)
    T = 20;
  end
  
  if isempty(dT)
    dT = 0;
  end
  fprintf('\nInside function before: T(%i) = %3.2f, dT = %3.2f y = %3.2f \n', length(T), T(end), dT, y) 
  T(end + 1) = T(end) + dT;
  dT = dT+y
  temperature = T(end);
  fprintf('\nInside function after: T(%i) = %3.2f, dT = %3.2f y = %3.2f \n', length(T), T(end), dT, y) 
end


##function temperature = temperature_measurement(y)
##
##persistent T
##persistent dT
##
##if isempty(T)
##    T = 20;
##end
##
##if isempty(dT)
##    dT = 0;
##end
##
##T(end + 1) = T(end) + dT;
##dT = dT + y;
##
##temperature = T(end);
##end