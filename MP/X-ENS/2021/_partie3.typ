#import "_lib.typ": *

== 3. Trace des éléments d'un $p$-sous-groupe de $bold("GL")_n (ZZ)$ <Partie3>

#note[
  Soit $p$ un nombre premier et $r>=1$ un entier.
  Dans cette partie, on suppose que $G$ est un sous-groupe de cardinal $p^r$ de $bold("GL")_n (ZZ)$.
  Le but de cette partie, est de déterminer l'ensemble des valeurs possibles pour les traces des éléments de $G$.
]

#question[ Soit $ell$ un nombre premier.

  #subquestion[
    Démontrer que pour tout $1 <= k <= ell -1$, l'entier $binom(ell, k)$ est multiple de $ell$.
  ]

  #subquestion[
    Soit $R$ un anneau. On note $ell R = { ell x, x in R}$.
    Démontrer que pour tous $x,y in R$ tels que $x y = y x$, on a
    $(x+y)^ell-(x^ell+y^ell) in ell R$.
  ]
]

#question[
  Soit $R$ un anneau commutatif, et soit $I$ un idéal de $R$.
  Soient $n in NN^*$ et $A,B in cal(M)_n (R)$.
  On suppose que tous les coefficients de $B$ sont dans l'idéal $I$.
  
  Démontrer que $det(A+B)-det(A) in I$.
]

#question[
  Soit $ell in NN$, un nombre premier. Démontrer que pour tout polynôme $P in ZZ[X]$,
  on a:
  $ P(X^ell)-P(X)^ell in ell ZZ[X]. $
]

#question[
  Soit $M in cal(M)_n(ZZ)$, et soit $ell in NN$ un nombre premier.

  #subquestion[
    Justifier qu'il existe $A in cal(M)_n (ZZ[X])$ telle que
    $(X I_n - M)^ell - (X^ell I_n - M^ell) = ell A$.
  ]

  #subquestion[
    Démontrer que $chi_(M^ell) (X^ell) - chi_M (X)^ell in ell ZZ[X]$.
  ]

  #subquestion[
    En déduire que $"Tr"(M^ell) equiv n med (mod ell)$.
  ]
]

#question[
  Soit $g in G$. Démontrer que $"Tr"(g) equiv n med (mod p)$.
]

#question[
  Soit $g in G$ et soit $ell$ un nombre premier.
  On suppose que $ell > 2 n$.
  Démontrer que $"Tr"(g^ell) = "Tr"(g)$.
]

#question[ Soit $k in NN$ non divisible par $p$. On note

  $ m = k + p^r product_( ell "premier" \ ell <= 2 n \ ell divides.not k) ell. $

  #subquestion[
    Justifier que tous les facteurs premiers de $m$ sont strictement supérieurs à $2 n$.
  ]

  #subquestion[
    En déduire que pour tout $g in G$, $"Tr"(g^k) = "Tr"(g)$.
  ]
]

#question[
  On note $J_r = { 1 <= k <= p^r - 1 "tels que" p divides.not k}$.

  #subquestion[
    Démontrer que $J_r = union.big_(0 <= s <= p^(r-1) - 1) { p s + t "tels que" 1 <= t <= p -1}$.
  ]

  #subquestion[
    Soit $zeta in CC$ tel que $zeta^p^r = 1$. Montrer que:

    $ sum_(j in J_r) zeta^j = cases( p^(r-1)(p-1) & "si" zeta =1, - p^(r-1) & "si" zeta "est d'ordre" p, 0 & "sinon") $.
  ]
]

#question[
  Soit $g in G$.
  On note $n_0$ la multiplicité de 1 comme racine de $chi_g$,
  et $n_1$ le nombre de racines $zeta$ de $chi_g$ d'ordre $p$ (comptées avec multiplicité).
  Démontrer que $"Tr"(g) = n_0 - n_1/(p-1)$.
]

#question[
  On note $a = floor(n/(p-1))$.
  Soit $g in G$, démontrer que $"Tr"(g) in { n - p v | 0 <= v <= a }$.
]
