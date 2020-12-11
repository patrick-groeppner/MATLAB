function [] = Richtungsfeld(f,x_0,y_0,x_max,y_max,loesung)
%Richtungsfeld Richtungsfeld und Lösung in ein Koordinatensystem zeichnen
%   TODO
hold on
plot(loesung(:,1),loesung(:,2),'r-o'); %Lösung wird geplottet
xpoints = [x_0 : 0.5 : x_max];
ypoints = [y_0-y_max/2 : 0.5 : y_0+y_max/2];

%Startpunkte
[X,Y] = meshgrid(xpoints,ypoints);

%Endpunkte
U = meshgrid(ones(1,length(xpoints)));
V = f(X,Y); %Steigungen

quiver(X,Y,U,V);

xlabel('x');
ylabel('y');

end

