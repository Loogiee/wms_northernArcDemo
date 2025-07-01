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
  {{range .BasicInformationSection}}
  (
    description: "{{ .Description}}",
    Value: "{{ .StrigValue}}",
    Date: "{{ .Date}}",
    Colors :"{{.Color}}",
    Image: "{{.Images}}"
  ),
  {{end}}
)
#hide[
  #heading(outlined: true)[#text([Executive Summary], fill: rgb("#0d3c6a"))]
]
#place(top + left, dy: 20pt)[

  #let benchItems = smallCardList.filter(item => item.description.contains("BenchmarkInfo_"))
  // Fil'er for i'ems wi'hou' "BenchmarkInfo_" in descrip'ion
  #let nonBenchItems = smallCardList.filter(item => not item.description.contains("BenchmarkInfo_"))

  // Ensure we have a' leas' 5 non-benchmark i'ems for box1-box4 and box6
  #let nonBenchCount = nonBenchItems.len()
  #let boxesBeforeCombined = if nonBenchCount >= 4 { nonBenchItems.slice(0, 4) } else { nonBenchItems }
  #let boxesAfterCombined = if nonBenchCount > 4 { nonBenchItems.slice(4) } else { () }

  #grid(
    columns: 2,
    column-gutter: 10pt,
    row-gutter: 10pt,
    // Boxes 1-4 (firs' 4 non-benchmark i'ems or placeholders)
    ..boxesBeforeCombined.map(item => {
      box(
        inset: 15pt,
        width: 405pt,
        height: 155pt,
        radius: 8pt,
        stroke: (2.8pt + luma(88%)),
        fill: white,
      )[
        // Display descrip'ion
        #place(dx:310pt)[#image(item.Image, width: 50pt, height: 55pt)]
        #text(item.description, size: 20pt, weight: "extrabold")\
        // Display da'e
        #place(dy:-15pt)[#text(item.Date, size: 14pt, fill: rgb("#00000041"), weight: "extrabold", spacing: 2pt, baseline: -3pt)]
        // Display value
        #align(bottom, text(item.Value,fill:rgb(item.Colors), size: 25pt, spacing: 2pt, weight: "bold", stretch: 50%))
      ]
    }),
    // Add placeholders if fewer 'han 4 non-benchmark i'ems
    ..if nonBenchCount < 4 {
      range(4 - nonBenchCount).map(_ => box(width: 400pt, height: 155pt))
    } else { () },
    // Combined box for benchmark i'ems in 5'h posi'ion
    if benchItems.len() > 0 {
      box(
        inset: (y: 14pt, x: 10pt),
        width: 405pt,
        height: 155pt,
        radius: 8pt,
        stroke: (2.8pt + luma(88%)),
        fill: white,
      )[
        #grid(
          columns: 2,
          column-gutter: 180pt,
          inset: (left:8pt,right:10pt),
          // Ver'ical alignmen' for each column
          ..benchItems.map(item => {
            // Trunca'e "BenchmarkInfo_" from descrip'ion
            let displayDesc = item.description.replace("BenchmarkInfo_", "")
            box(height:126pt)[
              // Display 'runca'ed descrip'ion
              #align(bottom)[
              #text(displayDesc, size: 15pt, weight: "extrabold")
              // Display value below descrip'ion
             #text(item.Value, size: 25pt,fill:rgb(item.Colors), spacing: 2pt, weight: "bold")
            ]]
          })
        )
      ]
    } else {
      // Emp'y box if no benchmark i'ems
      box(width: 400pt, height: 155pt)
    },
    // Box 6 and onward (remaining non-benchmark i'ems)
    ..boxesAfterCombined.map(item => {
      box(
        inset: 15pt,
        width: 404pt,
        height: 155pt,
        radius: 8pt,
        stroke: (2.8pt + luma(88%)),
        fill: white,
      )[
        #place(dx:310pt)[#image(item.Image, width: 50pt, height: 55pt)]
        // Display descrip'ion
        #text(item.description, size: 20pt, weight: "extrabold")\
        // Display da'e
        #place(dy:-15pt)[#text(item.Date, size: 14pt, fill: rgb("#00000041"), weight: "extrabold", spacing: 2pt, baseline: -3pt)]
        // Display value
        #align(bottom, text(item.Value,fill:rgb(item.Colors), size: 25pt, spacing: 2pt, weight: "bold", stretch: 50%))
      ]
    })
  )
]


// Place donut chart on the right
#place(top + right, dy: 20pt)[
  #box(
    inset: (y: 14pt, x: 10pt),
    width: 49.5%,
    height: 485pt,
    radius: 8pt,
    fill: white,
    stroke: (2.8pt + luma(88%)),
  )[
    // Chart titles
    #place(dx: 155pt, dy: 130pt, text(weight: "extrabold", size: 25pt, "Current"))
    #place(dx: 560pt, dy: 130pt, text(weight: "extrabold", size: 22pt, "Target"))

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
#place(bottom + left)[
  #box(
    fill:white,
    inset: (y: 20pt, x: 10pt),
    width: 49.5%,
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
          table.cell(align(right)[#text(fill: rgb("#0d3b6b"), weight: "black", " ")]),
          table.cell(align(right)[#text(fill: rgb("#0d3b6b"), weight: "black", "Portfolio Returns")]),
          table.cell(align(right)[#text(fill: rgb("#0d3b6b"), weight: "black", "Benchmark Returns")]),
          table.cell(align(right)[#text(fill: rgb("#0d3b6b"), weight: "black", "Excess Returns")]),
        ),
        {{range .RelativePerformanceOverQuarters}}
        table.cell(align(center)[#text(size: 16pt,"{{.Date}}")]),
        table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text(size: 16pt,"{{.XIRR}}"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text(size: 16pt,"{{.ExcessReturns}}"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text(size: 16pt,"{{.BMXIRR}}"+"%")]),
        {{end}}
      ),
    )
    // Grid for the two chart
    // Legend for the charts
  ]
]
#place(bottom + right)[
  #box(
    inset: (y: 60pt, x: 10pt),

    width: 49.5%,
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