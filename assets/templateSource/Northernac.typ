#import "@preview/echarm:0.2.0"
// #import "footer.typ" :customFooter
// #import "@preview/shadowed:0.2.0": shadowed
// #let pageNumberBelowTen = context{
//   counter(page).display("1")
// }
// #let pageNumber = context{
//   counter(page).display("01")
// }
// #let currentPageNo = context{
//   counter(page).get().first()
// }
#let customFooter = box(
  width: 100%,
  height: 30pt,
  inset: 10pt,
  align(center + bottom)[
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
  ],
)
#set text(size: 12pt, font: "Bai Jamjuree")
#set page(
  paper: "a2",
  flipped: true,
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
  #image("assets/bg design2.jpg", width: 100%, height: 100%)
]
#place(top + right, dx: -90pt)[
  #image("assets/kfintech-logo.png", width: 300pt)
]
#place(bottom + left, dx: -40pt, dy: -150pt)[
  #image("assets/design.png", width: 480pt)
]


#place(bottom + right, dx: -140pt, dy: -150pt)[
  #image("assets/bgdesign.jpg", width: 1050pt, height: 370pt)
]

// //
// #place(
// dx:1000pt,
// dy: 350pt)[
// // #box(width: 500pt,height: 400pt,fill: rgb("#EEF1F0"))[
//   #place(dx: 1100pt,
//   dy:450pt )[
//    #stack(


//        outline(title: none,depth: 1)
//   )
//     ]
//  ]
//]


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
          link(
            entry.location(),
            [
              #box(
                width: 80%,
                text(weight: "bold", size: 2.3em, fill: rgb("#005397"), entry.body),
              )
              #v(10pt)
            ],
          )
        }
      },
    )

  ]


  #place(
    top + right,
    dx: -440pt,
    dy: 50pt,
    line(
      stroke: 2pt + rgb("#2F75B5"),
      start: (0pt, 0pt),
      end: (0pt, 330pt),
    ),
  )
  #place(
    top + right,
    dx: -437pt,
    dy: 50pt,
    box(fill: rgb("#0090F3"), width: 6pt, height: 25pt),
  )
  #place(
    bottom + right,
    dy: -320pt,
    dx: -20pt,
  )[
    #box(
      fill: rgb("#005397"),
      stroke: none,
      width: 50pt,
      height: 80pt,
      radius: (
        left: 0pt,
        right: 0pt,
        bottom-right: 100pt,
        bottom-left: 00pt,
      ),
    )[


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

//Outline code
// #show outline.entry: it => [
//   #link(
//     it.element.location(),
//     [
//         #box(
//         width: 35%,
//           stack(
//             dir: ltr,
//             spacing: 100%,
//             align(left)[
//               #stack(
//                 dir: ltr,
//                 spacing: 20pt,
//                 circle(radius:10pt,fill: white),
//                 text(weight: "bold", size: 3em,fill: white,it.body()),
//               )
//             ],
//             align(right,text(weight: "bold",size: 3em,fill: white,it.page()))
//         )
//       )
//       #v(6pt)
//     ]
//   )
// ]

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
  #place(
    bottom + left,
    dx: 800pt,
    dy: -80pt,
    rect(width: 100%, stroke: none)[
      #set stack(spacing: 16pt)

      #stack(
        stack(spacing: 0.4cm, text("Client Name", weight: "bold", font: "Open Sans", fill: rgb("248DDC"), size: 25pt)),
        block(width: 350pt)[
          #stack(
            block(width: 350pt)[
              #text("", fill: black, weight: "bold", font: "Open Sans", size: 25pt)
            ],
          )
        ],
      )
    ],
  )
  #place(
    bottom + left,
    dx: 1070pt,
    dy: -80pt,
    rect(width: 100%, stroke: none)[
      #set stack(spacing: 16pt)

      #stack(
        stack(spacing: 0.4cm, text("Email", weight: "bold", font: "Open Sans", fill: rgb("248DDC"), size: 25pt)),
        block(width: 350pt)[
          #stack(
            block(width: 350pt)[
              #text("-", fill: black, weight: "bold", font: "Open Sans", size: 25pt)
            ],
          )
        ],
      )
    ],
  )
  #place(
    bottom + left,
    dx: 1340pt,
    dy: -80pt,
    rect(width: 100%, stroke: none)[
      #set stack(spacing: 16pt)

      #stack(
        stack(spacing: 0.4cm, text("Phone Number", weight: "bold", font: "Open Sans", fill: rgb("248DDC"), size: 25pt)),
        block(width: 350pt)[
          #stack(
            block(width: 350pt)[
              #text("-", fill: black, weight: "bold", font: "Open Sans", size: 25pt)
            ],
          )
        ],
      )
    ],
  )
]

//Executive Summary Page
#pagebreak()

#text("Executive Summary", size: 40pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#hide[

  #heading(outlined: true)[#text([Executive Summary], fill: rgb("#0d3c6a"), size: 25pt)]

]
#place(
  dx: 75%,
  dy: -7%,
  [#image("assets/kfintech-logo.png", width: 350pt)],
)
#place(
  dy: 20pt,
  [#line(length: 100%)],
)
#let headerBg = rgb("#f4f5f6")
// Define colors and data
#let primaryColors = (
  "#5470c6", // Equities
  "#91cc75", // Alternatives
  "#fac858", // Fixed Income
  "#ee6666", // Commodities
  "#73c0de", // Liq & Eqv.
)
// Current asset allocation data
#let currentData = (
  (value: 10, name: "Equities"),
  (value: 20, name: "Alternatives"),
  (value: 5, name: "Fixed Income"),
  (value: 0, name: "Commodities"),
  (value: 0, name: "Liq & Eqv."),
)

// Page and header settings
#let NexedgeHeaderColor = "#353535"
#let headersize_xs = 18pt
#let titlePadding = (top: 15pt, bottom: 15pt, left: 20pt, right: 20pt)

// Small cards data




#let tableData = (
  (month: "Sep 2023", portfolioReturn: "8.1%", benchmarkReturn: "0.2%", excessReturn: "7.9%"),
  (month: "Oct 2023", portfolioReturn: "7.5%", benchmarkReturn: "0.3%", excessReturn: "7.2%"),
  (month: "Nov 2023", portfolioReturn: "6.9%", benchmarkReturn: "0.1%", excessReturn: "6.8%"),
  (month: "Dec 2023", portfolioReturn: "7.2%", benchmarkReturn: "0.4%", excessReturn: "6.8%"),
)
// Place small cards on the left
#let smallCardList = (
  (description: "INFLOW MINUS OUTFLOW", Value: "₹ -26,78,06,427.9", Date: "Since Inception", Image: "assets/one.png"),
  (description: "HOLDING COST", Value: "₹ 1,32,48,47,581.1", Date: "as on 30 Jun 2022", Image: "assets/two.png"),
  (description: "CURRENT VALUE", Value: "₹ 1,64,89,89,920.8", Date: "as on 30 Jun 2022", Image: "assets/three.png"),
  (description: "PORTFOLIO RETURN(IRR)", Value: "24.5%", Date: "Since Inception", Image: "assets/four.png"),
  (
    description: "NIFTY",
    des: "SENSEX",
    Value: "-2.631%",
    Value1: "0.569%",
    Date: "12-May-2025",
    Image: "assets/fiveone.png",
    Image2: "assets/fivetwo.png",
  ),
  (description: "BENCHMARK RETURN(IRR)", Value: "4.25%", Date: "Since Inception", Image: "assets/six.png"),
)

#place(top + left, dy: 80pt)[

  #grid(
    columns: 2,
    column-gutter: 10pt,
    row-gutter: 10pt,
    ..smallCardList.map(item => {
      box(
        inset: (y: 14pt, x: 10pt),
        width: 400pt,
        height: 155pt,
        radius: 8pt,
        stroke: (2.8pt + luma(88%)),
        fill: white,
      )[
        // Display description for all cards
        #if item.description != "NIFTY" {
          text(item.description, size: 20pt, weight: "extrabold")
        } else {
          place(dx: 0pt, dy: -10pt)[
            #image(item.Image, width: 50pt, height: 55pt)
            #text(item.description, size: 20pt, weight: "extrabold")
          ]
        }



        // Display appropriate images based on the description
        #if item.description == "NIFTY" {
          // For NIFTY, place first image under description
          place(dx: 310pt, dy: -10pt)[
            #image(item.Image2, width: 50pt, height: 55pt)
            #text(item.des, size: 20pt, weight: "extrabold")
          ]
          // Display the "des" field for NIFTY

          // Place second image under the "des" field
          place(dx: 250pt, dy: 38pt)[

          ]
        } else {
          // For other cards, display single image
          place(dx: 310pt, dy: -45pt)[
            #image(item.Image, width: 55pt, height: 55pt)
          ]
        }

        // Display date only for non-NIFTY cards
        #if item.description != "NIFTY" {
          text(item.Date, size: 25pt, fill: rgb("#0006"), weight: "extrabold", spacing: 2pt, baseline: -3pt)
        }
        // Handle value display based on card type
        #if item.description == "NIFTY" {
          // For NIFTY card, display Value under NIFTY
          place(dx: 0pt, dy: 105pt)[
            #text(item.Value, size: 25pt, weight: "bold", spacing: 2pt)
          ]

          // Display Value1 under SENSEX
          place(dx: 310pt, dy: 105pt)[
            #text(item.Value1, size: 25pt, weight: "bold", spacing: 2pt)
          ]
        } else {
          // For other cards, display Value centered
          align(horizon, text(item.Value, size: 25pt, spacing: 2pt, weight: "bold", stretch: 50%))
        }
      ]
    })
  )
]

