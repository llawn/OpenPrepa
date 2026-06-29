#import "_lib.typ": *

= Trigonométrie

#note[Ce chapitre présente les fonctions trigonométriques classiques :
sinus, cosinus, tangente et leurs propriétés fondamentales]

#definition(title: "Fonction inverse")[
  Définition de la *sécante, cosécante et cotangente*:
  $
    sec &= 1/sin quad quad csc &= 1/cos quad quad cot &= 1/tan = cos/sin
  $
]

#propriete(title: "Valeurs remarquables")[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    []     , [$0$], [$pi/12$]            , [$pi/8$]             , [$pi/6$]      , [$pi/4$]     , [$pi/3$]     , [$(3pi)/8$]            , [$(5pi)/12$]           , [$pi/2$],
    [$sin$], [$0$], [$sqrt(2-sqrt(3))/2$], [$sqrt(2-sqrt(2))/2$], [$1/2$]       , [$sqrt(2)/2$], [$sqrt(3)/2$], [$sqrt(2+sqrt(2))/2$], [$sqrt(2+sqrt(3))/2$], [$1$]   ,
    [$cos$], [$1$], [$sqrt(2+sqrt(3))/2$], [$sqrt(2+sqrt(2))/2$], [$sqrt(3)/2$] , [$sqrt(2)/2$], [$1/2$]      , [$sqrt(2-sqrt(2))/2$], [$sqrt(2-sqrt(3))/2$], [$0$]   ,
    [$tan$], [$0$], [$2-sqrt(3)$]        , [$sqrt(2)-1$]        , [$sqrt(3)/3$] , [$1$]        , [$sqrt(3)$]  , [$sqrt(2)+1$]       , [$2+sqrt(3)$]         , [$+oo$]   ,
  )
]

#propriete(title: "Relations entre fonctions trigonométriques")[

  Sur $0<theta<pi/2$ (éventuellement valable au bord)

  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    []   , [sin]                              , [cos]                              , [tan],
    [sin], []                                 , [$sqrt(1-cos^2(theta))$]           , [$tan(theta)/sqrt(1+tan^2(theta))$],
    [cos], [$sqrt(1-sin^2(theta))$]           , []                                 , [$1/sqrt(1+tan^2(theta))$],
    [tan], [$sin(theta)/sqrt(1-sin^2(theta))$], [$sqrt(1-cos^2(theta))/cos(theta)$], [],
  )
]

#propriete(title: "Cercle unité")[
  $ cos^2+sin^2 = 1 $
  $ 1 + tan^2 = 1/cos^2 $
  $ x^2+y^2 = 1 <=> exists theta in RR, cases( x = cos(theta), y= sin(theta)) $
  $ alpha sin(x) + beta cos(x) = sqrt(alpha^2+beta^2) sin(x + phi) "où " cases( phi = arctan(beta/alpha) &"si" alpha > 0, phi = arctan(beta/alpha) + pi &"sinon") $
]

#propriete(title: "Réflexions")[
  Réflexion d'axe $x=0$ *(Parité)*; $x=pi/4$; $x=pi/2$
  $
    sin(-x) &= -sin(x) &&quad quad sin(pi/2-x) = cos(x) &&quad quad sin(pi-x) = sin(x) \
    cos(-x) &= cos(x)  &&quad quad cos(pi/2-x) = sin(x) &&quad quad cos(pi-x) = -cos(x) \
    tan(-x) &= -tan(x) &&quad quad tan(pi/2-x) = cot(x) &&quad quad tan(pi-x) = -tan(x)
  $
]

#propriete(title: "Dérivées")[
  $
    sin'(x) &= cos(x) quad quad cos'(x) &= -sin(x) quad quad tan'(x) &= 1 + tan^2(x) = 1 / (cos^2(x))
  $
]

#propriete(title: "Formules d'addition")[
  $
    sin(x + y) &= sin(x) cos(y) + cos(x) sin(y) \
    cos(x + y) &= cos(x) cos(y) - sin(x) sin(y) \
    tan(x + y) &= (tan(x) + tan(y)) / (1 - tan(x) tan(y)) \
  $
]

#propriete(title: "Formules de duplication")[
  $
    sin(2x) &= 2 sin(x) cos(x) \
    cos(2x) &= cos^2(x) - sin^2(x) = 2 cos^2(x) - 1 = 1 - 2 sin^2(x) \
    tan(2x) &= (2 tan(x)) / (1 - tan^2(x))
  $
]

#propriete(title: "Formules de factorisation")[
  $
    sin(x) + sin(y) &= 2  sin((x + y)/2) cos((x - y)/2) \
    cos(x) + cos(y) &= 2  cos((x + y)/2) cos((x - y)/2) \
    tan(x) + tan(y) &= sin(x+y)/(cos(x) cos(y))
  $
]


#propriete(title: "Formules de linéarisation")[
  $
    sin(x) cos(y) &= 1/2 [sin(x + y) + sin(x - y)] \
    cos(x) cos(y) &= 1/2 [cos(x + y) + cos(x - y)] \
    sin(x) sin(y) &= 1/2 [cos(x - y) - cos(x + y)]
  $
]

#propriete(title: "Formules de réduction du carré")[
  $
    sin^2(x) &= (1 - cos(2x)) / 2 quad quad cos^2(x) &= (1 + cos(2x)) / 2 quad quad tan^2(x) &= (1 - cos(2x)) / (1+ cos(2x))
  $
]

#propriete(title: "Formule de l'angle moitié")[
  $
    | sin(x/2) | = sqrt((1-cos(x))/2) \
    | cos(x/2) | = sqrt((1+cos(x))/2) \
    tan(x/2) = sin(x)/(1+cos(x)) = (1 - cos(x))/sin(x)
  $
  $ tan((x+y)/2) = (sin(x) + sin(y))/(cos(x) + cos(y)) = - (cos(x) - cos(y))/(sin(x)-sin(y)) $
]

#propriete(title: "Formules de l'arc moitié")[
  Si $u= tan(x/2)$\
  Alors,
  $ u = sin(x) / (1 + cos(x)) = ( 1 - cos(x)) / sin(x) $
  $ u^2 = (1 - cos(x))/(1+cos(x)) quad quad ((1-u)/(1+u))^2 = (1 - sin(x))/(1+sin(x)) $
  $ sin(x) = (2 u)/(1+u^2) quad quad cos(x) = (1 - u^2)/(1+u^2) quad quad tan(x) = (2 u)/(1-u^2) $
  $ d x = (2 d u)/(1+u^2) $
]

#propriete(title: "Formules d'Euler")[
  $
    sin(x) &= (e^(i x) - e^(-i x))/(2 i) &&= - i sinh(i x) \
    cos(x) &= (e^(i x) + e^(-i x))/2 &&= cosh(i x) \
    tan(x) &= i (1 - e^(2 i x))/(1 + e^(2 i x)) &&= - i tanh(i x)
  $
]

#propriete(title: "Formule de De Moivre")[
  $ cos(x) + i sin(n x)  = (cos(x) + i sin(x))^n $
]
