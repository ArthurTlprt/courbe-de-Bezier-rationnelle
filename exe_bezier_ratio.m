% Points de controles
Px = [1 2 3 4 5 6 7 8];
Py = [12 10 12 1 12 10 12 10];

% Poids
Poids = [1 10 1 5 1 10 1 10 1];


t=0:0.01:1;
P=zeros(2,length(t));
% calcul de P pour tous les t € [0, 1]
for u=1:length(t)
  P(1, u) = point_bezier_ratio(t(u), Px, Py, Poids)(1)
  P(2, u) = point_bezier_ratio(t(u), Px, Py, Poids)(2)
end

plot(P(1, 1:end), P(2, 1:end));
pause(5)
