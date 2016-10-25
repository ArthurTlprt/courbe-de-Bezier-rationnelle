% Retourne un point P de la courbe de bézier rationelle
function P = point_bezier_ratio(t, PtControleX, PtControleY, Poids)
  n = length(PtControleX);

  Px = 0;  % Px correspond à l'abicisse du point P
  % calcul du numerateur
  for i=1:n
    PtControleX(i);
    Px = Px + Poids(i)*PtControleX(i)*base_bernstein(i-1, n-1, t);
  end
  % puis calcul du denominateur
  denumerateur = 0;
  for i=1:n
    denumerateur = denumerateur + Poids(i)*base_bernstein(i-1, n-1, t);
  end
  Px = Px/denumerateur;

  Py = 0;  % Py correspond à l'abicisse du point P
  % calcul du numerateur
  for i=1:n
    Py = Py + Poids(i)*PtControleY(i)*base_bernstein(i-1, n-1, t);
  end
  % puis calcul du denominateur
  denumerateur = 0;
  for i=1:n
    denumerateur = denumerateur + Poids(i)*base_bernstein(i-1, n-1, t);
  end
  Py = Py/denumerateur;

  P = [Px, Py];
end
