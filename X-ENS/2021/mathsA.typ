#set page(paper: "a4", numbering: "1")
#set text(font: "New Computer Modern", size: 11pt)

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
  block(width: 100%, stroke: 0.5pt + blue, inset: 12pt, radius: 4pt, fill: blue.lighten(95%))[
    #if title != none [*Question #n (#title).*] else [*Question #n.*]
    #body
  ]
}

#let subquestion(body) = context {
  scounter.step()
  let l = scounter.display("a")
  [#h(2em)#l) #body]
}

#let proof(body, title: none) = [
  #block(width: 100%, inset: (top: 8pt, bottom: 8pt))[
    #if title != none [_Demonstration (#title)._ #body] else [_Proof._ #body]
    #h(1fr) $square$
  ]
]

= Sous-groupes finis de $bold("GL")_n (ZZ)$

== Préliminaires

#question[
  Soit $z in CC$ une racine de l'unité. Justifier que $|z|=1$.
]

#proof[

]

#question[
  Soit $g in bold("GL")_n (CC)$, et soit $d in NN^*$. On suppose que $g$ est d'ordre $d$.
  Démontrer que $g$ est diagonalisable, et que toutes ses valeurs propres sont des racines $d$-ièmes de l'unité.
]

#proof[

]

#question[
  Soit $m in NN$, et soit $q in NN^*$.

  #subquestion[
    Démontrer que $"card"({1 <= k <= m "tels que" q | k}) = floor(m/q)$.
  ]

  #subquestion[
    En déduire que si $q$ est premier, $v_q (m!) = sum_(i=1)^(+oo) floor(m/q^i)$.
  ]
]

#proof[

]

== 1. E\u{0301}léments d'ordre fini de $bold("GL")_n (ZZ)$

== 2. Sous-groupes finis de $bold("GL")_n (ZZ)$

== 3. Trace des éléments d'un $p$-sous-groupe de $bold("GL")_n (ZZ)$

== 4. Cardinaux des $p$-sous-groupes de $bold("GL")_n (ZZ)$

