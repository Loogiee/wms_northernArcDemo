#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Executive Summary", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
        #text(" ",size: 14pt, fill: rgb("#585858"))
        #place(dy: 8pt,dx:-10pt,[#line(length: 100%,stroke: 0.4pt + rgb("#cdcdcd"))])
      ],
       place(top+right,dx: -15pt,dy: 12pt,
          [#image("./assets/images/kfintech-logo.png", width: 250pt,height: 40pt, fit: "contain")])
)
)
#set page(paper: "a2", flipped: true,fill: rgb("#f4f5f6"),
margin: (top:80pt,left:15pt,right:15pt),
header: context{
  if counter(page).get().first() >= 1 {
    align(top)[#customHeader]
  }
})

#let headerBg = rgb("#f4f5f6")
// Define colors and data
#let primaryColors = (
  "#5470c6", // Equities
  "#91cc75", // Alternatives
  "#fac858", // Fixed Income
  "#ee6666", // Commodities
  "#73c0de", // Liq & Eqv.
  "#5470c6", // Equities
  "#91cc75", // Alternatives
  "#fac858", // Fixed Income
  "#ee6666", // Commodities
  "#73c0de", // Liq & Eqv.
)
// Current asset allocation data
#let currentData = (

 {{range .AllocationComparisonSection}}
  ( value: {{ .StrategicPercentage}},
     name: "{{ .AssetGroupName}}",
     total: {{ .TotalExposurePercentage}}
  ),
{{end}}
)

// Page and header settings
#let NexedgeHeaderColor = "#353535"
#let headersize_xs = 18pt
#let titlePadding = (top: 15pt, bottom: 15pt, left: 20pt, right: 20pt)


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
#hide[
  #heading(outlined: true)[#text([Executive Summary], fill: rgb("#0d3c6a"))]
]
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
    #place(dx: 145pt, dy: 130pt, text(weight: "extrabold", size: 25pt, "Current"))
    #place(dx: 540pt, dy: 130pt, text(weight: "extrabold", size: 22pt, "Current"))

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
      box(width: 60%, height: 60%, stroke: none)[
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
      box(width: 60%, height: 60%, stroke: none)[
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


  #pad(left: 0pt, top: -50pt,
  grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: -400pt, // Adjustable to prevent overlap
    gutter: 25pt,
    inset: 15pt,
    align: left,
    // Dynamically generate legend items
    ..currentData.enumerate().map(((i, item)) => {
      let value = str(item.value) + "%"
      let name = item.name
      // Dynamically wrap long names
      let wrapped-name = if name.len() > 15 { // Adjust threshold as needed
        let words = name.split(" ")
        let mid = calc.floor(words.len() / 2)
        words.slice(0, mid).join(" ") + "\n" + words.slice(mid).join(" ")
      } else {
        name
      }
      stack(dir: ltr, spacing: 10pt,
        rect(width: 10pt, height: 8pt, radius: 50%, fill: rgb(primaryColors.at(i))),
        text(value, size: 12pt),
        place(
          dx: -30pt,
          dy: 15pt,
          box(width: 60pt, text(wrapped-name, size: 12pt)) // Auto-wrap within 60pt
        )
      )
    })
  )
  )
  #pad(left: 400pt, top: -183pt,
  grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 30pt, // Adjustable to prevent overlap
    gutter: 25pt,
    inset: 15pt,
    align: left,
    // Dynamically generate legend items
    ..currentData.enumerate().map(((i, item)) => {
      let value = str(item.value) + "%"
      let name = item.name
      // Dynamically wrap long names
      let wrapped-name = if name.len() > 15 { // Adjust threshold as needed
        let words = name.split(" ")
        let mid = calc.floor(words.len() / 2)
        words.slice(0, mid).join(" ") + "\n" + words.slice(mid).join(" ")
      } else {
        name
      }
      stack(dir: ltr, spacing: 10pt,
        rect(width: 10pt, height: 8pt, radius: 50%, fill: rgb(primaryColors.at(i))),
        text(value, size: 12pt),
        place(
          dx: -30pt,
          dy: 15pt,
          box(width: 60pt, text(wrapped-name, size: 12pt)) // Auto-wrap within 60pt
        )
      )
    })
  )
  )
  ]
]
#place(bottom + left, dy: 15pt)[
  #box(
    inset: (y: 20pt, x: 10pt),
    width: 810pt,
    height: 490pt,
    radius: 8pt,
    stroke: (2.8pt + luma(88%)),
  )[
    #place(dx: 0pt, dy: 0pt, pad(..titlePadding, text(
      " Relative Performance",
      size: 25pt,
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
        //stroke: (x, y) => if y == 0 or y == 1 { (bottom: 1pt + black) } else { none },
        columns: (0.9fr, 1.2fr, 1.5fr, 1.2fr),
        inset: 25pt,
        align: center+horizon,
        stroke: none,

        // Table header with increased text size
        table.header(
          [#text(size: 16pt,fill: rgb("#0d3b6b"), weight: "bold", "  ")],
          [#text(size: 16pt,fill: rgb("#0d3b6b"), weight: "bold", "Portfolio Returns")],
          [#text(size: 16pt,fill: rgb("#0d3b6b"), weight: "bold", "Benchmark Returns")],
          [#text(size: 16pt,fill: rgb("#0d3b6b"), weight: "bold", "Excess Returns")],
        ),
        {{range .RelativePerformanceOverQuarters}}
        table.cell(align(center)[#text(size: 16pt,"{{.Date}}")]),
        table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(center)[#text(size: 16pt,"{{.BMXIRR}}"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(center)[#text(size: 16pt,"{{.ExcessReturns}}"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(center)[#text(size: 16pt,"{{.XIRR}}"+"%")]),
        {{end}}
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
      (quarter: "Jun 2024", Category: "Hybrid", values: 19.51),
      (quarter: "Jun 2024", Category: "Equtity", values: 1.51),
      (quarter: "Jun 2024", Category: "Debt", values: 9.51),
      (quarter: "Jun 2024", Category: "Commodities", values: -19.51),
      (quarter: "Jun 2024", Category: "Equtity", values: 10.51),
      (quarter: "Apr 2024", Category: "Hybrid", values: 19.51),
      (quarter: "Apr 2024", Category: "Equtity", values: 1.51),
      (quarter: "Apr 2024", Category: "Debt", values: 9.51),
      (quarter: "Apr 2024", Category: "Commodities", values: -19.51),
      (quarter: "Apr 2024", Category: "Equtity", values: 10.51),
    )

    #let assetClasses = (
      "Hybrid",
      "Equity",
      "Debt",
      "Commodities",
    )

  ]
]

