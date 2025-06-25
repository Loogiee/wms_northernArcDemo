#pagebreak()
{{range $element := .RelativePerformanceOverQuarters}}
{{$element.Metric}}\
{{$element.Month1}}\
{{$element.Month2}}\
{{$element.Month3}}\
{{$element.Month4}}
{{end}}
#pagebreak()

#text("Executive Summary", size: 40pt, fill: rgb("#0d3c6a"), weight: "extrabold")
#hide[

  #heading(outlined: true)[#text([Executive Summary], fill: rgb("#0d3c6a"), size: 25pt)]

]
#place(dx: 75%, dy: -7%, [#image("./assets/images/kfintech-logo.png", width: 350pt)])
#place(dy: 20pt, [#line(length: 100%)])
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
  (
    description: "INFLOW MINUS OUTFLOW",
    Value: "₹ -26,78,06,427.9",
    Date: "Since Inception",
    Image: "./assets/images/one.png",
  ),
  (
    description: "HOLDING COST",
    Value: "₹ 1,32,48,47,581.1",
    Date: "as on 30 Jun 2022",
    Image: "./assets/images/two.png",
  ),
  (
    description: "CURRENT VALUE",
    Value: "₹ 1,64,89,89,920.8",
    Date: "as on 30 Jun 2022",
    Image: "./assets/images/three.png",
  ),
  (description: "PORTFOLIO RETURN(IRR)", Value: "24.5%", Date: "Since Inception", Image: "./assets/images/four.png"),
  (
    description: "NIFTY",
    des: "SENSEX",
    Value: "-2.631%",
    Value1: "0.569%",
    Date: "12-May-2025",
    Image: "./assets/images/fiveone.png",
    Image2: "./assets/images/fivetwo.png",
  ),
  (description: "BENCHMARK RETURN(IRR)", Value: "4.25%", Date: "Since Inception", Image: "./assets/images/six.png"),
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

    #place(dx: 10pt, dy: -15pt, pad(..titlePadding, text(
      "Asset Allocation (%)",
      size: 30pt,
      fill: rgb("0e496e"),
      weight: "extrabold",
    )))
    // Main header



    // Grid for the two charts
    #grid(
      columns: (1fr, 1fr),
      align: (center),
      // Current allocation chart
      box(width: 100%, height: 70%, stroke: none)[
        #echarm.render(width: 100%, height: 100%, options: (
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
        ))
      ],

      // Target allocation chart
    )

    // Legend for the charts

    #pad(left: 20pt, top: -20pt, grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 1pt,
      column-gutter: -400pt,
      inset: 0.5em,
      align: left,
      stack(dir: ltr, spacing: 10pt, rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(0))), text(
        "10 %
Equities",
        size: 16pt,
      )),
      stack(dir: ltr, spacing: 10pt, rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(1))), text(
        "20 %
Alternatives",
        size: 16pt,
      )),
      stack(dir: ltr, spacing: 10pt, rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))), text(
        "5 %
Fixed Income",
        size: 16pt,
      )),

      stack(dir: ltr, spacing: 10pt, rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))), text(
        "18.5 %
Hybrid",
        size: 16pt,
      )),
    ))
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
    #place(dx: 10pt, dy: -10pt, pad(..titlePadding, text(
      " Relative Performance",
      size: 30pt,
      fill: rgb("0e496e"),
      weight: "extrabold",
    )))
    // Main header
    #set table(fill: (x, y) => if y == 0 {
      headerBg
    } else {
      rgb("#ffff")
    })

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

        table.hline(),
        // Horizontal line under the header

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
          .flatten(),
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
    #place(dx: 10pt, dy: -10pt, pad(..titlePadding, text(
      "Quarterly Asset Allocation Trends",
      size: 30pt,
      fill: rgb("0e496e"),
      weight: "extrabold",
    )))


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
        #place(dx: 0pt, dy: 35pt, line(
          start: (90pt, 0pt),
          end: (90pt, rowHeight * quarterData.len() + 20pt),
        ))

        // X-axis labels
        #for i in range(0, 6) {
          let value = i * 20
          let xPos = 90pt + (i * 80pt)

          place(dx: xPos, dy: rowHeight * quarterData.len() + 60pt, text(str(value), size: 9pt))
        }

        // Draw bars
        #for (i, row) in quarterData.enumerate() {
          let yPos = 65pt + i * rowHeight

          // Quarter label
          place(dx: 15pt, dy: yPos, text(size: 11pt, weight: "medium", row.quarter))

          // Draw bar segments
          let xRunning = 90pt
          let totalWidth = 450pt // Total width of the bar (representing 100%)
          for (j, value) in row.values.enumerate() {
            if value > 0 {
              let segmentWidth = value * totalWidth / 100

              place(dx: xRunning, dy: yPos - 15pt, box(
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
              ))

              // Add percentage label if segment is wide enough
              if value >= 5 {
                place(dx: xRunning + segmentWidth / 2 - 12pt, dy: yPos, text(
                  fill: white,
                  weight: "medium",
                  size: 10pt,
                  str(value) + "%",
                ))
              }

              xRunning += segmentWidth
            }
          }
        }

        // Legend
        #place(dy: 250pt)[
          #pad(left: 20pt, top: 1pt, grid(
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
          ))
        ]
      ]
    }
    // Generate the chart
    #place()[

      #allocation_chart()
    ]
  ]
]
