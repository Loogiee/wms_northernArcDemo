#import "@preview/echarm:0.2.0"
#import "@preview/shadowed:0.2.0": shadowed

#let customFooter = box(width: 100%, height: 30pt, inset: 10pt, align(center + bottom)[
  #place(dx: 0pt)[
    #text("Report is at : Investor Level", size: 21pt, weight: "medium", fill: blue)
  ]
  #place(dx: 48%)[
    #text("RM Name :", size: 21pt, weight: "medium", fill: blue)
  ]
  #place(dx: 99%)[
    #text(
      context {
        let pageNum = counter(page).get().first()
        if pageNum < 10 {
          "0" + str(pageNum)
        } else {
          pageNum
        }
      },
      size: 21pt,
      weight: "medium",
      fill: blue,
    )
  ]
])
#set text(size: 12pt, font: "Bai Jamjuree")
#set page(
  paper: "a2",
  flipped: true,
  fill: rgb("#fbfbfb"),
  margin: (
    top: 50pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() > 1 {
      align(bottom)[#customFooter]
    }
  },
)
// #set outline.entry(fill: none)
#let pageNumber = context {
  counter(page).display()
}
#let DateString = "12-05-2025"
#let DateParts = DateString.split("-")
#let DateYear = int(DateParts.at(2))
#let DateMonth = int(DateParts.at(1))
#let DateDay = int(DateParts.at(0))
#let DateTimeFormat = datetime(
  year: DateYear,
  month: DateMonth,
  day: DateDay,
)
#let FormatedDate = DateTimeFormat.display("[day] [month repr:short] [year] ")
#let FormatedDate1 = DateTimeFormat.display("[day] [month repr:short] [year] - [day] [month repr:short] [year]")

#let FormatedDate2 = DateTimeFormat.display("[day] [month repr:short] [year]")
#place(dx: 1100pt, dy: -50pt)[
  #image("./assets/images/bg design2.jpg", width: 100%, height: 100%)
]
#place(top + right, dx: -90pt)[
  #image("./assets/images/kfintech-logo.png", width: 300pt)
]
#place(bottom + left, dx: -40pt, dy: -150pt)[
  #image("./assets/images/design.png", width: 480pt)
]


#place(bottom + right, dx: -140pt, dy: -150pt)[
  #image("./assets/images/bgdesign.jpg", width: 1050pt, height: 370pt)
]

#place(
  dx: 1050pt,
  dy: 350pt,
)[
  #box(width: 500pt, height: 400pt, fill: rgb("#EEF1F0"))[
    #place(
      dx: 100pt,
      dy: 60pt,
      //  index box code
      context {
        let outline_data = query(heading.where(level: 1))
        for entry in outline_data {
          link(entry.location(), [
            #box(width: 80%, text(weight: "bold", size: 2.3em, fill: rgb("#005397"), entry.body))
            #v(10pt)
          ])
        }
      },
    )

  ]


  #place(top + right, dx: -440pt, dy: 50pt, line(
    stroke: 2pt + rgb("#2F75B5"),
    start: (0pt, 0pt),
    end: (0pt, 330pt),
  ))
  #place(top + right, dx: -437pt, dy: 50pt, box(fill: rgb("#0090F3"), width: 6pt, height: 25pt))
  #place(
    bottom + right,
    dy: -320pt,
    dx: -20pt,
  )[
    #box(fill: rgb("#005397"), stroke: none, width: 50pt, height: 80pt, radius: (
      left: 0pt,
      right: 0pt,
      bottom-right: 100pt,
      bottom-left: 00pt,
    ))[


      #pad(
        left: 0% + 0pt,
        top: 0% + 0pt,
        right: 0% + 10pt,
        bottom: 0% + 50pt,
      )[
        #text(weight: "bold", "Index", fill: white)
      ]
    ]
  ]
]





#show heading: it => place(text(weight: "bold", fill: red, size: 0pt, it.body))

