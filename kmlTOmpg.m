function [mpg] = kmlTOmpg(kml)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%1 km = 0.621371 mi
%1 L = 0.264172 gal
mpg = kml*0.621371/0.264172;
end

