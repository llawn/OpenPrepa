#set page(paper: "a4", numbering: "1")
#set text(font: "New Computer Modern", size: 10pt)
#set enum(numbering: "(i)")

#show link: it => text(fill: blue.darken(20%), underline(it))

#let qcounter = counter("q")
#let scounter = counter("s")

#show heading.where(level: 2): it => {
  qcounter.update(1)
  it
}

#let question(body, title: none) = context {
  qcounter.step()
  scounter.update(1)
  let n = qcounter.display()
  block(width: 100%, stroke: 0.5pt + blue, inset: 10pt, radius: 3pt, fill: blue.lighten(95%))[
    #if title != none [*Question #n (#title).*] else [*Question #n.*]
    #body
  ]
}

#let subquestion(body) = context {
  scounter.step()
  let l = scounter.display("a")
  [#h(2em) (#l) #body]
}

#let proof(body, title: none) = context {
  scounter.update(1)
  block(width: 100%, inset: (top: 5pt, bottom: 5pt))[
    #if title != none [_Demonstration (#title)._ #body] else [_Démonstration._ #body]
    #h(1fr) $square$
    #line(length:100%)
  ]
}

#let solution(body) = {
  box(stroke: 0.5pt + red, inset: 5pt, baseline: 5pt, radius: 4pt, fill: red.lighten(95%))[
    #body
  ]
}

#let note(body) = {
  box(stroke: 0.5pt + gray, inset: 5pt, baseline: 5pt, radius: 4pt, fill: gray.lighten(95%))[
    *_Note_.* #body
  ]
}

#let subproof(body) = context {
  scounter.step()
  let l = scounter.display("a")
  [#h(2em) (#l) #body #h(1fr) $square$]
}

#let solution-wide(body) = {
  block(width: 100%, stroke: 0.5pt + red, inset: 10pt, radius: 4pt, fill: red.lighten(95%))[
    #body
  ]
}
= 2021 - Fillière MP - Mathématiques A (XLCR)


= Sous-groupes finis de $bold("GL")_n (ZZ)$

#note[
  Ce sujet traite de l'étude des cardinaux possibles pour les sous-groupes fini de $bold("GL")_n (ZZ)$.
  Le but est de démontrer que pour tout $n in NN^*$, il existe une borne (ne dépendant que de $n$)
  sur le cardinal des sous groupes finis de $bold("GL")_n (ZZ)$, d'en expliter une
  et d'en donner une majoration raffinée dans le cas des des sous-groupes dont le cardinal est une puissance d'un nombre premier.

  Les #link(<Preliminaires>)[préliminaires] contiennent des résultats pouvant être utiles dans toute la suite du sujet.

  Les parties #link(<Partie1>)[1],#link(<Partie2>)[2] et #link(<Partie3>)[3] sont indépendantes.
  La #link(<Partie4>)[partie 4] est largement indépendante des autres,
  mais utilise le résultat de la dernière question de la #link(<Partie3>)[partie 3].
]

#outline(
  title: [Table des matières],
  target: heading.where(level: 2)
)

== Préliminaires <Preliminaires>

#question[
  Soit $z in CC$ une racine de l'unité. Justifier que $|z|=1$.
]

#proof[

  Cela nous fournit $d in NN^*$, tel que $z^d=1$.
  On pose $phi$ la fonction suivante:

  $ phi : (r, theta) in  RR_+ times [0, 2pi[ &|-> r e^(i theta) in CC $

  $phi$ est sujective, donc il existe $(r, theta) in RR_+ times [0, 2pi[$,
  tel que $z=r e^(i theta)$.

  $|z| = r$ et $1 = |z^d| = |z|^d = r^d$ et $ r = (r^d)^(1/d)=1$
  #solution-wide[$ |z| = r = 1 $]
]

#question[
  Soit $g in bold("GL")_n (CC)$, et soit $d in NN^*$. On suppose que $g$ est d'ordre $d$.
  Démontrer que $g$ est diagonalisable, et que toutes ses valeurs propres sont des racines $d$-ièmes de l'unité.
]

#proof[
  On pose $P(X) = X^d - 1$, de sorte que $P(g)=g^d-I_n=0_n$.
  $P$ est un polynôme anulateur de $g$ et $P(X)=product_(k=1)^d (X-e^((2 i k pi) / d))$.
  Il est scindé à racines simples donc #solution[$g$ est diagonalisable].

  Ainsi il existe, $lambda_1, dots, lambda_n in CC$ et $Q in bold("GL")_n  (CC)$
  tel que $g = Q Lambda^d Q^(-1)$ avec $Lambda = "diag"( lambda_1, dots, lambda_n)$.
  Ainsi écrit, $"Sp"_CC (g) = { lambda_1, dots, lambda_n}$.

  $g^d = I_n = (Q Lambda Q^(-1))^d = Q Lambda^d Q^(-1)$ et finalement 
  $Lambda^d="diag"(lambda_1^d, dots,lambda_n^d)=Q^(-1) I_n Q = I_n$.
  On a donc, $lambda_1^d = 1, dots, lambda_n^d = 1$.

  #solution-wide[
    Toutes les valeurs propres $lambda_1, dots, lambda_n$ de $g$ sont des racines $d$-ièmes de l'unité.
  ]
]

