function [f,x_0,y_0] = get_input()
%get_input Eingabe der DGL und Startwerte
%   TODO
syms x y;
ff=input('Geben Sie die rechte Seite der Gleichung dy=f(x,y) ein: ');
%Aus dem Ausdruck ff muss man zuerst eine Funktion machen, in die man was einsetzen kann:  
f = @(xx,yy) subs(ff,{x,y},{xx,yy});
x_0=input('Geben Sie den Startwert für die x-Abszisse ein: ');
y_0=input('Geben Sie den Startwert für die y-Abszisse ein: ');

end

