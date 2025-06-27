#import "@preview/echarm:0.2.0"

#let customFooter = box(width: 100%, height: 30pt,  align(center + bottom)[
  #place(dy: -10pt,[#line(length: 100%,stroke: 0.5pt + rgb("#cdcdcd"))])

  #place(dx: 10pt,dy:10pt)[
    #text("Report is at : ", size: 9pt, weight: "medium", fill: blue)
    #text("Investor Level", size: 9pt,weight: "medium", fill: black)
  ]
  #place(dx: 55%,dy:10pt)[
    #text("RM Name : ",size: 9pt,  weight: "medium", fill: blue)
    #text("{{.RM}}",size: 9pt, weight: "medium", fill: black)
  ]
  #place(dx: 96%,dy:10pt)[
    #text(
      context {
        let pageNum = counter(page).get().first()
        if pageNum < 10 {
          "0" + str(pageNum)
        } else {
          pageNum
        }
      },
      size: 14pt,
      weight: "medium",
      fill: blue,
    )
  ]
])
#set text(size: 15pt, font: "Bai Jamjuree")
#set page(
  paper: "a4",
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
// please dont remove the below date. as based on it only date format is working everywhere!!!!!
{{$RequredDateFormat :="02 Jan 2006"}}
#let ReportDate = "{{DateFormatter .ReportDate $RequredDateFormat}}"
#let ReportBeginDate = "{{DateFormatter .ReportFrom $RequredDateFormat}}"
#let ReportEndDate = "{{DateFormatter .ReportFrom $RequredDateFormat}}"
#let ReportPeriod = "{{DateFormatter .PrintDate $RequredDateFormat}}"
#place(top + right, dx: -55pt,dy: -20pt)[
  #image("./assets/images/kfintech-logo.png",width: 152pt,height: 30pt)
]
#place(bottom + left, dx: -40pt, dy: -20pt)[
  #image("./assets/images/design.png",height: 170pt, width: 250pt)
]


#place(bottom + right, dx: -57pt, dy: -20pt)[
  #image("./assets/images/bgdesign.jpg", width: 520pt, height: 170pt)
]


#place(
  dx: 520pt,
  dy: 140pt,
)[
  #box(width: 230pt, height: 180pt, fill: rgb("#EEF1F0"))[
    #place(
      dx: 43pt,
      dy: 28pt,
      //  index box code
      context {
        let outline_data = query(heading.where(level: 1))
        for entry in outline_data {
          link(entry.location(), [
            #box(width: 80%, text(weight: "bold", size: 9pt, fill: rgb("#005397"), entry.body))
            #v(-10pt)
          ])
        }
      },
    )

  ]

#place(dx: 200pt,dy: -175pt)[
  #place(top + right, dx: -180pt, dy: 20pt, line(
    stroke: 1pt + rgb("#2F75B5"),
    start: (0pt, 0pt),
    end: (0pt, 120pt),
  ))
  #place(top + right, dx: -178.5pt, dy: 20pt, box(fill: rgb("#0090F3"), width: 3pt, height: 15pt))]
  #place(
    bottom + right,
    dy: -140pt,
    dx: -3pt,
  )[
    #box(fill: rgb("#005397"), stroke: none, width: 30pt, height: 40pt, radius: (
      left: 0pt,
      right: 0pt,
      bottom-right: 100pt,
      bottom-left: 00pt,
    ))[


      #pad(
        left: 0% + 10pt,
        top: 0% + 0pt,
        right: 0% + 4pt,
        bottom: 0% + 20pt,
      )[
        #text(weight: "bold", "Index", fill: white,size: 9pt)
      ]
    ]
  ]
]





#show heading: it => place(text(weight: "bold", fill: red, size: 0pt, it.body))


#place(
  dx: 20pt,
  dy: 20pt,
)[
  #box()[

    #text(fill: rgb("#0B1A24"), weight: "extrabold",  size: 45pt, "PORTFOLIO")\
    #text(fill: rgb("#248DDC"), weight: "bold",  size: 22.5pt, "ANALYSIS REPORT")
    #v(2pt)
    #text(fill: rgb("#0B1A24"), weight: "bold",  size: 16pt, "KFin Capitals / ")
    #text(fill: rgb("#D4567B"), weight: "bold",  size: 16pt, "W0000339")
  ]
]

#place(dx: 20pt,dy:-210pt)[

  #place(
    top + left,
    dy: 350pt,
  )[
    #block()[
      #text("Report as on date", size: 9pt, weight: "bold",  fill: rgb("248DDC"))
      #v(2pt)
      #text(ReportDate, size: 9pt, weight: "bold",  fill: black)
    ]
  ]
  #place(
    top + left,
    dx: 180pt,
    dy: 350pt,
  )[
    #block()[
      #text("Report Period", size: 9pt, weight: "bold", fill: rgb("248DDC"))
      #v(2pt)
      #text(ReportBeginDate+ " - " +ReportEndDate, size: 9pt, weight: "bold",  fill: black)
    ]
  ]

  #place(
    top + left,
    dx: 360pt,
    dy: 350pt,
  )[
    #block()[
      #text("Print date", size: 9pt, weight: "bold",  fill: rgb("248DDC"))
      #v(2pt)
      #text(ReportPeriod, size: 9pt, weight: "bold",  fill: black)
    ]
  ]

  #place(
    top + left,
    dy: 400pt,
  )[
    #block()[
      #text("Report is at", size: 9pt, weight: "bold",  fill: rgb("248DDC"))
      #v(-5pt)
      #text("Investor Level", size: 16pt, weight: "bold",  fill: black)
    ]
  ]

]

#place(
  bottom + left,
  dx: -280pt,
  dy: 120pt,
)[
  #place(bottom + left, dx: 650pt, dy: -80pt, rect(width: 100%, stroke: none)[
    #set stack(spacing: 16pt)

    #stack(
      stack(spacing: 0.4cm, text("RM Name", weight: "bold", fill: rgb("248DDC"), size: 9pt)),
      block(width: 350pt)[
        #stack(block(width: 350pt)[
          #text("{{.RM}}", fill: black, weight: "bold", size: 9pt)
        ])
      ],
    )
  ])



#place(bottom + left, dx: 770pt, dy: -80pt, rect(width: 100%, stroke: none)[
  #set stack(spacing: 16pt)
  #set text(hyphenate: true, lang: "en")

  #stack(
    block(width: 350pt, height: 30pt)[
   #text("Email", weight: "bold", fill: rgb("248DDC"), size: 9pt)
  ],
    block(width: 350pt)[
      #stack(
        block(width: 350pt)[
          #box(width: 350pt, clip: false)[
            #text("{{.RMEmail}}".replace(".", ".").replace("@", "@"), fill: black, weight: "bold", size: 9pt)
          ]
        ]
      )
    ],
  )
])
  #place(bottom + left, dx: 950pt, dy: -80pt, rect(width: 100%, stroke: none)[
    #set stack(spacing: 16pt)

    #stack(
      stack(spacing: 0.4cm, text("Phone Number", weight: "bold", fill: rgb("248DDC"), size: 9pt)),
      block(width: 350pt)[
        #stack(block(width: 350pt)[
          #text("{{.RMMobile}}", fill: black, weight: "bold", size: 9pt)
        ])
      ],
    )
  ])
]

