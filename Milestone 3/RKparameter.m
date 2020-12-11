function [m] = RKparameter(f,x_0,y_0,h)
%RKparameter Berechnung der Runge-Kutta-Parameter und damit der Steigung m
%   h ist Schrittweite, m ist Steigung

%m=eval(f(x,y)); %euler streckenzug

k1=eval(f(x_0,y_0));
k2=eval(f(x_0+0.5.*h,y_0+0.5.*h.*k1));
k3=eval(f(x_0+0.5.*h,y_0+0.5.*h.*k2));
k4=eval(f(x_0+h,y_0+h.*k3));

m=(1/6).*(k1+2.*k2+2.*k3+k4);

end

