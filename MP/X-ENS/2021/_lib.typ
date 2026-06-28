#let qcounter = counter("q")
#let scounter = counter("s")

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