// Place donut chart on the right
#place(top + right, dy: 80pt)[
  #box(
    inset: (y: 14pt, x: 10pt),
    width: 790pt,
    height: 485pt,
    radius: 8pt,
    stroke: (2.8pt + luma(88%)),
  )[
    // Chart titles
    #place(dx: 145pt, dy: 145pt, text(weight: "extrabold", size: 25pt, "Current"))
    #place(dx: 400pt, dy: 145pt, text(weight: "extrabold", size: 22pt, " Risk assessment not
 available"))

    #place(
      dx: 10pt,
      dy: -15pt,
      pad(..titlePadding, text("Asset Allocation (%)", size: 30pt, fill: rgb("0e496e"), weight: "extrabold")),
    )
    // Main header



    // Grid for the two charts
    #grid(
      columns: (1fr, 1fr),
      align: (center),
      // Current allocation chart
      box(width: 100%, height: 70%, stroke: none)[
        #echarm.render(
          width: 100%,
          height: 100%,
          options: (
            series: (
              name: "Current Allocation",
              type: "pie",
              radius: ("60%", "70%"),
              avoidLabelOverlap: false,
              color: primaryColors,
              itemStyle: (
                borderColor: "#fff",
                borderWidth: 0,
              ),
              labelLine: (
                //  show: true,
              ),
              data: currentData,
            ),
          ),
        )
      ],

      // Target allocation chart
    )

    // Legend for the charts

    #pad(
      left: 20pt,
      top: -20pt,
      grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 1pt,
        column-gutter: -400pt,
        inset: 0.5em,
        align: left,
        stack(
          dir: ltr,
          spacing: 10pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(0))),
          text("10 %
Equities", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 10pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(1))),
          text("20 %
Alternatives", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 10pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
          text("5 %
Fixed Income", size: 16pt),
        ),

        stack(
          dir: ltr,
          spacing: 10pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
          text("18.5 %
Hybrid", size: 16pt),
        ),
      ),
    )
  ]
]
#place(bottom + left, dy: 15pt)[
  #box(
    inset: (y: 60pt, x: 10pt),
    width: 810pt,
    height: 490pt,
    radius: 8pt,
    stroke: (2.8pt + luma(88%)),
  )[
    #place(
      dx: 10pt,
      dy: -10pt,
      pad(..titlePadding, text(" Relative Performance", size: 30pt, fill: rgb("0e496e"), weight: "extrabold")),
    )
    // Main header
    #set table(
      fill: (x, y) => if y == 0 {
        headerBg
      } else {
        rgb("#ffff")
      },
    )

    #place(
      dx: 2pt,
      dy: 60pt,


      // Table with horizontal lines only
      table(
        stroke: none,
        columns: (1fr, 1fr, 1fr, 1fr),
        inset: 20pt,
        align: horizon,

        // Table header with increased text size
        table.header(
          [],
          [#text(size: 18pt, weight: "bold", "Portfolio Returns")],
          [#text(size: 18pt, weight: "bold", "Benchmark Returns")],
          [#text(size: 18pt, weight: "bold", "Excess Returns")],
        ),

        table.hline(), // Horizontal line under the header

        // Table rows generated from tableData with increased text size
        ..tableData
          .map(row => {
            (
              text(size: 16pt, row.month),
              text(size: 16pt, row.portfolioReturn),
              text(size: 16pt, row.benchmarkReturn),
              text(size: 16pt, row.excessReturn),
              table.hline(),
            )
          })
          .flatten()
      ),
    )
    // Grid for the two chart
    // Legend for the charts
  ]
]
#place(bottom + right, dy: 15pt)[
  #box(
    inset: (y: 60pt, x: 10pt),

    width: 790pt,
    height: 490pt,
    radius: 8pt,
    stroke: (2.8pt + luma(88%)),
  )[
    // Main header
    #place(
      dx: 10pt,
      dy: -10pt,
      pad(
        ..titlePadding,
        text("Quarterly Asset Allocation Trends", size: 30pt, fill: rgb("0e496e"), weight: "extrabold"),
      ),
    )


    // Chart placement
    // Define color scheme to match your image
    #let chartColors = (
      rgb("#00c896"), // Hybrid (green)
      rgb("#f39c12"), // Equity (orange)
      rgb("#1295b8"), // Debt (teal)
      rgb("#e74c3c"), // Commodities (red)
    )

    // Data for quarterly asset allocation
    #let quarterData = (
      (quarter: "Jun 2024", values: (19.51, 32.60, 48.32, 0.57)), // Values in percentages
      (quarter: "Mar 2024", values: (11.76, 34.51, 53.13, 0.60)),
      (quarter: "Dec 2023", values: (0, 33.93, 58.90, 7.17)),
      (quarter: "Sep 2023", values: (0, 30.68, 61.85, 7.47)),
    )

    #let assetClasses = (
      "Hybrid",
      "Equity",
      "Debt",
      "Commodities",
    )

    // Chart container function
    #let allocation_chart() = {
      // Chart height calculation
      let rowHeight = 40pt
      let totalHeight = quarterData.len() * rowHeight + 80pt // Extra height for title and legend

      box(
        width: 100%,
        height: totalHeight,
        inset: (x: 10pt, y: 15pt),
        radius: 8pt,
        stroke: none,
      )[
        // Title


        // Draw axis
        #place(
          dx: 0pt,
          dy: 35pt,
          line(
            start: (90pt, 0pt),
            end: (90pt, rowHeight * quarterData.len() + 20pt),
          ),
        )

        // X-axis labels
        #for i in range(0, 6) {
          let value = i * 20
          let xPos = 90pt + (i * 80pt)

          place(
            dx: xPos,
            dy: rowHeight * quarterData.len() + 60pt,
            text(str(value), size: 9pt),
          )
        }

        // Draw bars
        #for (i, row) in quarterData.enumerate() {
          let yPos = 65pt + i * rowHeight

          // Quarter label
          place(
            dx: 15pt,
            dy: yPos,
            text(size: 11pt, weight: "medium", row.quarter),
          )

          // Draw bar segments
          let xRunning = 90pt
          let totalWidth = 450pt // Total width of the bar (representing 100%)
          for (j, value) in row.values.enumerate() {
            if value > 0 {
              let segmentWidth = value * totalWidth / 100

              place(
                dx: xRunning,
                dy: yPos - 15pt,
                box(
                  width: segmentWidth,
                  height: 39pt,
                  fill: chartColors.at(j),
                  radius: (
                    top-left: if j == 0 { 4pt } else { 0pt },
                    bottom-left: if j == 0 { 4pt } else { 0pt },
                    top-right: if j == row.values.len() - 1
                      or j == row.values.enumerate().find(((_, v)) => v > 0).last() { 7pt } else { 0pt },
                    bottom-right: if j == row.values.len() - 1
                      or j == row.values.enumerate().find(((_, v)) => v > 0).last() { 7pt } else { 0pt },
                  ),
                ),
              )

              // Add percentage label if segment is wide enough
              if value >= 5 {
                place(
                  dx: xRunning + segmentWidth / 2 - 12pt,
                  dy: yPos,
                  text(
                    fill: white,
                    weight: "medium",
                    size: 10pt,
                    str(value) + "%",
                  ),
                )
              }

              xRunning += segmentWidth
            }
          }
        }

        // Legend
        #place(dy: 250pt)[
          #pad(
            left: 20pt,
            top: 1pt,
            grid(
              columns: (1fr, 1fr, 1fr, 1fr),
              gutter: -300pt,
              inset: 1pt,
              align: left,
              stack(
                dir: ltr,
                spacing: 10pt,
                rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(1))),
                text("Hybrid", size: 16pt),
              ),
              stack(
                dir: ltr,
                spacing: 10pt,
                rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
                text("Equity", size: 16pt),
              ),
              stack(
                dir: ltr,
                spacing: 10pt,
                rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(4))),
                text("
Debt", size: 16pt),
              ),
              [#stack(
                  dir: ltr,
                  spacing: 10pt,
                  rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(3))),
                  text("Commodities", size: 16pt),
                )],
            ),
          )
        ]
      ]
    }
    // Generate the chart
    #place()[

      #allocation_chart()
    ]
  ]
]

#pagebreak()

#let primaryColors = (
  "#5470c6", // Equities
  "#91cc75", // Alternatives
  "#fac858", // Fixed Income
  "#ee6666", // Commodities
  "#73c0de", // Liq & Eqv.
)

#let currentData1 = (
  (value: 30, name: "Equities"),
  (value: 61, name: "Alternatives"),
  (value: 6, name: "Commodities"),
  (value: 0.6, name: "Fixed Income"),
  (value: 0, name: "Liq & Eqv."),
)

#let currentData2 = (
  (value: 18, name: "Equities"),
  (value: 48, name: "Alternatives"),
  (value: 32, name: "Fixed Income"),
  (value: 0.6, name: "Commodities"),
  (value: 0, name: "Liq & Eqv."),
)

#text("Portfolio Allocation", size: 40pt, fill: rgb("0e496e"), weight: "extrabold")
#hide[
  #heading(outlined: true)[#text([ Performance Summary], fill: rgb("#0d3c6a"), size: 25pt)]
]

#place(dx: 75%, dy: -70pt, [#image("assets/kfintech-logo.png", width: 350pt)])
#place(dy: 10pt, [#line(length: 100%)])
#v(100pt)



#place(top + left, dy: 70pt)[
  #box(
    inset: (y: 14pt, x: 10pt),
    width: 780pt,
    height: 1010pt,
    radius: 8pt,
    stroke: (2.8pt + luma(88%)),
  )[
    // Chart titles
    #place(dx: 70pt, dy: 220pt, text(weight: "extrabold", size: 25pt, "Beginning Allocation
        30-Sep-2023"))
    #place(dx: 470pt, dy: 220pt, text(weight: "extrabold", size: 25pt, " Ending Allocation
     30-Jun-2024"))

    #place(
      dx: 10pt,
      dy: -15pt,
      pad(
        ..titlePadding,
        text("Portfolio Allocation by  Asset Class", size: 30pt, fill: rgb("0e496e"), weight: "extrabold"),
      ),
    )
    // Main header
    #pad(
      left: 5pt,
      top: -150pt,
      // Grid for the two charts
      grid(
        columns: (1fr, 1fr),
        align: (center),
        // Current allocation chart
        box(
          width: 120%,
          height: 70%,
          stroke: none,
        )[
          #echarm.render(
            width: 100%,
            height: 100%,
            options: (
              series: (
                name: "Current Allocation",
                type: "pie",
                radius: ("60%", "70%"),
                avoidLabelOverlap: false,
                color: primaryColors,
                itemStyle: (borderColor: "#fff", borderWidth: 0),
                labelLine: (
                  //  show: true,
                ),
                data: currentData1,
              ),
            ),
          ),
          #place(
            dx: 20%,
            dy: -210pt,
          )[
            #grid(
              columns: (1fr, 1fr, 1fr),
              column-gutter: (-200pt),
              gutter: 80pt, // Slightly reduced gutter
              inset: -2.2em, // Reduced inset for less side padding
              align: left,
              stack(
                dir: ltr,
                spacing: 6pt,
                rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(0))),
                text("0.6% CO", size: 16pt),
              ),
              stack(
                dir: ltr,
                spacing: 6pt,
                rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(1))),
                text("61.9 DE", size: 16pt),
              ),
              stack(
                dir: ltr,
                spacing: 6pt,
                rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
                text("30.7 EQ", size: 16pt),
              ),
              stack(
                dir: ltr,
                spacing: 6pt,
                rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
                text("6.8 HY", size: 16pt),
              )
            )
          ]

        ],
        box(
          width: 120%,
          height: 70%,
          stroke: none,
        )[
          #echarm.render(
            width: 100%,
            height: 100%,
            options: (
              series: (
                name: "Current Allocation",
                type: "pie",
                radius: ("60%", "70%"),
                avoidLabelOverlap: false,
                color: primaryColors,
                itemStyle: (
                  borderColor: "#fff",
                  borderWidth: 0,
                ),
                labelLine: (
                  //  show: true,
                ),
                data: currentData2,
              ),
            ),
          )
          #place(
            dx: 95pt,
            dy: -188pt,
          )[
            #grid(
              columns: (1fr, 1fr, 1fr),
              column-gutter: (-200pt),
              gutter: 80pt, // Slightly reduced gutter
              inset: -2.2em, // Reduced inset for less side padding
              align: left,
              stack(
                dir: ltr,
                spacing: 6pt,
                rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(0))),
                text("0.6% CO", size: 16pt),
              ),

              stack(
                dir: ltr,
                spacing: 6pt,
                rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(1))),
                text("61.9 DE", size: 16pt),
              ),
              stack(
                dir: ltr,
                spacing: 6pt,
                rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
                text("30.7 EQ", size: 16pt),
              ),
              stack(
                dir: ltr,
                spacing: 6pt,
                rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
                text("6.8 HY", size: 16pt),
              )
            )
          ]
        ],
      ),
    )
    #place(dy: -100pt)[
      #set table(
        fill: (x, y) => if y == 0 or y == 1 {
          rgb("#f1f1f1")
        },
      )
      #let botdata = (
        (Assets: "Commodities", Amount: [73,78,986.34], per: [0.6%], Ammount2: [89,58,981.57], per2: [0.6%]),
        (Assets: "Debt", Amount: [70,76,14,485.07], per: [ 61.9%], Ammount2: [ 74,53,15,749.63], per2: [48.3%]),
        (Assets: "Equity", Amount: [ 35,10,00,418.77], per: [30.7%], Ammount2: [50,28,50,050.31], per2: [32.6%]),
        (Assets: "Hybrid", Amount: [ 7,80,29,548.29], per: [6.8%], Ammount2: [28,54,57,420.85], per2: [ 18.5%]),
      )

      #table(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr),
        stroke: none,
        align: center,
        inset: 20pt,
        table.cell(rowspan: 2, align: horizon, [Asset Class]),
        table.cell(colspan: 2, align: horizon, [Beginning Value]),
        table.cell(colspan: 2, align: horizon, [Ending Value]),
        table.cell(align: horizon, [Amount(₹)]),
        table.cell(align: horizon, [%]),
        table.cell(align: horizon, [Amount(₹)]),
        table.cell(align: horizon, [%]),
        table.hline(),

        ..botdata
          .map(row => {
            (
              text(size: 16pt, row.Assets),
              text(size: 16pt, row.Amount),
              text(size: 16pt, row.per),
              text(size: 16pt, row.Ammount2),
              text(size: 16pt, row.per2),
              table.hline(),
            )
          })
          .flatten()
      )
    ]
  ]
]

