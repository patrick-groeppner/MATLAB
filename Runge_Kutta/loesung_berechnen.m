function [loesung,x_max,y_max] = loesung_berechnen(f,x_0,y_0)
%loesung_berechnen Lösung der DGL wird berechnet
% die lösung besteht aus zwei vektoren, zusammengefasst zu einer 2 x n
% matrix, die später geplottet wird
x_min=x_0-10;
x_max=x_0+10;
y_min=y_0-10;
y_max=y_0+10;

%wir müssen uns nicht vorher auf eine bestimmte Vektorlänge festlegen, wir
%hängen einfach immer wieder was an, bis wir fertig sind 
%-> aber wird das Programm dann nicht langsamer?

%hmm, müsste man ausprobieren. Ich glaube, bei dieser Rechnung ist das
%unerheblich.

loesung=[x_0,y_0];


h=1; %Schrittweite
k=1;
q=0;
x=x_0;
y=y_0;

while (x_min <= x) && (x <= x_max) && (y_min <= y) && (y <= y_max) && (k <= 2000)
    
    %Schrittweitenkontrolle
    while true
        
        %hier war der erste Fehler - x und y einsetzen, nicht x_0 und y_0!!
        m=RKparameter(f,x,y,h);
        x_1=x+h;
        y_1=y+m.*h;
        
        % mit "eval" an dieser Stelle wirds schneller
        q=eval(abs(f(x,y)-f(x_1,y_1)));
    
        if (q > 0.2)
            h=h./2;
        elseif (q < 0.05)
           
            % hier war der zweite Fehler: wenn q zu klein ist, wird der
            % Schritt trotzdem gemacht, sonst können Sie in einer
            % Endlos-Schleife landen, wo q abwechselnd zu klein und zu groß
            % ist
             m=RKparameter(f,x,y,h);
             x_1=x+h;
             y_1=y+m.*h;
              loesung = [loesung;x_1,y_1];
              y=y_1;
            x=x_1;
             h=h.*2;
        end
    % Wenn y-Differenz der letzten zwei Punkte zwischen 0.05 und 0.2 liegt 
    % wird Schrittweitenkontrolle beendet
        if ((0.05 <= q) && (q <= 0.2))
            break
        end
    end
    
    loesung = [loesung;x_1,y_1];
    
    k=k+1; %laufparameter zum prüfen ob maximale Anzahl der Rechenschritte überschritten wurde
    
    y=y_1;
    x=x_1;
end

end