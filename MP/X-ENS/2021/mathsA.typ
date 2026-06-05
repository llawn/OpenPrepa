#set page(paper: "a4", numbering: "1")
#set text(font: "New Computer Modern", size: 10pt)

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
  [#h(2em)#l) #body]
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
  [#h(2em)#l) #body #h(1fr) $square$]
}

#let solution-wide(body) = {
  block(width: 100%, stroke: 0.5pt + red, inset: 10pt, radius: 4pt, fill: red.lighten(95%))[
    #body
  ]
}
= 2021 - Fillière MP - Mathématiques A (XLCR)

= Sous-groupes finis de $bold("GL")_n (ZZ)$

== Préliminaires

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
  #solution-wide[$|z| = r = 1$]
]

#question[
  Soit $g in bold("GL")_n (CC)$, et soit $d in NN^*$. On suppose que $g$ est d'ordre $d$.
  Démontrer que $g$ est diagonalisable, et que toutes ses valeurs propres sont des racines $d$-ièmes de l'unité.
]

#proof[
  On pose $P(X) = X^d - 1$, de sorte que $P(g)=g^d-I_n=0_n$.
  $P$ est un polynôme anulateur de $g$ et $P(X)=product_(k=1)^d (X-e^((2 i k pi) / d))$.
  Il est scindé à racines simples donc #solution[$g$ est diagonalisable].

  Ainsi il existe, $lambda_1, ..., lambda_n in CC$ et $Q in bold("GL")_n  (CC)$
  tel que $g = Q Lambda^d Q^(-1)$ avec $Lambda = "diag"( lambda_1, ..., lambda_n)$.
  Ainsi écrit, $"Sp"_CC (g) = { lambda_1, ..., lambda_n}$.

  $g^d = I_n = (Q Lambda Q^(-1))^d = Q Lambda^d Q^(-1)$ et finalement 
  $Lambda^d="diag"(lambda_1^d,...,lambda_n^d)=Q^(-1) I_n Q = I_n$.
  On a donc, $lambda_1^d = 1, ..., lambda_n^d = 1$.

  #solution-wide[
    Toutes les valeurs propres $lambda_1, ..., lambda_n$ de $g$ sont des racines $d$-ièmes de l'unité.
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
      $"card"({1 <= k <=m "tels que" q|k}) <= "card"({[|1,floor(m/q)|]}) = floor(m/q)$
    ]

    Inversement, soit $d in [|1, floor(m/q)|]$. Je pose $k = q d$ alors $q | k$ et $k <= q floor(m/q) <= q m/q <= m$.
    Comme $q>=1 "et" d>=1, k>=1$. Ainsi $k in [|1,m|]$. De la même façon, on vient de montrer que

    #solution[
      $"card"({1 <= k <=m "tels que" q|k}) >= "card"({[|1,floor(m/q)|]}) = floor(m/q)$
    ]

    Par double-inégalité,
    #solution-wide[
      $"card"({1 <= k <=m "tels que" q|k}) = floor(m/q)$
    ]
  ]

  #subproof[
    Ici $q$ est premier.
    On écrit pour tout $k in [|1, m|], k=q^(v_q (k))p_k$ où $p_k in [|1,k|]$.

    $m ! = product_(k=1)^m q^(v_q (k)) p_k = q^(sum_(k=1)^m v_q (k)) product_(k=1)^m p_k$

    Comme $q$ est premier et $forall k in [|1,m|], q divides.not p_k$ alors $q divides.not product_(k=1)^m p_k$.
    Finalement, #solution[ $v_q (m!) = sum_(k=1)^m v_q (k)$ ]

    La suite $(q^i)_(i in NN)$ est strictement croissante et diverge vers $+oo$.
    Cela nous fournit, $ j = max{ i in NN | q^i <= m }$ ainsi $forall i > j, floor(m/q^i) = 0$.

    Ceci assure l'existence de
    $sum_(i=1)^(+oo) floor(m/q^i) = sum_(i=1)^(j+1) floor(m/q^i) = sum_(i=1)^(j+1) "card"({1<=k<=m "tels que" q^i|k})$,
    d'après la question #link(<P0-Q3a>)[a)]

    #note[
      Je prend $j in NN$ car je n'ai pas voulu séparer les cas $q<=m$ de $q>m$.

      La somme doit donc aller à $j+1$ car dans le cas où $j=0$, en prenant $j+1$, on évite la sommation sur l'indice $0$ même si le terme d'indice $j+1$ est nul.
    ]
    Soit $i in NN^*, {1<=k<=m, q^i|k} = { 1<=k<=m, v_q (k) >= i }$. En partitionnant, on obtient:

    ${1<=k<=m, q^i|k} = union.big_(p=i)^(j+1) {1<=k<=m, v_q (k) = p}$.

    Par sommation par paquets et par interversion des sommes.

    $sum_(i=1)^(+oo) floor(m/q^i) = sum_(i=1)^(j+1) sum_(p=i)^(j+1) "card"({1<=k<=m, v_q(k)= p}) = sum_(p=1)^(j+1) sum_(i=1)^p "card"({1<=k<=m, v_q (k) = p})$

    #solution-wide[
      $sum_(i=1)^(+oo) floor(m/q^i) = sum_(p=0)^(j+1) p dot "card"({1<=k<=m, v_q (k) = p})$
    ]

    #note[On peut reprendre l'indice 0 dans la somme précedente car on ajoute 0.]

    D'un autre côté, pour $k in [| 1, m |]$,

    $0 <= v_q (k) <= j+1$, donc en partitionnant, $v_q (k) = sum_(p=0)^(j+1) v_q (k) dot bb(1)_{v_q (k) = p}(p) = sum_(p=0)^(j+1) p dot bb(1)_{v_q (k) = p}(p)$

    En sommant et par interversion les sommes:

    $sum_(k=1)^m v_q (k) = sum_(k=1)^m sum_(p=0)^(j+1) p dot bb(1)_{v_q (k) = p}(p) = sum_(p=0)^(j+1) p dot (sum_(k=1)^(m) bb(1)_{v_q (k) = p}(p))$

    #solution-wide[
      $sum_(k=1)^m v_q (k) = sum_(p=0)^(j+1) p dot "card"({ 1<=k<=m,v_q (k) = p})$
    ]

    #solution-wide[
      $v_q (m!) = sum_(k=1)^m v_q (k) = sum_(i=1)^(+oo) floor(m/q^i) $
    ]  
  ]

]

== 1. E\u{0301}léments d'ordre fini de $bold("GL")_n (ZZ)$

== 2. Sous-groupes finis de $bold("GL")_n (ZZ)$

== 3. Trace des éléments d'un $p$-sous-groupe de $bold("GL")_n (ZZ)$

== 4. Cardinaux des $p$-sous-groupes de $bold("GL")_n (ZZ)$

