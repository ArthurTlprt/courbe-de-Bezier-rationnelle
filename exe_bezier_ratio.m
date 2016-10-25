
disp('Click gauche pour insérer les points de contrôle et click droit pour le dernier et terminer.');
tasto=1;
figure;
axis([0 10 0 10 ]);
grid on;
hold on;

x=[];y=[];
%t=input('valeur de t*: ');
while tasto == 1
  [xi,yi,tasto]=ginput(1);
  plot (xi,yi,'r*');
  x= [x xi];
  y= [y yi];
end
n = length(x);
% Points de controles
Px = x;
Py = y;




% Poids
Poids = [];
for i=0:length(Px)-1
  fprintf('Quel est le poid du point %d?', i)
  p = input('')
  Poids(end+1) = p
end


t=0:0.01:1;
P=zeros(2,length(t));
% calcul de P pour tous les t € [0, 1]
for u=1:length(t)
  P(1, u) = point_bezier_ratio(t(u), Px, Py, Poids)(1);
  P(2, u) = point_bezier_ratio(t(u), Px, Py, Poids)(2);
end

plot(P(1, 1:end), P(2, 1:end));
pause(3)

continuer = (input('Voulez vous modifier un poids?', 's') == 'oui');
while continuer == 1
  % Poids
  Poids = [];
  for i=0:length(Px)-1
    fprintf('Quel est le poid du point %d?', i)
    p = input('')
    Poids(end+1) = p
  end

  t=0:0.01:1;
  P=zeros(2,length(t));
  % calcul de P pour tous les t € [0, 1]
  for u=1:length(t)
    P(1, u) = point_bezier_ratio(t(u), Px, Py, Poids)(1);
    P(2, u) = point_bezier_ratio(t(u), Px, Py, Poids)(2);
  end
  plot(P(1, 1:end), P(2, 1:end));
  pause(3)
  continuer = (input('Voulez vous modifier un poids?', 's') == 'oui');
end