#place(top + right, dy: 70pt, dx: -30pt)[
  #box(
    inset: (y: 14pt, x: 50pt),
    width: 780pt,
    height: 1010pt,
    radius: 8pt,
    stroke: (2.8pt + luma(88%)),
  )[
    #place(
      dx: 10pt,
      dy: -15pt,
      pad(
        ..titlePadding,
        text("Portfolio Breakup by Product Type", size: 30pt, fill: rgb("0e496e"), weight: "extrabold"),
      ),
    )
    #place(top + right, dy: 50pt, dx: -650pt)[
      #let categories = ("AIF", "Equity", "Mutual Funds", "NCD", "PMS")

      #let beginning = (30, 10, 1000, 15, 25)

      #let ending = (40, 60, 1350, 20, 30)

      #let max-value = 1500

      // Chart dimensions

      #let bar-width = 50pt

      #let bar-spacing = 4pt

      #let group-spacing = 20pt

      #let chart-height = 450pt

      // Draw the entire chart

      #block(
        width: auto,
        height: auto,
        inset: 0pt,
        {
          v(20pt)

          // Main chart area with Y-axis and bars

          box(
            width: auto,
            height: auto,
            {
              // Y-axis with values and grid lines

              place(
                box(
                  width: 30pt,
                  height: chart-height,
                  {
                    // Y-axis vertical line

                    place(dx: 30pt, dy: 0pt, line(start: (0pt, 0pt), end: (0pt, chart-height), stroke: 1pt))

                    // Y-axis values and horizontal grid lines - increments of 250

                    for i in range(7) {
                      let y-value = max-value - i * 250

                      let y-pos = chart-height * float(i * 250) / float(max-value)

                      // Y-axis value

                      place(dx: 0pt, dy: y-pos, align(right, text(size: 8pt)[#y-value]))

                      // Horizontal grid line (light gray)

                      place(
                        dx: 30pt,
                        dy: y-pos,
                        line(
                          start: (0pt, 0pt),
                          end: (50pt, 0pt),
                          stroke: (paint: rgb(200, 200, 200), thickness: 0.5pt),
                        ),
                      )
                    }
                  },
                ),
              )

              // Chart with bars

              place(
                dx: 35pt,
                dy: 0pt,
                {
                  box(
                    width: auto,
                    height: chart-height,
                    {
                      // Calculate total width to use for x-axis line

                      let total-width = categories.len() * (2 * bar-width + bar-spacing + group-spacing)

                      // X-axis line

                      place(dx: 0pt, dy: chart-height, line(start: (0pt, 0pt), end: (total-width, 0pt), stroke: 1pt))

                      // Draw bars for each category

                      let x-pos = 0pt

                      for i in range(categories.len()) {
                        let cat = categories.at(i)

                        let beg = beginning.at(i)

                        let end = ending.at(i)

                        // Calculate bar heights

                        let beg-height = float(beg) / float(max-value) * chart-height

                        let end-height = float(end) / float(max-value) * chart-height

                        // Draw group

                        place(
                          dx: x-pos,
                          dy: 0pt,
                          {
                            // Beginning value bar (green)

                            place(
                              dx: 0pt,
                              dy: chart-height - beg-height,

                              rect(
                                width: bar-width,
                                height: beg-height,
                                fill: rgb(0, 128, 0),
                                radius: (
                                  top: 15pt,
                                ),
                              ),
                            )

                            // Ending value bar (blue)

                            place(
                              dx: bar-width + bar-spacing,
                              dy: chart-height - end-height,

                              rect(
                                width: bar-width,
                                height: end-height,
                                fill: rgb(0, 0, 255),
                                radius: (
                                  top: 15pt,
                                ),
                              ),
                            )

                            // Category label

                            place(
                              dx: 0pt,
                              dy: chart-height + 5pt,

                              box(
                                width: 2 * bar-width + bar-spacing,
                                {
                                  align(center, text(size: 10pt, weight: "medium")[#cat])
                                },
                              ),
                            )

                            // Tick mark on x-axis

                            place(
                              dx: bar-width,
                              dy: chart-height,

                              line(start: (0pt, 0pt), end: (0pt, 5pt), stroke: 1pt),
                            )
                          },
                        )

                        // Move to next group position

                        x-pos += 2 * bar-width + bar-spacing + group-spacing
                      }
                    },
                  )
                },
              )
            },
          )

          // Y-axis label

          // place(dx: -30pt, dy: chart-height/2, rotate(90deg, text(size: 12pt)[Value]))

          // Legend

          v(50pt)
          place(dx: 450pt)[
            #align(
              center,
              {
                box(width: 15pt, height: 15pt, fill: rgb(0, 128, 0))

                h(5pt)

                text(size: 12pt)[Beginning Value]

                h(30pt)

                box(width: 15pt, height: 15pt, fill: rgb(0, 0, 255))

                h(5pt)

                text(size: 12pt)[Ending Value]
              },
            )
          ]
        },
      )]

    #place(dy: 600pt)[
      #set table(
        fill: (x, y) => if y == 0 or y == 1 {
          rgb("#f1f1f1")
        },
      )
      #set table.hline(stroke: .16pt)
      #let botdata = (
        (Assets: " AIF", Amount: [ 4,04,40,000], per: [ 3.5%], Ammount2: [ 4,04,40,000], per2: [2.6%]),
        (Assets: " Equity", Amount: [ 4,76,68,081.5], per: [ 4.2%], Ammount2: [ 7,00,82,105.71], per2: [ 4.5%]),
        (
          Assets: " Mutual Fund",
          Amount: [ 1,00,55,31,987.97],
          per: [ 87.9%],
          Ammount2: [ 1,38,16,76,727.65],
          per2: [ 89.6%],
        ),
        (Assets: " NCD", Amount: [ 1,69,20,000 ], per: [1.5% ], Ammount2: [1,69,20,000 ], per2: [ 1.1%]),
        (Assets: "PMS", Amount: [ 3,34,63,369 ], per: [2.9% ], Ammount2: [3,34,63,369 ], per2: [ 2.2%]),
      )


      #table(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr),
        stroke: none,
        align: center,
        inset: 20pt,
        table.cell(rowspan: 2, align: horizon, [ Product Type]),
        table.cell(colspan: 2, align: horizon, [Beginning Value]),
        table.cell(colspan: 2, align: horizon, [Ending Value]),
        table.cell(align: horizon, [Amount(₹)]),
        table.cell(align: horizon, [%]),
        table.cell(align: horizon, [Amount(₹)]),
        table.cell(align: horizon, [%]),
        //table.hline(),

        ..botdata
          .map(row => {
            (
              text(size: 16pt, row.Assets),
              text(size: 16pt, row.Amount),
              text(size: 16pt, row.per),
              text(size: 16pt, row.Ammount2),
              text(size: 16pt, row.per2),
              table.hline(),
            )
          })
          .flatten()
      )
    ]


  ]

]



#pagebreak()




#text("Asset Class Wise Summary", size: 40pt, fill: rgb("#0d3c6a"), weight: "extrabold")
\
\
#hide[
  #heading(outlined: true)[#text([ Ageing Report], fill: rgb("#0d3c6a"), size: 25pt)]
]
#text("as on " + FormatedDate2, size: 20pt, fill: rgb("#6b737e"), weight: "extrabold")

#place(top + right, dx: -35pt, dy: -40pt, [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)]),
#place(
  dy: -20pt,
  [#line(length: 100%)],
)



#v(20pt)

#let heading0 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")

#set table(
  stroke: none,
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else if y == 3 or y == 8 or y == 11 or y == 13 {
    highlightBlue
  } else {
    whiteBg
  },
  align: (x, y) => if y == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)


