#let theorem-counter = counter("theorem")
#let theorem-section = state("theorem-section", 0)

#let theorem-dispatch(name, color, body, title) = context {
  let h = counter(heading).get()
  let sec = h.at(0, default: 0)
  let sec = if sec == 0 { 1 } else { sec }
  let vals = theorem-counter.get()
  let n = str(vals.at(0, default: 0) + 1)
  theorem-counter.step()
  block(
    width: 100%,
    stroke: (left: 3pt + color),
    inset: (left: 10pt, right: 10pt, top: 6pt, bottom: 6pt),
    radius: 3pt,
    fill: color.lighten(90%)
  )[
    #if title != none [*#name #sec.#n* (#title).\ ] else [*#name #sec.#n.*\ ]
    #body
  ]
}

#let theoreme(body, title: none) = theorem-dispatch("Théorème", rgb(88, 86, 214), body, title)
#let propriete(body, title: none) = theorem-dispatch("Propriété", rgb(230, 0, 0), body, title)
#let lemme(body, title: none) = theorem-dispatch("Lemme", rgb(230, 126, 34), body, title)
#let axiome(body, title: none) = theorem-dispatch("Axiome", rgb(52, 73, 94), body, title)
#let definition(body, title: none) = theorem-dispatch("Définition", rgb(39, 174, 96), body, title)

#let chapitre(body) = {
  align(center, v(4cm))
  text(size: 28pt, weight: "bold", fill: rgb(88, 86, 214), body)
  v(1.5cm)
  outline(title: [Table des matières])
  pagebreak()
}

#let note(body) = {
  box(stroke: 0.5pt + gray, inset: 5pt, baseline: 5pt, radius: 4pt, fill: gray.lighten(95%))[
    *_Note_.* #body
  ]
}

#show heading: it => context {
  let n = counter(heading).display()
  if it.level == 1 {
    theorem-counter.update(0)
    v(1.5cm)
    block(
      width: 100%,
      fill: rgb(88, 86, 214).lighten(90%),
      inset: 12pt,
      radius: 4pt,
    )[
      #text(size: 20pt, weight: "bold", fill: rgb(88, 86, 214))[#n #it.body]
    ]
    v(1cm)
  } else if it.level == 2 {
    v(0.8cm)
    block(
      width: 100%,
      stroke: (bottom: 2.5pt + rgb(88, 86, 214)),
      inset: (bottom: 4pt),
    )[
      #text(size: 15pt, weight: "bold")[#n #it.body]
    ]
    v(0.5cm)
  } else { it }
}