#question[
  Soit $m in NN$, et soit $q in NN^*$.

  <P0-Q3a>
  #subquestion[
    Démontrer que $"card"({1 <= k <= m "tels que" q | k}) = floor(m/q)$.
  ]

  #subquestion[
    En déduire que si $q$ est premier, $v_q (m!) = sum_(i=1)^(+oo) floor(m/q^i)$.
  ]
]

#proof[

  #subproof[
    Soit $p in [|1,m|]$, tel que $q|p$. Il existe alors $d in ZZ$ tel que $q d = p$.
    $q > 0, p>0$ donc $d>0$ également. Et $d = p/q <= m/q < floor(m/q)+1$ ainsi $d in [| 1, floor(m/q)|]$.

    On a montré, $ forall k in [|1, m|], q|k => exists d in [|1, floor(m/q)|] "tel que" q d = k$.
    Or, $d |-> q d$ est bijective donc

    $ forall k in [|1, m|], q|k => exists! d in [|1, floor(m/q)|] "tel que" q d = k$.

    #solution[
      $ "card"({1 <= k <=m "tels que" q|k}) <= "card"({[|1,floor(m/q)|]}) = floor(m/q) $
    ]

    Inversement, soit $d in [|1, floor(m/q)|]$. Je pose $k = q d$ alors $q | k$ et $k <= q floor(m/q) <= q m/q <= m$.
    Comme $q>=1 "et" d>=1, k>=1$. Ainsi $k in [|1,m|]$. De la même façon, on vient de montrer que

    #solution[
      $ "card"({1 <= k <=m "tels que" q|k}) >= "card"({[|1,floor(m/q)|]}) = floor(m/q) $
    ]

    Par double-inégalité,
    #solution-wide[
      $ "card"({1 <= k <=m "tels que" q|k}) = floor(m/q) $
    ]
  ]

  #subproof[
    Ici $q$ est premier.
    On écrit pour tout $k in [|1, m|], k=q^(v_q (k))p_k$ où $p_k in [|1,k|]$.

    $ m ! = product_(k=1)^m q^(v_q (k)) p_k = q^(sum_(k=1)^m v_q (k)) product_(k=1)^m p_k $

    Comme $q$ est premier et $forall k in [|1,m|], q divides.not p_k$ alors $q divides.not product_(k=1)^m p_k$.
    Finalement, #solution[ $v_q (m!) = sum_(k=1)^m v_q (k)$ ]

    La suite $(q^i)_(i in NN)$ est strictement croissante et diverge vers $+oo$.
    Cela nous fournit, $ j = max{ i in NN | q^i <= m }$ ainsi $forall i > j, floor(m/q^i) = 0$.

    Ceci assure l'existence et d'après la question #link(<P0-Q3a>)[a)]
    $ sum_(i=1)^(+oo) floor(m/q^i) = sum_(i=1)^(j+1) floor(m/q^i) = sum_(i=1)^(j+1) "card"({1<=k<=m "tels que" q^i|k}) $,

    #note[
      Je prend $j in NN$ car je n'ai pas voulu séparer les cas $q<=m$ de $q>m$.

      La somme doit donc aller à $j+1$ car dans le cas où $j=0$, en prenant $j+1$, on évite la sommation sur l'indice $0$ même si le terme d'indice $j+1$ est nul.
    ]
    Soit $i in NN^*, {1<=k<=m, q^i|k} = { 1<=k<=m, v_q (k) >= i }$. En partitionnant, on obtient:

    $ {1<=k<=m, q^i|k} = union.big_(p=i)^(j+1) {1<=k<=m, v_q (k) = p} $.

    Par sommation par paquets et par interversion des sommes.

    $ sum_(i=1)^(+oo) floor(m/q^i) = sum_(i=1)^(j+1) sum_(p=i)^(j+1) "card"({1<=k<=m, v_q(k)= p}) = sum_(p=1)^(j+1) sum_(i=1)^p "card"({1<=k<=m, v_q (k) = p}) $

    #solution-wide[
      $ sum_(i=1)^(+oo) floor(m/q^i) = sum_(p=0)^(j+1) p dot "card"({1<=k<=m, v_q (k) = p}) $
    ]

    #note[On peut reprendre l'indice 0 dans la somme précedente car on ajoute 0.]

    D'un autre côté, pour $k in [| 1, m |]$,

    $ 0 <= v_q (k) <= j+1$, donc en partitionnant, $v_q (k) = sum_(p=0)^(j+1) v_q (k) dot bb(1)_{v_q (k) = p}(p) = sum_(p=0)^(j+1) p dot bb(1)_{v_q (k) = p}(p) $

    En sommant et par interversion les sommes:

    $ sum_(k=1)^m v_q (k) = sum_(k=1)^m sum_(p=0)^(j+1) p dot bb(1)_{v_q (k) = p}(p) = sum_(p=0)^(j+1) p dot (sum_(k=1)^(m) bb(1)_{v_q (k) = p}(p)) $

    #solution-wide[
      $ sum_(k=1)^m v_q (k) = sum_(p=0)^(j+1) p dot "card"({ 1<=k<=m,v_q (k) = p}) $
    ]

    #solution-wide[
      $ v_q (m!) = sum_(k=1)^m v_q (k) = sum_(i=1)^(+oo) floor(m/q^i) $
    ]
  ]

]

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