#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 9,
      align: left + horizon,
      [#text(fill: heading0, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading0, weight: "black", [Particulars])]),
    table.cell([#text(fill: heading0, weight: "black", [Market Value])]),
    table.cell([#text(fill: heading0, weight: "black", [% Holding])]),
    table.cell([#text(fill: heading0, weight: "black", [Holding Cost])]),
    table.cell([#text(fill: heading0, weight: "black", [Gain/Loss Realised])]),
    table.cell([#text(fill: heading0, weight: "black", [Dividend Interest])]),
    table.cell([#text(fill: heading0, weight: "black", [Gain/Loss Unrealised])]),
    table.cell([#text(fill: heading0, weight: "black", [IRR%])]),
    table.cell([#text(fill: heading0, weight: "black", [Benchmark])]),
  ),

  // Sample data
  [Equity], [59,62,70,402.8], [100], [37,98,24,921.4], [21,355.6], [0], [21,64,45,481.5], [102.6], [-],
  [AIF], [5,89,75,000], [9.9], [4,04,40,000], [0], [0], [1,85,35,000], [14.8], [DIVERSE],
  [Equity], [10,03,87,191.6], [16.8], [5,87,90,164.4], [21,355.6], [0], [4,15,97,027.2], [46.9], [SENSEX],
  table.hline(stroke: rgb(gray)),
  [Mutual Funds], [37,83,47,315.5], [63.5], [24,71,31,387.9], [0], [0], [13,12,15,927.5], [26], [NIFTY],
  table.hline(stroke: rgb(gray)),
  [PMS], [5,85,60,895.8], [9.8], [3,34,63,369], [0], [0], [2,50,97,526.8], [15], [DIVERSE],

  [Debt], [75,29,72,335.6], [100], [67,44,29,625.3], [8,500], [0], [7,84,42,710.3], [10], [-],
  [NCD], [1,77,84,000], [2.4], [1,69,20,000], [0], [0], [8,64,000], [4.3], [HYBRID],
  table.hline(stroke: rgb(gray)),

  [Mutual Funds], [90,70,090.8], [100], [45,00,000], [0], [0], [45,70,090.8], [6], [NIFTY],
  [Commodities], [90,70,090.8], [100], [45,00,000], [0], [0], [45,70,090.8], [6], [-],
  [Mutual Funds], [90,70,090.8], [100], [45,00,000], [0], [0], [45,70,090.8], [6], [NIFTY],

  [Hybrid], [29,07,77,091.6], [100], [26,60,93,034.4], [0], [0], [2,46,94,057.2], [2.3], [-],
  [Mutual Funds], [29,07,77,091.6], [100], [26,60,93,034.4], [0], [0], [2,46,94,057.2], [2.3], [NIFTY],
)




#pagebreak()





#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Product Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")

      //        #hide[
      //           #heading(outlined: true)[#text([Product Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"),size: 25pt)]
      // ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,

      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
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

#place(dx: 0pt, dy: -60pt)[
  #text("Product Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")

  //        #hide[

  //           #heading(outlined: true)[#text([Product Wise Exposure - Adv
  //           isors / Distributors],fill:rgb("#0d3c6a"),size: 25pt)]
  // ]
]
#text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular", font: "Bai Jamjuree")
#place(
  top + right,
  dx: -35pt,
  dy: -40pt,
  [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
)
#place(
  dy: -20pt,
  [#line(length: 100%)],
)




#let heading0 = rgb("#0d3c6a")
//#let headerBg = rgb("#f4f5f6")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")
#set table(
  stroke: none,
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else if y == 3 or y == 8 or y == 11 or y == 13 {
    highlightBlue
  } else {
    whiteBg
  },
  align: (x, y) => if y == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)
#let productwise = (
  (
    Asset: "AIF",
    PurchaseValue: "",
    MarketValue: "",
    Unrealised: "",
    DividendInterest: "",
    Realised: "",
    IRR: "",
    Exposure: "",
  ),
  (
    Asset: "Equity",
    PurchaseValue: "4,04,40,000",
    MarketValue: "5,89,75,000",
    Unrealised: "1,85,35,000",
    DividendInterest: "0",
    Realised: "0",
    IRR: "14.8",
    Exposure: "100",
  ),
  (
    Asset: "Total",
    PurchaseValue: "4,04,40,000",
    MarketValue: "5,89,75,000",
    Unrealised: "1,85,35,000",
    DividendInterest: "-",
    Realised: "-",
    IRR: "14.8",
    Exposure: "100",
  ),
)
#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 8,
      align: left + horizon,
      [#text(fill: heading0, size: 35pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),
    // Column headers
    table.cell([#text(fill: heading0, weight: "black", [Asset Class], size: 20pt)]),
    table.cell([#text(fill: heading0, weight: "black", [Purchase Value], size: 20pt)]),
    table.cell([#text(fill: heading0, weight: "black", [Market Value], size: 20pt)]),
    table.cell([#text(
        fill: heading0,
        weight: "black",
        [Unrealised
          \
          Gain/Loss],
        size: 20pt,
      )]),
    table.cell([#text(fill: heading0, weight: "black", [Dividend Interest ], size: 20pt)]),
    table.cell([#text(
        fill: heading0,
        weight: "black",
        [Realised
          \
          Gain/Loss],
        size: 20pt,
      )]),
    table.cell([#text(fill: heading0, weight: "black", [IRR %], size: 20pt)]),
    table.cell([#text(fill: heading0, weight: "black", [Exposure %], size: 20pt)]),
  ),
  ..productwise
    .map(row => {
      (
        text(size: 16pt, row.Asset),
        text(size: 16pt, row.PurchaseValue),
        text(size: 16pt, row.MarketValue),
        text(size: 16pt, row.Unrealised),
        text(size: 16pt, row.DividendInterest),
        text(size: 16pt, row.Realised),
        text(size: 16pt, row.IRR),
        text(size: 16pt, row.Exposure),
        table.hline(),
      )
    })
    .flatten()
  // Sample data
)
#pagebreak()

#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text(
        "Sub Asset Class Wise Exposure - Advisors / Distributors",
        size: 35pt,
        fill: rgb("#0d3c6a"),
        weight: "extrabold",
      )
      //        #hide[
      //   #heading(outlined: true)[#text([Sub Asset Class Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"),size: 25pt)]
      // ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,

      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },
  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)


#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")
// #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#let subasset = (
  (Asset: "AIF", PurchaseValue: "", MarketValue: "", Unrealised: "", Income: "-", Realised: "", IRR: "", Exposure: ""),
  (
    Asset: "Equity",
    PurchaseValue: "4,04,40,000",
    MarketValue: "5,89,75,000",
    Unrealised: "1,85,35,000",
    Income: "-",
    Realised: "0",
    IRR: "14.8",
    Exposure: "100",
  ),
  (
    Asset: "Total",
    PurchaseValue: "4,04,40,000",
    MarketValue: "5,89,75,000",
    Unrealised: "1,85,35,000",
    Income: "-",
    Realised: "-",
    IRR: "14.8",
    Exposure: "100",
  ),
)
#set table(
  stroke: none,
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else if y == 3 or y == 8 or y == 11 or y == 13 {
    highlightBlue
  } else {
    whiteBg
  },
  align: (x, y) => if y == 0 or x == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 8,
      align: left + horizon,
      [#text(fill: heading1, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Asset Class])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Purchase Value])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Market Value])]),
    table.cell([#text(
        fill: heading1,
        Fontsize,
        weight: "black",
        [
          Unrealised
          \
          Gain/Loss],
      )]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Income])]),
    table.cell([#text(
        fill: heading1,
        Fontsize,
        weight: "black",
        [Realised
          \
          Gain/Loss
        ],
      )]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [IRR%])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Exposure %])]),
  ),

  ..subasset
    .map(row => {
      (
        text(size: 16pt, row.Asset),
        text(size: 16pt, row.PurchaseValue),
        text(size: 16pt, row.MarketValue),
        text(size: 16pt, row.Unrealised),
        text(size: 16pt, row.Income),
        text(size: 16pt, row.Realised),
        text(size: 16pt, row.IRR),
        text(size: 16pt, row.Exposure),
        table.hline(stroke: .4pt + gray),
      )
    })
    .flatten()
)

#pagebreak()

#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Mutual Funds - Investment Summary", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      #hide[
        #heading(outlined: true)[#text([Detailed Holding Statement], fill: rgb("#0d3c6a"), size: 25pt)]
      ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)
#set text(font: "Bai Jamjuree")
#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)

#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")
// #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#let subasset3 = (
  (
    Name: "Commodities: Gold",
    folio: "",
    units: "",
    Purchase_value: "",
    Inception: "",
    unrealized: "",
    Market_value: "",
    Market_Price: "",
    absolute: "",
    XIRR: "",
    lifedays: "",
  ),
  (
    Name: " Nippon India Gold Savings-G",
    folio: " xxxxxxxxxx",
    units: "3,15,292.8",
    Purchase_value: "45,00,000",
    Inception: "-",
    unrealized: " 45,70,090.8",
    Market_value: " 90,70,090.8",
    Market_Price: "3,21,52,906",
    absolute: "101.6",
    XIRR: "6",
    lifedays: "0",
  ),
  (
    Name: "Total",
    folio: "-",
    units: "3,15,292.8",
    Purchase_value: "45,00,000",
    Inception: "-",
    unrealized: " 45,70,090.8",
    Market_value: " 90,70,090.8",
    Market_Price: "3,21,52,906",
    absolute: "-",
    XIRR: "-",
    lifedays: "-",
  ),
)
#set table(
  stroke: none,
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else if y == 3 or y == 8 or y == 11 or y == 13 {
    highlightBlue
  } else {
    whiteBg
  },
  align: (x, y) => if y == 0 or x == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)

#table(
  columns: (3fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 11,
      align: left + horizon,
      [#text(fill: heading1, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Name])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Folio Number])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Units])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Purchase Value])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Inception Date])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Unrealized Gain/Loss])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Market Value])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Market Price])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Absolute Return])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [XIRR %])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Life Days])]),
  ),

  ..subasset3
    .map(row => {
      (
        text(size: 16pt, row.Name),
        text(size: 16pt, row.folio),
        text(size: 16pt, row.units),
        text(size: 16pt, row.Purchase_value),
        text(size: 16pt, row.Inception),
        text(size: 16pt, row.unrealized),
        text(size: 16pt, row.Market_value),
        text(size: 16pt, row.Market_Price),
        text(size: 16pt, row.absolute),
        text(size: 16pt, row.XIRR),
        text(size: 16pt, row.lifedays),
        table.hline(stroke: .4pt + gray),
      )
    })
    .flatten()
)

#pagebreak()

#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("PMS - Investment Summary", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")

      // #hide[
      //   #heading(outlined: true)[#text([PMS - Investment Summary],fill:rgb("#0d3c6a"),size: 25pt)]
      // ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set text(font: "Bai Jamjuree")
#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)
// #v(-60pt)


#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")



#let subasset1 = (
  (
    Provider_name: " Marcellus Consistent Compounders Portfolio",
    Folio: " Inflow",
    Inflow: " 3,34,63,369",
    Outflow: "0",
    Market_value: "5,85,60,895.8",
    Market_value_date: "22 Jul 2024",
    XIRR: "15",
    Assest_Exposure: "100",
  ),
  (
    Provider_name: "Total",
    Folio: "-",
    Inflow: " 3,34,63,369",
    Outflow: "-",
    Market_value: "5,85,60,895.8",
    Market_value_date: "-",
    XIRR: "-",
    Assest_Exposure: "100",
  ),
)
#set table(
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else {
    whiteBg
  },

  align: (x, y) => if y == 0 or x == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)
#table(
  columns: (2.5fr, 1.3fr, 1fr, 1fr, 1.2fr, 1.6fr, 1fr, 1.5fr),
  stroke: none,
  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 8,
      align: left + horizon,
      [#text(fill: heading1, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Provider name])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Folio Number])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Inflow])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Outflow])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Market Value])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Market Value date])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [XIRR %])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Asset Exposure %])]),

    ..subasset1
      .map(row => {
        (
          text(size: 16pt, row.Provider_name),
          text(size: 16pt, row.Folio),
          text(size: 16pt, row.Inflow),
          text(size: 16pt, row.Outflow),
          text(size: 16pt, row.Market_value),
          text(size: 16pt, row.Market_value_date),
          text(size: 16pt, row.XIRR),
          text(size: 16pt, row.Assest_Exposure),
          table.hline(stroke: .4pt + gray),
        )
      })
      .flatten(),
  ),
)

#pagebreak()


#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Direct Equity Holding - Advisor Wise", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      //        #hide[
      //   #heading(outlined: true)[#text([Sub Asset Class Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"),size: 25pt)]
      // ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)
#set text(font: "Bai Jamjuree")
#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)


#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")
// #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#let subasset3 = (
  (
    Name: "L&T Finance Ltd",
    Code: "undefined",
    shares: "1,85,074",
    Purchase_Price: "172.9",
    Purchase_Value: "3,20,00,238.6",
    Dividend: "0",
    Market_price: "173.7",
    Market_value: "3,21,52,906",
    Unrealized_Gain: "1,52,667.4",
    Gain_loss: "0",
    asset_exposure: "32",
  ),
)
#set table(
  stroke: none,
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else if y == 3 or y == 8 or y == 11 or y == 13 {
    highlightBlue
  } else {
    whiteBg
  },
  align: (x, y) => if y == 0 or x == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 11,
      align: left + horizon,
      [#text(fill: heading1, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Name])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Code])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ No. of shares])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Purchase Price])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Purchase Value])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Dividend])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Market Price])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Market Value])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Unrealized Gain/Loss])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Gain/Loss])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Asset Exposure %])]),
  ),

  ..subasset3
    .map(row => {
      (
        text(size: 16pt, row.Name),
        text(size: 16pt, row.Code),
        text(size: 16pt, row.shares),
        text(size: 16pt, row.Purchase_Price),
        text(size: 16pt, row.Purchase_Value),
        text(size: 16pt, row.Dividend),
        text(size: 16pt, row.Market_price),
        text(size: 16pt, row.Market_value),
        text(size: 16pt, row.Unrealized_Gain),
        text(size: 16pt, row.Gain_loss),
        text(size: 16pt, row.asset_exposure),
        table.hline(stroke: .4pt + gray),
      )
    })
    .flatten()
)

