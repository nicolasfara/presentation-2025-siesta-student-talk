#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/fontawesome:0.5.0": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/numbly:0.1.0": numbly
#import "utils.typ": *
#import "@preview/tiaoma:0.3.0"

// Pdfpc configuration
// typst query --root . ./example.typ --field value --one "<pdfpc-file>" > ./example.pdfpc
#let pdfpc-config = pdfpc.config(
    duration-minutes: 30,
    start-time: datetime(hour: 14, minute: 10, second: 0),
    end-time: datetime(hour: 14, minute: 40, second: 0),
    last-minutes: 5,
    note-font-size: 12,
    disable-markdown: false,
    default-transition: (
      type: "push",
      duration-seconds: 2,
      angle: ltr,
      alignment: "vertical",
      direction: "inward",
    ),
  )

// Theorems configuration by ctheorems
#show: thmrules.with(qed-symbol: $square$)
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))
#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(
    // handout: true,
    preamble: pdfpc-config,
    show-bibliography-as-footnote: bibliography(title: none, "bibliography.bib"),
  ),
  config-info(
    title: [Engineering the Collective in the Cloud-Edge Continuum],
    subtitle: [Student Talk \@ SIESTA 2025],
    author: author_list(
      (
        (first_author("Nicolas Farabegoli"), "nicolas.farabegoli@unibo.it"),
        ("Supervisor:", "Mirko Viroli")
      )
    ),
    date: datetime.today().display("[day] [month repr:long] [year]"),
    institution: [University of Bologna],
    logo: align(right)[#image("images/disi.svg", width: 55%)],
  ),
)

#set text(font: "Fira Sans", weight: "light", size: 20pt)
#show math.equation: set text(font: "Fira Math")

#set raw(tab-size: 4)
#show raw: set text(size: 1em)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: (x: 1em, y: 1em),
  radius: 0.7em,
  width: 100%,
)

#show bibliography: set text(size: 0.75em)
#show footnote.entry: set text(size: 0.75em)

// #set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

// == Outline <touying:hidden>

// #components.adaptive-columns(outline(title: none, indent: 1em))

== Collective-Adaptive Systems

*Collective-adaptive Systems* #cite(label("DBLP:conf/birthday/BucchiaroneM19")) refers to systems with a _large number_ of entities interacting with each other in pursuing a #bold[collective] goal without a central coordinator.

  Actual _behaviour_ arises as an #alert[emergent] property of the system.

  #components.side-by-side[
    #figure(image("images/swarms.jpg", width: 75%))
  ][
    #figure(image("images/pedastrian.png", width: 100%))
  ][
    #figure(image("images/coldplay.jpg", width: 88%))
  ]

== Aggregate Computing

#underline[Aggregate computing] #cite(label("DBLP:journals/computer/BealPV15")) as a way to #bold[engineer] *collective-adaptive systems*.

#place(right, dx: -23.55em)[
  #line(start: (0em, 0em), end: (0em, 55%), stroke: 0.05em + rgb("#23373b"))
]

#v(1em)

#components.side-by-side(columns: (auto, 1fr), gutter: 2em)[
  #figure(image("images/channel.svg", height: 45%))
][
  #figure(image("images/ac.svg"))
]

#v(1em)

#align(center)[Typical deployments assume that all the devices #bold[can] execute the program.]

== Cloud-Edge Continua

#components.side-by-side(columns: (2fr, auto), gutter: 2em)[
  Aggregation of #bold[computational resources] along the data path from the *edge* to the *cloud* #cite(label("DBLP:journals/access/MoreschiniPLNHT22"))

  #v(1em)

  We must deal with different #bold[capabilities] and #bold[constraints]:
  - edge devices for #underline[sense/acting], but *resources-constrained*
  - cloud instances for #underline[scalability], but *latency/privacy* issues

  #only(2)[
    How can we #bold[opportunistically] expolit such additional resources?
  ]
][
  #figure(image("images/edge-cloud-continuum.svg", height: 70%))
]

#focus-slide[What I have *done* so far...]

== Pulverization

#components.side-by-side(columns: (1fr, 1fr))[
  #align(center)[#bold[Pulverisation] #cite(label("FARABEGOLI2024545"))]
  #figure(image("images/pulverisation.svg", height: 49%))
  
][
  #align(center)[#bold[Macro-program partitioning] #cite(label("DBLP:conf/acsos/FarabegoliVC24"))]
  #figure(image("images/collective-local-components.svg", height: 49%))
]

How can we manage the components' #bold[reconfiguration] to cope with the *ECC*? \
How can we improve #bold[non-functional] properties like *latency* and *consumption*?

== Reconfiguration

#components.side-by-side(columns: (1fr, 1fr, 1fr))[
  === Local Rules #cite(label("FARABEGOLI2024545"))
  - #text(fill: green)[Easy] to define
  - #text(fill: orange)[Local] decisions only
  - #text(fill: red)[Oscillating] conditions

  #align(center)[#fa-microchip(size: 2em)]
][
  === Decentralized Rules #cite(label("DBLP:journals/iot/FarabegoliPCV24"))
  - More #text(fill: orange)[complex] to define
  - #text(fill: green)[Global] decisions
  - #text(fill: green)[No Oscillating] conditions

  #align(center)[#fa-globe(size: 2em)]
][
  === Prolog Planner #cite(label("DBLP:conf/coordination/BrogiCFFV25"))
  - #text(fill: green)[Declarative] definition
  - #text(fill: green)[Global] optimum
  - #text(fill: orange)[Centralized] approach

  #align(center)[#fa-brain(size: 2em)]
]

#focus-slide[What's *next*?]

== Future Directions

#components.side-by-side[
  === Reconfig. via Learning

  Integrate #underline[learning mechanisms] to adapt configurations over time.

  *Graph Neural Network* for coping with #bold[heterogeneous devices] and #bold[dynamic conditions].

  #align(center)[#fa-brain(size: 2em)]
][
  === Language Approach

  Exploit #underline[type-systems] for encoding deployments of *CAS* in the *ECC*.

  Integrate *AC* with relevant approaches such as #bold[multitier programming] and #bold[choreographies].

  #align(center)[#fa-code(size: 2em)]
][
  === Real Deployments

  #underline[Close the gap] between *simulation* and *real-world* deployments.

  Early (but cool) project on #bold[swarm robotics]:

  #align(center)[
    #tiaoma.qrcode("https://experiment.com/projects/project-emerge-an-open-source-swarm-robotics-platform", options: (
      scale: 2.0,
      // output-options: (
      //   barcode-dotty-mode: true
      // ),
      // dot-size: 1.2em
    ))
  ]
]

#focus-slide[
  Thank you for your *attention*!

  #align(center)[
    #tiaoma.qrcode("https://www.linkedin.com/in/nicolas-farabegoli/", options: (scale: 4.0, fg-color: white))
  ]

  #place(bottom + left, dx: 2em, dy: -2em)[
    #text(size: 1.2em, fill: white, weight: "bold")[keep in touch]
    #h(1em)
    #text(size: 2em, fill: white)[#sym.arrow.ne]
  ]
  
]
// #slide[
//   #bibliography("bibliography.bib")
// ]