== 2. Sous-groupes finis de $bold("GL")_n (ZZ)$ <Partie2>

#note[
  Soit $n in NN^*$, le but de cette partie est de majorer le cardinal des sous-groupes
  finis de $bold("GL")_n (ZZ)$ par une quantité ne dépendant que de $n$.
]

#question[

  #subquestion[

  ]

  #subquestion[

  ]

  #subquestion[

  ]
]

#question[

]

#question[

  #subquestion[

  ]

  #subquestion[

  ]
]


== 3. Trace des éléments d'un $p$-sous-groupe de $bold("GL")_n (ZZ)$ <Partie3>

#note[
  Soit $p$ un nombre premier et $r>=1$ un entier.
  Dans cette partie, on suppose que $G$ est un sous-groupe de cardinal $p^r$ de $bold("GL")_n (ZZ)$.
  Le but de cette partie, est de déterminer l'ensemble des valeurs possibles pour les traces des éléments de $G$.
]

#question[

  #subquestion[

  ]

  #subquestion[

  ]
]


#question[

]

#question[

]

#question[

  #subquestion[

  ]

  #subquestion[

  ]

  #subquestion[

  ]
]

#question[

]

#question[

]

#question[

  #subquestion[

  ]

  #subquestion[

  ]
]

#question[

  #subquestion[

  ]

  #subquestion[

  ]
]

#question[

]

#question[

]

== 4. Cardinaux des $p$-sous-groupes de $bold("GL")_n (ZZ)$ <Partie4>

#note[
  Soit $G subset bold("GL"_n (CC))$, un sous-groupe fini.
  Dans cette partie, on démontre que pour $s in NN, sum_(g in G) "Tr"(g)^s$
  est un entier divisible par $"card"(G)$.
  On en déduit une borne uniforme sur les cardinal des sous-groupes finis de $bold("GL")_n (ZZ)$
  dont le cardinal est une puissance d'un nombre premier.

]

#question[

  #subquestion[

  ]

  #subquestion[

  ]

]

#question[ Soit $k, n in NN^*$.
  Pour $g in bold("GL")_n (CC) "et" h in bold("GL")_k (CC)$,
  On note $g times.o h$ la matrice par blocs taille $n k times n k$, définie par:

  $ mat(
    g_(1 1)h, g_(1 2)h, dots.c, g_(1 n)h;
    g_(2 1)h, dots.c, dots.c, g_(2 n)h;
    dots.v, , , dots.v;
    g_(n 1)h, dots.c, dots.c, g_(n n )h
  ) $

  Justifier les affirmations suivantes:
  + si $g in bold("GL")_n (CC) "et" h in bold("GL")_k (CC), "Tr"(g times.o h) = "Tr"(g) "Tr"(h)$. 
  + si $g,g' in bold("GL")_n (CC) "et" h,h' in bold("GL")_k (CC), (g times.o h)(g' times.o h')=g g' times.o h h'$.
  + si $g in bold("GL")_n (CC) "et" h in bold("GL")_k (CC), g times.o h in bold("GL")_(n k) (CC) "et" (g times.o h)^(-1) = g^(-1) times.o h^(-1)$. 
]

#question[

  #subquestion[

  ]

  #subquestion[

  ]

]

#question[

  #subquestion[

  ]

  #subquestion[

  ]

]

#note[
  Soit $p$ un nombre premier et soit $r in NN^*$.
  Soit $G$ un sous-groupe de $bold("GL")_n (ZZ)$ de cardinal $p^r$.
]

#question[

  #subquestion[

  ]

  #subquestion[

  ]

]

#question[

  #subquestion[

  ]

  #subquestion[

  ]

]