#pagebreak()
#let customHeader = box()
#let customFooter = box()

#set text(size: 12pt, font: "Bai Jamjuree")
#set page(
  paper: "a2",
  flipped: true,
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
  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)
#place(dx: 1100pt, dy: 50pt)[
  #image("assets/bg design2.jpg", width: 100%, height: 100%)
]
#place(top + right, dx: -35pt, dy: -40pt, [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)]),
#place(bottom + left, dx: -40pt, dy: 70pt)[
  #image("assets/design.png", width: 480pt)
]


#place(bottom + right, dx: 20pt, dy: 70pt)[
  #image("assets/bgdesign.jpg", width: 1210pt, height: 370pt)
]
#place(
  dx: 50pt,
  dy: 250pt,
)[
  #box(width: auto, height: auto)[

    #text(fill: rgb("#0B1A24"), weight: "extrabold", font: "Bai Jamjuree", size: 80pt, [MUTUAL FUND])\
    \
    \
    \
    #text(fill: rgb("#1d8fff"), weight: "extrabold", font: "Bai Jamjuree", size: 80pt, [PORTFOLIO EXPOSURE])\
    \
    \
    #text(fill: rgb("#1d8fff"), weight: "extrabold", font: "Bai Jamjuree", size: 80pt, [ANALYSIS])\
  ]
]

#pagebreak()

#let customFooter = box(
  width: 100%,
  height: 30pt,
  inset: 10pt,
  align(center + bottom)[
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
  ],
)
#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("AMC Wise Exposure - All Advisors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      //        #hide[
      //   #heading(outlined: true)[#text([Sub Asset Class Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"),size: 25pt)]
      // ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)


#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")
// #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#let subasset3 = (
  (
    Name: "L&T Finance Ltd",
    Code: "undefined",
    shares: "1,85,074",
    Purchase_Price: "172.9",
    Purchase_Value: "3,20,00,238.6",
    Dividend: "0",
    Market_price: "173.7",
    Market_value: "3,21,52,906",
    Unrealized_Gain: "1,52,667.4",
    Gain_loss: "0",
    asset_exposure: "32",
  ),
)
#set table(
  stroke: none,
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else if y == 3 or y == 8 or y == 11 or y == 13 {
    highlightBlue
  } else {
    whiteBg
  },
  align: (x, y) => if y == 0 or x == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)

#table(
  columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 6,
      align: left + horizon,
      [#text(fill: heading1, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Name])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Purchase Value])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Marker Value])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Unrealised Gain/Lose])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [XIRR])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Asset Exposure %])]),
  ),

  ..subasset3
    .map(row => {
      (
        text(size: 16pt, row.Name),
        text(size: 16pt, row.Code),
        text(size: 16pt, row.shares),
        text(size: 16pt, row.Purchase_Price),
        text(size: 16pt, row.Purchase_Value),
        text(size: 16pt, row.Dividend),
        text(size: 16pt, row.Market_price),
        text(size: 16pt, row.Market_value),
        text(size: 16pt, row.Unrealized_Gain),
        text(size: 16pt, row.Gain_loss),
        text(size: 16pt, row.asset_exposure),
        table.hline(stroke: .4pt + gray),
      )
    })
    .flatten()
)

#pagebreak()


#let customFooter = box(
  width: 100%,
  height: 30pt,
  inset: 10pt,
  align(center + bottom)[
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
  ],
)
#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Fund Manager Wise Exposure - All Advisor", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      //        #hide[
      //   #heading(outlined: true)[#text([Sub Asset Class Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"),size: 25pt)]
      // ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)


#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")
// #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#let subasset3 = (
  (fundmanager: "-", amc: " PPFAS Mutual Fund", marketvalue: " 89,90,59,830.1", exposure: "63.6"),
  (fundmanager: "Total", amc: "-", marketvalue: "89,90,59,830.1", exposure: "63.6"),
)
#set table(
  stroke: luma(10pt),
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else {
    whiteBg
  },
  align: (x, y) => if y == 0 or x == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)

#table(
  columns: (2fr, 1fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 4,
      align: left + horizon,
      [#text(fill: heading1, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Fund Manager])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [AMC])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Marker Value])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Exposure %])]),
  ),

  ..subasset3
    .map(row => {
      (
        text(size: 16pt, row.fundmanager),
        text(size: 16pt, row.amc),
        text(size: 16pt, row.marketvalue),
        text(size: 16pt, row.exposure),
      )
    })
    .flatten()
)


#pagebreak()

#let customFooter = box(
  width: 100%,
  height: 30pt,
  inset: 10pt,
  align(center + bottom)[
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
  ],
)
#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Equity Mutual Fund - Quants", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      //        #hide[
      //   #heading(outlined: true)[#text([Sub Asset Class Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"),size: 25pt)]
      // ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,

      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)
#set text(font: "Bai Jamjuree")
#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)

#let primaryColors = (
  "#5470c6", // Equities
  "#91cc75", // Alternatives
  "#fac858", // Fixed Income
  "#ee6666", // Commodities
  "#73c0de", // Liq & Eqv.
)

#let currentData1 = (
  (value: 40, name: "Large Cap"),
  (value: 2, name: "Others"),
)
//top left

#place(
  top + left,
  dx: 0pt,
  dy: 20pt,
)[
  #box(
    width: 49%,
    height: 48%,
    stroke: rgb("#cecece"),
    radius: 20pt,
    inset: 10pt,
  )[
    // Title
    #place(dx: 0pt, dy: 5pt)[
      #text("Industry Allocation(%)", font: "Bai Jamjuree", size: 18pt, fill: rgb("0e496e"), weight: "bold")

      #v(10pt)

      #let amcbar(width, label: "50%", color: gray, height: 20pt) = {
        if width >= 50% {
          rect(
            width: width,
            height: height,
            radius: (right: 5pt),

            fill: color,
            align(center + horizon, text(white, label)),
          )
        } else if width < 0% {
          align(left, text(label))
        } else {
          stack(
            dir: ltr,
            spacing: 5pt,
            rect(width: (width), fill: color, height: 25pt, radius: (right: 5pt)),

            align(left + horizon, text(label)),
          )
        }
      }
      //graph:amcbar(-21%,label:("-21%"), color:(rgb("#2baffe")))
      #let topdata = (
        (words: "Financial", word1: amcbar(31.1%, label: "31.1", color: (rgb("#2baffe")))),
        (words: "Energy", word1: amcbar(11.4%, label: "11.4", color: (rgb("#2baffe")))),
        (words: "Technology", word1: amcbar(9.1%, label: "9.1", color: (rgb("#2baffe")))),
        (words: " Automobile", word1: amcbar(8.6%, label: "8.6", color: (rgb("#2baffe")))),
        (words: " Services", word1: amcbar(7.9%, label: "7.9", color: (rgb("#2baffe")))),
        (words: " Healthcare", word1: amcbar(6.6%, label: "6.6", color: (rgb("#2baffe")))),
        (words: " Consumer Staples", word1: amcbar(6.2%, label: "6.2", color: (rgb("#2baffe")))),
        (words: " Communication", word1: amcbar(4.4%, label: "4.4", color: (rgb("#2baffe")))),
        (words: "  Materials", word1: amcbar(4.1%, label: "4.1", color: (rgb("#2baffe")))),
        (words: "  Metals & Mining", word1: amcbar(3.4%, label: "3.4", color: (rgb("#2baffe")))),
      )

      #set table(
        align: (x, y) => {
          if x == 0 {
            (right + horizon)
          } else {
            (left)
          }
        },
      )
      #table(
        columns: (1fr, 4fr),
        stroke: none,
        inset: 5pt,
        fill: none,
        ..topdata
          .map(row => {
            (
              text(size: 14pt, row.words),
              text(size: 14pt, row.word1),
            )
          })
          .flatten()
      )

    ]
  ]
]
//bottom left

#place(
  bottom + left,
  dx: 0pt,
  dy: 20pt,
)[

  #box(
    width: 49%,
    height: 48%,
    stroke: rgb("#cecece"),
    radius: 20pt,
    inset: 20pt,
  )[
    // Title
    #place(dx: 0pt, dy: 5pt)[
      #text("AMC Allocation(%)", font: "Bai Jamjuree", size: 18pt, fill: rgb("0e496e"), weight: "bold")

      #v(10pt)

      #let amcbar(width, label: "100%", color: gray, height: 20pt) = {
        if width == 100% {
          rect(
            width: width,
            height: height,
            radius: (right: 5pt),
            fill: color,
            align(center + horizon, text(white, label)),
          )
        } else if width < 0% {
          align(left, text(label))
        } else {
          stack(
            dir: ltr,
            spacing: 5pt,
            rect(width: (width), fill: color, height: 25pt, radius: (right: 10pt)),

            align(left + horizon, text(label)),
          )
        }
      }
      #let topdata1 = (
        (words: "ICICI Prudential Mutual Fund", word1: amcbar(31.1%, label: "31.1", color: (rgb("#2baffe")))),
        (words: "PPFAS Mutual Fund", word1: amcbar(11.4%, label: "11.4", color: (rgb("#2baffe")))),
        (words: "Edelweiss Mutual Fund", word1: amcbar(9.1%, label: "9.1", color: (rgb("#2baffe")))),
        (words: " Axis Mutual Fund", word1: amcbar(8.6%, label: "8.6", color: (rgb("#2baffe")))),
        (words: " Aditya Birla Sun Life Mutual Fund", word1: amcbar(7.9%, label: "7.9", color: (rgb("#2baffe")))),
        (words: " Kotak Mahindra Mutual Fund", word1: amcbar(6.6%, label: "6.6", color: (rgb("#2baffe")))),
        (words: " SBI Mutual Fund", word1: amcbar(6.2%, label: "6.2", color: (rgb("#2baffe")))),
      )





      #set table(
        align: (x, y) => {
          if x == 0 {
            (right + horizon)
          } else {
            (left)
          }
        },
        // inset: (x,y) =>{
        //   if x==0{
        //     (10pt)
        //   }else{
        //     (25pt)
        //   }
        // }
      )
      #table(
        columns: (1fr, 3fr),
        stroke: none,
        inset: 6pt,
        fill: none,
        ..topdata1
          .map(row => {
            (
              text(size: 14pt, row.words),
              text(size: 14pt, row.word1),
            )
          })
          .flatten()
      )

    ]
  ]
]

