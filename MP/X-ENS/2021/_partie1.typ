#import "_lib.typ": *

== 1. E\u{0301}léments d'ordre fini de $bold("GL")_n (ZZ)$ <Partie1>

#note[
  Le but de cette partie est de démontrer que l'ensemble des ordres possibles pour les éléments d'ordre fini de
  $bold("GL")_n (ZZ)$ est fini.

  On commence par détailler le cas $n=2$. Soit $g in bold("GL")_2 (ZZ)$.
  On suppose que $g$ est d'ordre fini $d in NN^*$.
]

#question[
  Démontrer que $|"Tr"(g)| <= 2$
]

#proof[

]

#question[
  On suppose maintenant que les valeurs propres de $g$ sont réelles,
  déterminer les valeurs possibles pour $d$.
]

#proof[

]

#question[
  On suppose maintenant que $g$ n'a pas de valeurs propres réelles.
  Démontrer que le polynôme caractéristique de $g$ est l'un des polynômes suivants:
  $X^2-X+1, X^2+1, X^2+X+1$.
]

#proof[

]

#question[
  En déduitre que $d in {1,2,3,4,6}$.
]

#proof[

]

#note[
  On traite maintenant le cas de $bold("GL")_n (ZZ)$ où $n>=1$ est un entier quelconque.
]

#question[
  Soit $P = X^n + sum_(i=1)^(n-1) a_i X^i in CC[X]$ unitaire de dégré $n$.
  On note $z_1, dots, z_n$ les racines de $P$ (comptées avec multiplicité) et
  $alpha = max_(1<=i<=n) |z_i|$.

  Démontrer que pour tout $0<=i<=n-1, |a_i| <= binom(n, i) alpha^(n-i)$.
]

#proof[

]

#question[
  Montrer que ${ chi_g "tels que" g in bold("GL")_n (ZZ) "est d'ordre fini"}$ est fini.
]

#proof[

]

#question[
  Montrer que ${ d in NN | exists g in bold("GL")_n (ZZ) "d'ordre" d}$ est fini
]

#proof[

]
