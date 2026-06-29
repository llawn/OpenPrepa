#import "_lib.typ": *

= La Théorie Axiomatique des Ensembles

#note[
  La théorie des ensembles est une branche des mathématiques, créée par le
  *mathématicien* allemand *Georg Cantor* à la fin du $"XIX"^e$ siècle.

  Au début du $"XX"^e$ siècle, plusieurs facteurs ont poussé les mathématiciens
  à développer une *axiomatique* pour la théorie des ensembles.

  Cette approche formelle conduisit à plusieurs systèmes axiomatiques, le plus connu
  étant les axiomes de *ZF* _(Zermelo-Fraenkel)_, *ZFC* lorsqu'on lui adjoint l'axiome du choix.
  
  Parmi les autres systèmes on peut cité la *théorie des classe* de von Neumann abregé *NBG*
  pour _(Neumann-Bernays-Gödel)_ ou encore la *théorie des types* de Russell.


]

#axiome[
  *Axiome d'Extensionnalité :* \
  Deux ensembles sont égaux si et seulement s'ils ont les mêmes éléments.
  $forall A, forall B, (A = B <=> (forall x, x in A <=> x in B))$
]

Comme nous pouvons le voir, cet axiome permet de définir l'égalité...

Une fois l'égalité définie, nous pouvons introduire l'existence d'ensembles spécifiques.

#axiome[
  *Axiome de la Paire :* \
  Pour tous ensembles $A$ et $B$, il existe un ensemble dont les seuls éléments sont $A$ et $B$.
]