//top right

#place(top + right, dx: 0pt, dy: 20pt)[

  #place(
    dx: 20pt,
    dy: 30pt,
  )[#text(" Market Capitalization Allocation(%)", size: 30pt, fill: rgb("0e496e"), weight: "extrabold")]


  #box(width: 49%, height: 48%, stroke: rgb("#cecece"), radius: 20pt)[


    #pad(
      left: 250pt,
      top: -650pt,


      grid(
        columns: (1fr, 1fr),
        align: (center),
        // Current allocation chart
        box(width: 130%, height: 150%, stroke: none)[
          #echarm.render(
            width: 100%,
            height: 100%,
            options: (
              series: (
                name: "Current Allocation",
                type: "pie",
                radius: ("60%", "70%"),
                avoidLabelOverlap: false,
                color: primaryColors,
                itemStyle: (borderColor: "#fff", borderWidth: 0),
                labelLine: (
                  //  show: true,
                ),
                data: currentData1,
              ),
            ),
          ),
        ]
      ),
    )


    #place(dx: 0pt, dy: -150pt)[
      #grid(
        columns: (1fr, 1fr),
        column-gutter: (0% + -400pt,),
        gutter: -5.1em, // Slightly reduced gutter
        inset: 20pt, // Reduced inset for less side padding
        align: center,
        stack(
          dir: ltr,
          spacing: -12pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(0))),
          text("97.2%
      Large Cap", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: -1pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(1))),
          text("2.8%
    Others", size: 16pt),
        ),
      )
    ]


  ]
],


//bottom right

#place(
  bottom + right,
  dx: 0pt,
  dy: 20pt,
)[
  #let bottomdata = (
    (Metric: "P/E", Values: [0.0]),
    (Metric: "P/B", Values: [0.0]),
    (Metric: "Weighted Avg. Market Cap(Cr)", Values: [0.0]),
    (Metric: "Portfolio Beta", Values: [0.0]),
    (Metric: "Sharpe Ratio", Values: [0.0]),
    (Metric: "Standard Deviation", Values: [0.0]),
  )

  // Create a bordered box containing the table
  #box(
    width: 49%,
    height: 48%,
    stroke: rgb("#cecece"),
    radius: 20pt,
    inset: 20pt,
  )[
    // Title
    #place(dx: 0pt, dy: 40pt)[
      #text("Equity Quants", font: "Bai Jamjuree", size: 18pt, fill: rgb("0e496e"), weight: "bold")

      #v(10pt)

      // Table
      #set table(
        fill: (x, y) => if y == 0 {
          rgb("#f1f1f1")
        },
      )

      #table(
        columns: (2fr, 1fr),
        stroke: (x, y) => {
          if y == 0 {
            (bottom: 1pt + gray)
          } else {
            (bottom: 0.5pt + gray.lighten(50%))
          }
        },
        inset: 10pt,
        align: (left, right),

        // Header row
        table.cell(fill: rgb("#f1f1f1"))[*Metric*],
        table.cell(fill: rgb("#f1f1f1"), align: right)[*Value(yr)*],

        // Data rows
        ..bottomdata
          .map(row => {
            (
              text(size: 14pt, row.Metric),
              text(size: 14pt, row.Values),
            )
          })
          .flatten()
      )
    ]
  ]
]



#pagebreak()

#let customFooter = box(
  width: 100%,
  height: 30pt,
  inset: 10pt,
  align(center + bottom)[
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
  ],
)
#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Debt Mutual Fund - Quants", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      //        #hide[
      //   #heading(outlined: true)[#text([Sub Asset Class Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"),size: 25pt)]
      // ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)

#let primaryColors = (
  "#73c0de", // sky b
  "#91cc75", // gree
  "#5470c6", // blue
  "#fac858", // ora
  "#ee6666", // red
)

#let currentData1 = (
  (value: 28.0, name: " SOV"),
  (value: 19.5, name: "CA"),
  (value: 12.1, name: "C-A"),
  (value: 11.8, name: "C-A "),
  (value: 28.6, name: "Others"),
)



//top left

#place(
  top + left,
  dx: 0pt,
  dy: 20pt,
)[

  #place(
    dx: 20pt,
    dy: 30pt,
  )[#text(" Rating Allocation(%)", size: 30pt, fill: rgb("0e496e"), weight: "extrabold")]


  #box(width: 32%, height: 48%, stroke: rgb("#cecece"), radius: 20pt)[


    #pad(
      left: 150pt,
      top: -650pt,


      grid(
        columns: (1fr, 1fr),
        align: (center),
        // Current allocation chart
        box(
          width: 130%,
          height: 150%,
          stroke: none,
        )[
          #echarm.render(
            width: 100%,
            height: 100%,
            options: (
              series: (
                name: "Current Allocation",
                type: "pie",
                radius: ("60%", "70%"),
                avoidLabelOverlap: false,
                color: primaryColors,
                itemStyle: (borderColor: "#fff", borderWidth: 0),
                labelLine: (
                  //  show: true,
                ),
                data: currentData1,
              ),
            ),
          ),
        ]
      ),
    )

    #place(
      dx: 0pt,
      dy: -180pt,
    )[
      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: (0% + -200pt,),
        gutter: 10pt, // Slightly reduced gutter
        inset: 2pt, // Reduced inset for less side padding
        align: center,
        stack(
          dir: ltr,
          spacing: 3pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(0))),
          text("28.0%
SOV", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(1))),
          text("19.5%
CA", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
          text("12.1%
C-A", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(3))),
          text("11.8%
C-A", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(4))),
          text("28.6%
Others", size: 16pt),
        ),
      )
    ]


  ]
]


#let currentData1 = (
  (value: 45.6, name: "GOI"),
  (value: 6.5, name: "RBOI"),
  (value: 4.1, name: "NBFA&RD"),
  (value: 3.5, name: "SIDBOIL"),
  (value: 40.3, name: " Others"),
)



//  //top mid

#place(
  top + left,
  dx: 550pt,
  dy: 20pt,
)[

  #place(
    dx: 20pt,
    dy: 30pt,
  )[#text(" Instrument Allocation(%)", size: 30pt, fill: rgb("0e496e"), weight: "extrabold")]


  #box(width: 32%, height: 48%, stroke: rgb("#cecece"), radius: 20pt)[


    #pad(
      left: 150pt,
      top: -650pt,


      grid(
        columns: (1fr, 1fr),
        align: (center),
        // Current allocation chart
        box(
          width: 130%,
          height: 150%,
          stroke: none,
        )[
          #echarm.render(
            width: 100%,
            height: 100%,
            options: (
              series: (
                name: "Current Allocation",
                type: "pie",
                radius: ("60%", "70%"),
                avoidLabelOverlap: false,
                color: primaryColors,
                itemStyle: (borderColor: "#fff", borderWidth: 0),
                labelLine: (
                  //  show: true,
                ),
                data: currentData1,
              ),
            ),
          ),
        ]
      ),
    )


    #place(
      dx: 0pt,
      dy: -180pt,
    )[
      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: (0% + -200pt,),
        gutter: 10pt, // Slightly reduced gutter
        inset: 2pt, // Reduced inset for less side padding
        align: center,
        stack(
          dir: ltr,
          spacing: 3pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(0))),
          text(" 45.6
GOI", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(1))),
          text("6.5
RBOI", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
          text("4.1
NBFA&RD", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(3))),
          text("3.5
SIDBOIL", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(4))),
          text("40.3
Others", size: 16pt),
        ),
      )
    ]


  ]
]

//top right

#place(
  top + right,
  dx: 0pt,
  dy: 20pt,
)[
  #box(
    width: 32%,
    height: 48%,
    stroke: rgb("#cecece"),
    radius: 20pt,
    inset: 20pt,
  )[
    // Title
    #place(dx: 0pt, dy: 5pt)[
      #text("Industry Allocation(%)", font: "Bai Jamjuree", size: 18pt, fill: rgb("0e496e"), weight: "bold")

      #v(10pt)

      #let amcbar(width, label: "50%", color: gray, height: 20pt) = {
        if width >= 50% {
          rect(
            width: width,
            height: height,
            radius: (right: 5pt),

            fill: color,
            align(center + horizon, text(white, label)),
          )
        } else if width < 0% {
          align(left, text(label))
        } else {
          stack(
            dir: ltr,
            spacing: 5pt,
            rect(width: (width), fill: color, height: 25pt, radius: (right: 5pt)),

            align(left + horizon, text(label)),
          )
        }
      }
      //graph:amcbar(-21%,label:("-21%"), color:(rgb("#2baffe")))
      #let topdata = (
        (words: "Financial", word1: amcbar(31.1%, label: "31.1", color: (rgb("#2baffe")))),
        (words: "Energy", word1: amcbar(11.4%, label: "11.4", color: (rgb("#2baffe")))),
        (words: "Technology", word1: amcbar(9.1%, label: "9.1", color: (rgb("#2baffe")))),
        (words: " Automobile", word1: amcbar(8.6%, label: "8.6", color: (rgb("#2baffe")))),
        (words: " Services", word1: amcbar(7.9%, label: "7.9", color: (rgb("#2baffe")))),
        (words: " Healthcare", word1: amcbar(6.6%, label: "6.6", color: (rgb("#2baffe")))),
        (words: " Consumer Staples", word1: amcbar(6.2%, label: "6.2", color: (rgb("#2baffe")))),
        (words: " Communication", word1: amcbar(4.4%, label: "4.4", color: (rgb("#2baffe")))),
        (words: "  Materials", word1: amcbar(4.1%, label: "4.1", color: (rgb("#2baffe")))),
        (words: "  Metals & Mining", word1: amcbar(3.4%, label: "3.4", color: (rgb("#2baffe")))),
      )

      #set table(
        align: (x, y) => {
          if x == 0 {
            (right + horizon)
          } else {
            (left)
          }
        },
      )
      #table(
        columns: (1fr, 4fr),
        stroke: none,
        inset: 5pt,
        fill: none,

        ..topdata
          .map(row => {
            (
              text(size: 14pt, row.words),
              text(size: 14pt, row.word1),
            )
          })
          .flatten()
      )

    ]
  ]
]

#let currentData2 = (
  (value: 100, name: "Upto 12 Months"),
)

