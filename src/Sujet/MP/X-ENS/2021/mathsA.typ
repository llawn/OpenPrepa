#set page(paper: "a4", numbering: "1")
#set text(font: "New Computer Modern", size: 10pt)
#set enum(numbering: "(i)")

#show link: it => text(fill: blue.darken(20%), underline(it))

#import "_lib.typ": *

#show heading.where(level: 2): it => {
  qcounter.update(1)
  it
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

#include "_preliminaires.typ"
#include "_partie1.typ"
#include "_partie2.typ"
#include "_partie3.typ"
#include "_partie4.typ"
