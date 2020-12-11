clear all;
close all;
clc;

[f,x_0,y_0] = get_input;
[loesung,x_max,y_max]=loesung_berechnen(f,x_0,y_0);
Richtungsfeld(f,x_0,y_0,x_max,y_max,loesung);