#place(
  bottom + left,
  dx: 0pt,
  dy: 20pt,
)[

  #place(
    dx: 20pt,
    dy: 30pt,
  )[#text("Avg Maturity Allocation(%)", size: 30pt, fill: rgb("0e496e"), weight: "extrabold")]


  #box(width: 32%, height: 48%, stroke: rgb("#cecece"), radius: 20pt)[


    #pad(
      left: 150pt,
      top: 100pt,


      grid(
        columns: (1fr, 1fr),
        align: (center),
        // Current allocation chart
        box(
          width: 130%,
          height: 150%,
          stroke: none,
        )[
          #echarm.render(
            width: 100%,
            height: 100%,
            options: (
              series: (
                name: "Current Allocation",
                type: "pie",
                radius: ("60%", "70%"),
                avoidLabelOverlap: false,
                color: primaryColors,
                itemStyle: (borderColor: "#fff", borderWidth: 0),
                labelLine: (
                  //  show: true,
                ),
                data: currentData2,
              ),
            ),
          ),
        ]
      ),
    )
    #place(
      dx: 80pt,
      dy: -180pt,
    )[
      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: (0% + -200pt,),
        gutter: -10pt, // Slightly reduced gutter
        inset: 2pt, // Reduced inset for less side padding
        align: center,
        stack(
          dir: ltr,
          spacing: 10pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(0))),
          text("100%
Upto 12 Month
", size: 16pt),
        ),
      )
    ]
  ]
]
//top left
#place(
  top + left,
  dx: 0pt,
  dy: 20pt,
)[



  #box(width: 32%, height: 48%, stroke: rgb("#cecece"), radius: 20pt)[


    #pad(
      left: 150pt,
      top: -650pt,


      grid(
        columns: (1fr, 1fr),
        align: (center),
        // Current allocation chart
        box(
          width: 130%,
          height: 150%,
          stroke: none,
        )[
          #echarm.render(
            width: 100%,
            height: 100%,
            options: (
              series: (
                name: "Current Allocation",
                type: "pie",
                radius: ("60%", "70%"),
                avoidLabelOverlap: false,
                color: primaryColors,
                itemStyle: (borderColor: "#fff", borderWidth: 0),
                labelLine: (
                  //  show: true,
                ),
                data: currentData1,
              ),
            ),
          ),
        ]
      ),
    )


    #place(
      dx: 0pt,
      dy: -180pt,
    )[
      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: (0% + -200pt,),
        gutter: 10pt, // Slightly reduced gutter
        inset: 2pt, // Reduced inset for less side padding
        align: center,
        stack(
          dir: ltr,
          spacing: 3pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(0))),
          text("28.0%
SOV", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(1))),
          text("19.5%
CA", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
          text("12.1%
C-A", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(3))),
          text("11.8%
C-A", size: 16pt),
        ),
        stack(
          dir: ltr,
          spacing: 0pt,
          rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(4))),
          text("28.6%
Others", size: 16pt),
        ),
      )
    ]


  ]
]




//  //bottom mid

#place(
  bottom + left,
  dx: 550pt,
  dy: 20pt,
)[
  #let bottomdata = (
    (Metric: " AverageMaturity", Values: [4.9]),
    (Metric: "Duration", Values: [3.2]),
    (Metric: "YTM", Values: [0.6]),
  )

  // Create a bordered box containing the table
  #box(
    width: 32%,
    height: 48%,
    stroke: rgb("#cecece"),
    radius: 20pt,
    inset: 20pt,
  )[
    #place(
      dx: 20pt,
      dy: 30pt,
    )[#text("Debt Quants", size: 30pt, fill: rgb("0e496e"), font: "Bai Jamjuree", weight: "extrabold")]



    //table
    #set table(
      fill: (x, y) => if y == 0 {
        rgb("#f1f1f1")
      },
    )
    #table(
      columns: (2fr, 1fr),
      stroke: (x, y) => {
        if y == 0 {
          (bottom: 1pt + gray)
        } else {
          (bottom: 0.5pt + gray.lighten(50%))
        }
      },
      inset: 40pt,
      align: (left, right),
      // Header row
      table.cell(fill: rgb("#f1f1f1"))[*Metric*],
      table.cell(fill: rgb("#f1f1f1"), align: right)[*Value(yr)*],
      // Data rows
      ..bottomdata
        .map(row => {
          (
            text(size: 14pt, row.Metric),
            text(size: 14pt, row.Values),
          )
        })
        .flatten()
    )
  ]
]


//bottom right

#place(
  bottom + right,
  dx: 0pt,
  dy: 20pt,
)[

  #box(
    width: 33%,
    height: 48%,
    stroke: rgb("#cecece"),
    radius: 20pt,
    inset: 20pt,
  )[
    // Title
    #place(dx: 0pt, dy: 5pt)[
      #text("AMC Allocation(%)", font: "Bai Jamjuree", size: 18pt, fill: rgb("0e496e"), weight: "bold")

      #v(10pt)

      #let amcbar(width, label: "100%", color: gray, height: 20pt) = {
        if width == 100% {
          rect(
            width: width,
            height: height,
            radius: (right: 5pt),
            fill: color,
            align(center + horizon, text(white, label)),
          )
        } else if width < 0% {
          align(left, text(label))
        } else {
          stack(
            dir: ltr,
            spacing: 5pt,
            rect(width: (width), fill: color, height: 25pt, radius: (right: 5pt)),

            align(left + horizon, text(label)),
          )
        }
      }
      #let topdata1 = (
        (words: "ICICI Prudential Mutual Fund", word1: amcbar(31.1%, label: "31.1", color: (rgb("#2baffe")))),
        (words: "PPFAS Mutual Fund", word1: amcbar(11.4%, label: "11.4", color: (rgb("#2baffe")))),
        (words: "Edelweiss Mutual Fund", word1: amcbar(9.1%, label: "9.1", color: (rgb("#2baffe")))),
        (words: " Axis Mutual Fund", word1: amcbar(8.6%, label: "8.6", color: (rgb("#2baffe")))),
        (words: " Aditya Birla Sun Life Mutual Fund", word1: amcbar(7.9%, label: "7.9", color: (rgb("#2baffe")))),
        (words: " Kotak Mahindra Mutual Fund", word1: amcbar(6.6%, label: "6.6", color: (rgb("#2baffe")))),
        (words: " SBI Mutual Fund", word1: amcbar(6.2%, label: "6.2", color: (rgb("#2baffe")))),
      )
      #set table(
        align: (x, y) => {
          if x == 0 {
            (right + horizon)
          } else {
            (left)
          }
        },
        // inset: (x,y) =>{
        //   if x==0{
        //     (10pt)
        //   }else{
        //     (25pt)
        //   }
        // }
      )
      #table(
        columns: (1fr, 3fr),
        stroke: none,
        inset: 10pt,
        fill: none,

        ..topdata1
          .map(row => {
            (
              text(size: 14pt, row.words),
              text(size: 14pt, row.word1),
            )
          })
          .flatten()
      )

    ]
  ]
]

#pagebreak()

#let customFooter = box(
  width: 100%,
  height: 30pt,
  inset: 10pt,
  align(center + bottom)[
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
  ],
)
#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Mutual Fund - Sector Wise Exposure", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      //        #hide[
      //   #heading(outlined: true)[#text([Sub Asset Class Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"),size: 25pt)]
      // ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)


#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")
// #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#let subasset3 = (
  (Name: "Others", amount: " 89,41,78,342.3", exposure: "63.3"),
  (Name: "Total", amount: " 89,41,78,342.3", exposure: "63.3"),
)
#set table(
  stroke: none,
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else {
    whiteBg
  },
  align: (x, y) => if y == 0 or x == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)

#table(
  columns: (2fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 3,
      align: left + horizon,
      [#text(fill: heading1, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Name])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Amount])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Exposure %])]),
  ),

  ..subasset3
    .map(row => {
      (
        text(size: 16pt, row.Name),
        text(size: 16pt, row.amount),
        text(size: 16pt, row.exposure),
        table.hline(stroke: .4pt + gray),
      )
    })
    .flatten()
)


#pagebreak()

#let customFooter = box(
  width: 100%,
  height: 30pt,
  inset: 10pt,
  align(center + bottom)[
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
  ],
)
#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Transaction History - Mutual Funds", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      #hide[
        #heading(outlined: true)[#text([ Transaction Statement Report], fill: rgb("#0d3c6a"), size: 25pt)]
      ]
    ],
    v(50pt),
    // Statement Date From : 23 Jul 2023 and 23 Jul 2024
    text("Statement Date From : 12 May 2024 and " + FormatedDate, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)


#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")
// #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#let subasset3 = (
  (
    assetcls: "Others",
    subasset: " 89,41,78,342.3",
    name: "63.3",
    folio: " 6259412/91",
    transaction: "03 Nov 2023",
    description: "MFSUB",
    units: "5,69,077.2",
    purchase: "24.6",
    amount: "1,39,99,300",
  ),
)
#set table(
  stroke: none,
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else {
    whiteBg
  },
  align: (x, y) => if y == 0 or x == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)

#table(
  columns: (1fr, 2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 9,
      align: left + horizon,
      [#text(fill: heading1, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Asset Class])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Sub Asset Class])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Name])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Folio No])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Transaction Date])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Description])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Units])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Purchase Price])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Amount])]),
  ),

  ..subasset3
    .map(row => {
      (
        text(size: 16pt, row.assetcls),
        text(size: 16pt, row.subasset),
        text(size: 16pt, row.name),
        text(size: 16pt, row.folio),
        text(size: 16pt, row.transaction),
        text(size: 16pt, row.description),
        text(size: 16pt, row.units),
        text(size: 16pt, row.purchase),
        text(size: 16pt, row.amount),
        table.hline(stroke: .4pt + gray),
      )
    })
    .flatten()
)

#pagebreak()

#let customFooter = box(
  width: 100%,
  height: 30pt,
  inset: 10pt,
  align(center + bottom)[
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
  ],
)
#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Capital Gain/Loss Report", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      #hide[
        #heading(outlined: true)[#text([ Realised Gain/Loss Statement], fill: rgb("#0d3c6a"), size: 25pt)]
      ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)


#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")
// #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#let subasset3 = (
  (assetcls: "Mutual Funds", shorttermgain: "0", longtermgain: " 8500", indexedcost: "-", longtermgl: "-"),
  (assetcls: "Total", shorttermgain: "0", longtermgain: "8500", indexedcost: "-", longtermgl: "-"),
)
#set table(
  stroke: luma(10pt),
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else {
    whiteBg
  },
  align: (x, y) => if y == 0 or x == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 5,
      align: left + horizon,
      [#text(fill: heading1, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Asset Class])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Short Term Gain (INR)])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Long Term Gain (INR)])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Indexed Cost])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Long Term Gain/Loss])]),
  ),

  ..subasset3
    .map(row => {
      (
        text(size: 16pt, row.assetcls),
        text(size: 16pt, row.shorttermgain),
        text(size: 16pt, row.longtermgain),
        text(size: 16pt, row.indexedcost),
        text(size: 16pt, row.longtermgl),
      )
    })
    .flatten()
)


#pagebreak()

