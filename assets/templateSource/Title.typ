#import "@preview/echarm:0.2.0"

#let customFooter = box(width: 100%, height: 30pt,  align(center + bottom)[
  #place(dy: -20pt,[#line(length: 100%,stroke: 0.5pt + rgb("#cdcdcd"))])

  #place(dx: .5%)[
    #text("Report is at : ", size: 20pt, weight: "medium", fill: blue)
    #text("Investor Level", size: 20pt, weight: "medium", fill: black)
  ]
    #place(dx: 30%)[
    #text("Customer Name : ", size: 20pt, weight: "medium", fill: blue)
    #text("{{.ClientName}}", size: 20pt, weight: "medium", fill: black)
  ]
  #place(dx: 65%)[
    #text("RM Name : ", size: 20pt, weight: "medium", fill: blue)
    #text("{{.RM}}", size: 20pt, weight: "medium", fill: black)
  ]
  #place(dx: 98%)[
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
#set text(size: 14pt, font: "Bai Jamjuree")
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
{{$RequredDateFormat :="02 Jan 2006"}}
#let ReportDate = "{{DateFormatter .ReportDate $RequredDateFormat}}"
#let ReportBeginDate = "{{DateFormatter .ReportFrom $RequredDateFormat}}"
#let ReportEndDate = "{{DateFormatter .ReportTo $RequredDateFormat}}"
#let ReportPeriod = "{{DateFormatter .PrintDate $RequredDateFormat}}"
// #place(dx: 1100pt, dy: -50pt)[
//   #image("./assets/images/bg design2.jpg", width: 100%, height: 100%)
// ]
#place(top + right, dx: -90pt)[
  #image("./assets/images/kfintech-logo.png", width: 300pt)
]
#place(bottom + left, dx: -40pt, dy: -100pt)[
  #image("./assets/images/design.png", width: 480pt)
]


#place(bottom + right, dx: -140pt, dy: -100pt)[
  #image("./assets/images/bgdesign.jpg", width: 1050pt, height: 370pt)
]

#place(
  dx: 1050pt,
  dy: 450pt,
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
            #box(width: 80%, text(weight: "bold", size: 20pt, fill: rgb("#005397"), entry.body))
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

    #text(fill: rgb("#0B1A24"), weight: "bold",  size: 80pt, "PORTFOLIO")\
    \
    #text(fill: rgb("#248DDC"), weight: "bold",  size: 50pt, "ANALYSIS REPORT")\
    \
    #text(fill: rgb("#0B1A24"), weight: "bold",  size: 25pt, "{{.ClientName}} / ")
    #text(fill: rgb("#D4567B"), weight: "bold",  size: 25pt, "W0000339")
  ]
]

#place(dx: 50pt,dy:0pt)[
  #place(
    top + left,

    dy: 350pt,
  )[
    #block()[
      #text("Report as on date", size: 20pt, weight: "bold",  fill: rgb("248DDC"))
      \
      #text(ReportDate, size: 20pt, weight: "bold",  fill: black)
    ]
  ]
  #place(
    top + left,
    dx: 300pt,
    dy: 350pt,
  )[
    #block()[
      #text("Report Period", size: 20pt, weight: "bold", fill: rgb("248DDC"))
      \
      #text(ReportBeginDate+ " - " +ReportEndDate, size: 20pt, weight: "bold",  fill: black)
    ]
  ]

  #place(
    top + left,
    dx: 630pt,
    dy: 350pt,
  )[
    #block()[
      #text("Print date", size: 20pt, weight: "bold",  fill: rgb("248DDC"))
      \
      #text(ReportPeriod, size: 20pt, weight: "bold",  fill: black)
    ]
  ]

  #place(
    top + left,
    dy: 430pt,
  )[
    #block()[
      #text("Report is at", size: 20pt, weight: "bold",  fill: rgb("248DDC"))
      \
      #text("Investor Level", size: 25pt, weight: "bold",  fill: black)
    ]
  ]

]
#place(
  bottom + left,
  dx: 80pt,
  dy: 50pt,
)[
  #place(bottom + left, dx: 650pt, dy: -80pt, rect(width: 100%, stroke: none)[
    #set stack(spacing: 16pt)

    #stack(
      stack(spacing: 0.4cm, text("RM Name", weight: "bold", fill: rgb("248DDC"), size: 20pt)),
      block(width: 350pt)[
        #stack(block(width: 350pt)[
          #text("{{.RM}}", fill: black, weight: "bold", size: 20pt)
        ])
      ],
    )
  ])

#place(bottom + left, dx: 950pt, dy: -80pt, rect(width: 100%, stroke: none)[

])

#place(bottom + left, dx: 910pt, dy: -80pt, rect(width: 100%, stroke: none)[
  #set stack(spacing: 16pt)
  #set text(hyphenate: true, lang: "en")

  #stack(
    block(width: 350pt, height: 30pt)[
   #text("Email", weight: "bold", fill: rgb("248DDC"), size: 20pt)
  ],
    block(width: 350pt)[
      #stack(
        block(width: 350pt)[
          #box(width: 350pt, clip: false)[
            #text("{{.RMEmail}}".replace(".", ".").replace("@", "@"), fill: black, weight: "bold", size: 20pt)
          ]
        ]
      )
    ],
  )
])
  #place(bottom + left, dx: 1260pt, dy: -80pt, rect(width: 100%, stroke: none)[
    #set stack(spacing: 16pt)

    #stack(
      stack(spacing: 0.4cm, text("Phone Number", weight: "bold", fill: rgb("248DDC"), size: 20pt)),
      block(width: 350pt)[
        #stack(block(width: 350pt)[
          #text("{{.RMMobile}}", fill: black, weight: "bold", size: 20pt)
        ])
      ],
    )
  ])
]