#place(
  dx: 50pt,
  dy: 100pt,
)[
  #box()[

    #text(fill: rgb("#0B1A24"), weight: "extrabold", font: "Bai Jamjuree", size: 80pt, [PORTFOLIO])\
    \
    \
    #text(fill: rgb("#248DDC"), weight: "bold", font: "Bai Jamjuree", size: 40pt, "ANALYSIS REPORT")\
    \
    \
    #text(fill: rgb("#0B1A24"), weight: "bold", font: "Bai Jamjuree", size: 40pt, "KFin Capitals / ")
    #text(fill: rgb("#D4567B"), weight: "bold", font: "Bai Jamjuree", size: 40pt, "W0000339")
  ]
]

#place(dx: 50pt)[

  #place(
    top + left,

    dy: 350pt,
  )[
    #block()[
      #text("Report as on date", size: 25pt, weight: "semibold", font: "Bai Jamjuree", fill: rgb("248DDC"))\
      \
      #text(FormatedDate, size: 25pt, weight: "semibold", font: "Bai Jamjuree", fill: black)
    ]
  ]
  #place(
    top + left,
    dx: 300pt,
    dy: 350pt,
  )[
    #block()[
      #text("Report Period", size: 25pt, weight: "semibold", font: "Bai Jamjuree", fill: rgb("248DDC"))\
      \
      #text(FormatedDate1, size: 25pt, weight: "semibold", font: "Bai Jamjuree", fill: black)
    ]
  ]

  #place(
    top + left,
    dx: 700pt,
    dy: 350pt,
  )[
    #block()[
      #text("Print date", size: 25pt, weight: "semibold", font: "Bai Jamjuree", fill: rgb("248DDC"))\
      \
      #text(FormatedDate, size: 25pt, weight: "semibold", font: "Bai Jamjuree", fill: black)
    ]
  ]

  #place(
    top + left,
    dy: 450pt,
  )[
    #block()[
      #text("Report is at", size: 25pt, weight: "semibold", font: "Bai Jamjuree", fill: rgb("248DDC"))\
      \
      #text("Investor Level", size: 37pt, weight: "bold", font: "Bai Jamjuree", fill: black)
    ]
  ]

]
#place(
  bottom + left,
  dx: 80pt,
  dy: 20pt,
)[
  #place(bottom + left, dx: 800pt, dy: -80pt, rect(width: 100%, stroke: none)[
    #set stack(spacing: 16pt)

    #stack(
      stack(spacing: 0.4cm, text("Client Name", weight: "bold", font: "Open Sans", fill: rgb("248DDC"), size: 25pt)),
      block(width: 350pt)[
        #stack(block(width: 350pt)[
          #text("{{.ClientName}}", fill: black, weight: "bold", font: "Open Sans", size: 25pt)
        ])
      ],
    )
  ])
  #place(bottom + left, dx: 1070pt, dy: -80pt, rect(width: 100%, stroke: none)[
    #set stack(spacing: 16pt)

    #stack(
      stack(spacing: 0.4cm, text("Email", weight: "bold", font: "Open Sans", fill: rgb("248DDC"), size: 25pt)),
      block(width: 350pt)[
        #stack(block(width: 350pt)[
          #text("-", fill: black, weight: "bold", font: "Open Sans", size: 25pt)
        ])
      ],
    )
  ])
  #place(bottom + left, dx: 1340pt, dy: -80pt, rect(width: 100%, stroke: none)[
    #set stack(spacing: 16pt)

    #stack(
      stack(spacing: 0.4cm, text("Phone Number", weight: "bold", font: "Open Sans", fill: rgb("248DDC"), size: 25pt)),
      block(width: 350pt)[
        #stack(block(width: 350pt)[
          #text("{{.RMMobile}}", fill: black, weight: "bold", font: "Open Sans", size: 25pt)
        ])
      ],
    )
  ])
]