#let customFooter = box(
  width: 100%,
  height: 30pt,
  inset: 10pt,
  align(center + bottom)[
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
  ],
)
#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Capital Gain/Loss Report", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      #hide[
        #heading(outlined: true)[#text([ Capital Gain/Loss Statement], fill: rgb("#0d3c6a"), size: 25pt)]
      ]
    ],
    v(50pt),
    text("as on " + FormatedDate2, size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)


#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")
// #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#let subasset3 = (
  (
    Scheme: "DSP Bond Ret-IDCWQ",
    Quantity: "",
    PurchaseDate: " ",
    PurchasePrice: "",
    PurchaseValue: "",
    SaleDate: "",
    SalePrice: "",
    SaleValue: "",
    DaysHeld: "",
    ShortTerm: "",
    LongTerm: "",
  ),
  (
    Scheme: "DSP Bond Ret-IDCWQ",
    Quantity: "10,000",
    PurchaseDate: "02 Dec 2023",
    PurchasePrice: " 10
",
    PurchaseValue: "1,00,000",
    SaleDate: " 02 Dec 2023",
    SalePrice: "10.8",
    SaleValue: "1,08,500",
    DaysHeld: "-",
    ShortTerm: "0",
    LongTerm: "8,500",
  ),
  (
    Scheme: "DSP Bond Ret-IDCWQ",
    Quantity: "10,000",
    PurchaseDate: "02 Dec 2023",
    PurchasePrice: " 10
",
    PurchaseValue: "1,00,000",
    SaleDate: " 02 Dec 2023",
    SalePrice: "10.8",
    SaleValue: "1,08,500",
    DaysHeld: "-",
    ShortTerm: "0",
    LongTerm: "8,500",
  ),
  (
    Scheme: "DSP Bond Ret-IDCWQ",
    Quantity: "10,000",
    PurchaseDate: "02 Dec 2023",
    PurchasePrice: " 10
",
    PurchaseValue: "1,00,000",
    SaleDate: " 02 Dec 2023",
    SalePrice: "10.8",
    SaleValue: "1,08,500",
    DaysHeld: "-",
    ShortTerm: "0",
    LongTerm: "8,500",
  ),
)
#set table(
  stroke: luma(10pt),
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else if y == 3 {
    highlightBlue
  },
  align: (x, y) => if y == 0 or x == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)

#table(
  columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 11,
      align: left + horizon,
      [#text(fill: heading1, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Scheme])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Quantity])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Purchase Date])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Purchase Price])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Purchase Value])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Sale Date])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Sale Price])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Sale Value])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Days Held])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Short Term])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Long Term])]),
  ),

  ..subasset3
    .map(row => {
      (
        text(size: 16pt, row.Scheme),
        text(size: 16pt, row.Quantity),
        text(size: 16pt, row.PurchaseDate),
        text(size: 16pt, row.PurchasePrice),
        text(size: 16pt, row.PurchaseValue),
        text(size: 16pt, row.SaleDate),
        text(size: 16pt, row.SalePrice),
        text(size: 16pt, row.SaleValue),
        text(size: 16pt, row.DaysHeld),
        text(size: 16pt, row.ShortTerm),
        text(size: 16pt, row.LongTerm),
      )
    })
    .flatten()
)

#pagebreak()
#let customFooter = box(
  width: 100%,
  height: 30pt,
  inset: 10pt,
  align(center + bottom)[
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
  ],
)
#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Portfolio Compliance", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      //        #hide[
      //   #heading(outlined: true)[#text([Sub Asset Class Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"),size: 25pt)]
      // ]
    ],
    v(50pt),
    // text("as on "+FormatedDate2,size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)


#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")
// #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#let subasset3 = (
  (scheme: " Asset Allocations", policy: "", currentpo: "", complaince: ""),
  (scheme: " Equity", policy: " Up to 10%", currentpo: "-", complaince: "Compliant"),
  (scheme: " Fixed Income", policy: " Up to 10%", currentpo: "-", complaince: "Compliant"),
  (
    scheme: " Credit Risk",
    policy: "  AAA - Minimum of 80%AA - Minimum of 20%
",
    currentpo: " AAA: 95.4%AA: 4.6%",
    complaince: "Compliant",
  ),
  (scheme: "Modified Duration", policy: " 3 to 5 Years
", currentpo: " 2.8", complaince: " Compliant adding Duration"),
  (
    scheme: "Maturity buckets",
    policy: " 0 - 3 years: Min 30%
 3 - 5 years: Min 40%
 5 - 7 years: Max 20%
 7 & Above years: Max 20%",
    currentpo: " 0 - 3 years: 33%
 3 - 5 years: 53%
 5 - 7 years: 3%
 7 & Above years: 11%",
    complaince: "Consider adding to the long-term maturity bucket",
  ),
  (scheme: "Equity Constraints", policy: "", currentpo: "", complaince: ""),
  (scheme: "  Large Cap equity", policy: " Up to 100%", currentpo: "-", complaince: "Compliant"),
  (scheme: " Mid cap equity", policy: " Up to 100%", currentpo: "-", complaince: "Compliant"),
  (scheme: "Mirae Asset focused plan", policy: " Up to 100%", currentpo: "-", complaince: "Compliant"),
  (scheme: " Equity", policy: " Up to 100%", currentpo: "-", complaince: "Compliant"),
  (scheme: " SBI Cards and Payment Services LTd", policy: " Up to 100%", currentpo: "-", complaince: "Compliant"),
)
#set table(
  stroke: luma(10pt),
  fill: (x, y) => if y == 0 or y == 2 {
    headerBg
  } else if y == 3 or y == 6 or y == 9 {
    highlightBlue
  },

  align: (x, y) => if y == 0 or x == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)

#table(
  columns: (1fr, 1fr, 1fr, 1fr),

  // Header
  table.header(
    table.cell(
      rowspan: 2,
      colspan: 4,
      align: left + horizon,
      [#text(fill: heading1, size: 25pt, weight: "bold", [ Portfolio Analysis Report])],
    ),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Scheme])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Investment Policy])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [Current Portfolio])]),
    table.cell([#text(fill: heading1, Fontsize, weight: "black", [ Compliance / Comments])]),
  ),

  ..subasset3
    .map(row => {
      (
        text(size: 16pt, row.scheme),
        text(size: 16pt, row.policy),
        text(size: 16pt, row.currentpo),
        text(size: 16pt, row.complaince),
      )
    })
    .flatten()
)

#pagebreak()
#let customFooter = box(
  width: 100%,
  height: 30pt,
  inset: 10pt,
  align(center + bottom)[
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
  ],
)
#let customHeader = box(
  width: 100%,
  height: 50pt,
  inset: 10pt,
  stack(
    place(dx: 0pt, dy: 15pt)[
      #text("Client Portfolio Statement", size: 35pt, fill: rgb("#0d3c6a"), weight: "extrabold")
      //        #hide[
      //   #heading(outlined: true)[#text([Sub Asset Class Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"),size: 25pt)]
      // ]
    ],
    v(50pt),
    // text("as on "+FormatedDate2,size: 25pt, fill: rgb("#6b737e"), weight: "regular"),
    place(
      top + right,
      dx: -35pt,
      dy: -40pt,
      [#image("assets/kfintech-logo.png", width: 252pt, height: 50pt)],
    ),
    place(
      dy: 25pt,
      [#line(length: 100%)],
    ),
  ),
)

#set page(
  paper: "a2",
  flipped: true,
  margin: (
    top: 100pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() >= 1 {
      align(bottom)[#customFooter]
    }
  },

  header: context {
    if counter(page).get().first() >= 1 {
      align(top)[#customHeader]
    }
  },
)


//#v(-60pt)


#let Fontsize = 20pt

#let heading1 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#c5e0f5")

#box(
  fill: rgb("#f4f5f6"),

  width: 98%,
  height: 100pt,
  stroke: none,
  radius: (
    left: 0pt,
    top-right: 100pt,
    top-left: 100pt,
    bottom-right: 0pt,
    bottom-left: 0pt,
  ),
)


#place(top + left, dx: 30pt, dy: 40pt)[
  #text([Disclaimer], size: 40pt, fill: rgb("#0d3c6a"), weight: "extrabold")]

#v(-14pt)


#set par(justify: true)
#box(
  fill: rgb("fff"),
  width: 1520pt,
  height: 100pt,
  stroke: none,
  radius: (
    left: 0pt,
    top-right: 0pt,
    top-left: 0pt,
    bottom-right: 0pt,
    bottom-left: 0pt,
  ),
)[

  #place(dx: 50pt, dy: 30pt)[
    #set text(weight: "regular")
    #text(
      [This statement is for the exclusive and confidential use of the addressee only. Any is distribution, use or reproduction of this report without prior written permission of Kfintech Limited ("Kfintech") is unauthorised
        and strictly prohibited. Kfintech shall not be liable for any delay in receipt of this report.
        \
        \
        Kfintech Limited is only a distributor of third party investment products and not an advisor in offering investment advice and any information contained in this report or otherwise communicated shall not be
        construed as investment advice. All decisions to purchase or sell units/securities shall be on the basis of the personal judgement of the customer arrived at after due consideration and after understanding the risk
        factors associated with them. Kfintech does not in any manner guarantee any returns on any investment products.
        \
        \
        This report is for information purposes only. Although the information herein has been obtained from sources believed to be reliable by Kfintech Technologies Public Limited: Kfintech, does not guarantee, represent
        or warrant its accuracy, completeness or fairness. While effort was made to ensure the accuracy of information indicated in this report, neither Kfintech nor any of its afiliates, of cers, directors or employees shall
        in anyway be accountable, liable or responsible for any inaccuracy, omission, incompleteness or errors in the contents hereof.
        \
        \
        Kfintech disclaims all liability in relation to use of data or information used in this report which is sourced from third parties. The prices, value, income and appreciation of the securities mentioned in this
        statement are based on current market conditions as of the Statement Date mentioned herein and are subject to change without prior notice.
        \
        \
        Investments in securities are subject to risk including but not limited the risk of loss of the initial principal amount invested. Past performance is not indicative of future results. Please note the calculations shown
        in this report are purely indicative and are based on applicable tax laws. The client is solely responsible for consulting his/her/its own independent advisors as to the legal, tax, accounting and related matters
        concerning investments and nothing in this document or in any communication shall constitute such legal, tax or accounting advice.
        \
        \
        In case of any deviation from your Risk Pro le, you are requested to review your portfolio and take relevant action on the same.
        \
        \
        Please notify us immediately and in any case within 7 (seven) days of the Statement Date if you notice any error or discrepancy in the entries in this report otherwise the same will be considered correct.
        \
        \
        Portfolio details of Held away assets have been aggregated based on information provided by the client. The accuracy, authenticity of the data including prices, maturity details and performance cannot be
        ascertained by Kfintech and the responsibility to provide correct information on such assets and to make it meaningful solely lies with the Client/Investor. The Client/Investor is responsible for updating the
        information on a regular basis including reporting every such transaction. Kfintech takes no responsibility for authentication of any such data provided by the Client.
        \
        \
        Please note that the new entity name has been of cially updated with the Registrar of Companies (ROC). However, it is important to note that we are currently in the process of seeking approval from the
        regulators. Therefore, any mentions of the updated name should be interpreted within this ongoing regulatory context.],
      weight: "regular",
      size: 20pt,
    ))]

]
