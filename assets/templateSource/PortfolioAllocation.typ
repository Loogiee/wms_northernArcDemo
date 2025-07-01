#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Portfolio Allocation", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
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
#hide[
  #heading(outlined: true)[#text([Portfolio Allocation], fill: rgb("#0d3c6a"))]
]


#let titlePadding = (top: 15pt, bottom: 15pt, left: 20pt, right: 20pt)

#let primaryColors = (
  "#1e90ff",
  "#0ecb81",
  "#f79009",
  "#f14366",
  "#73c0de",
  "#EA342C",
  "#FE9900",
  "#060270",
  "#EEF702"
)

#let currentData1 = (
{{range .AssetwiseAllocation}}
  ( value: {{ .StartExposure}},
     name: "{{ .AssetGroupName}}",
     total: {{ .StartMarketValue}}
  ),
{{end}}
)

#let currentData2 = (
{{range .AssetwiseAllocation}}
  ( value: {{ .EndExposure}},
     name: "{{ .AssetGroupName}}",
     total: {{ .EndMarketValue}}
  ),
{{end}}
)


#place(top+left,dy: 10pt)[
  #box(
    fill:white,
    inset: 20pt,
    width: 49.5%,
    height: 1000pt,
    radius: 8pt,
    stroke: (2.8pt + luma(88%))
  )[
    // Chart titles
    //  #place(dx: 500pt, dy: 150pt, text(weight: "extrabold", size: 15pt, " Ending Allocation
    //  30-Jun-2024"))

      #place(dx: 130pt, dy: 150pt, text(weight: "extrabold", size: 15pt, "Beginning Allocation"))
      #place(dx: 150pt, dy: 170pt, text(weight: "extrabold", size: 15pt,  ReportBeginDate))

      #place(dx: 500pt, dy: 150pt, text(weight: "extrabold", size: 15pt, "Ending Allocation"))
      #place(dx: 520pt, dy: 170pt, text(weight: "extrabold", size: 15pt,  ReportEndDate))




   #place(dx: 10pt, dy: -15pt,
  pad(..titlePadding, text("Portfolio Allocation by  Asset Class", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold"))
)
    // Main header
        #pad(left: 5pt,top: -150pt,
    // Grid for the two charts
grid(
      columns: (1fr, 1fr),
      align: (center),
      // Current allocation chart
      box(
        width: 120%, height: 70%, stroke: none)[
        #echarm.render(width: 80%, height:80%, options: (
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
            data: currentData1
          ),
        )
      ),
      #place(
       dx: 30pt,
        dy: -190pt  // Adjust this value to move the legend below the chart
      )[
  #grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: -120pt,
  gutter: 10pt,
  inset: 20pt,
  align: left,
  // Dynamically generate legend items
  ..currentData1.enumerate().map(((i, item)) => {
    let value = str(item.value) + "%"
    let name = item.name
    stack(
      dir: ttb, // Stack vertically
      spacing: 5pt, // Space between color-value and name
      stack(
        dir: ltr, // Horizontal stack for color and value
        spacing: 15pt,
        rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(i))),
        text(value, size: 15pt)
      ),
      place(
        dx: 27pt, // Offset to align name under value (12pt for rect width + 15pt for spacing)
        text(name, size: 15pt)
      )
    )
  })
)
]

      ],
      box(
         width: 120%, height: 70%, stroke: none)[
        #echarm.render(width: 80%, height: 80%, options: (
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
            data: currentData2
          ),
        )
      )
      #place(
      dx: 50pt,  dy: -165pt
      )[
    #grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: -120pt,
  gutter: 10pt,
  inset: 20pt,
  align: left,
  // Dynamically generate legend items
  ..currentData2.enumerate().map(((i, item)) => {
    let value = str(item.value) + "%"
    let name = item.name
    stack(
      dir: ttb, // Stack vertically
      spacing: 5pt, // Space between color-value and name
      stack(
        dir: ltr, // Horizontal stack for color and value
        spacing: 15pt,
        rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(i))),
        text(value, size: 15pt)
      ),
      place(
        dx: 27pt, // Offset to align name under value (12pt for rect width + 15pt for spacing)
        text(name, size: 15pt)
      )
    )
  })
)
      ]
      ],


    )
  )
#place(dy: -138pt)[
  #set table(
    fill:(x,y) =>
    if y==0 or y==1{
      rgb("#f1f1f1")
    }

  )

#set table(stroke: stroke(thickness:01pt,paint: rgb("#cdcdcd")))

  #table(
     columns: (1.5fr,1fr,.5fr,1fr,.5fr),
    stroke: none,
    align: center+horizon,
    inset: 20pt,
    // stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))
      table.hline(stroke: rgb("#cdcdcd")
),
  table.vline(
stroke: rgb("#cdcdcd")
),
    table.cell(rowspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold", [Asset Class])),
     table.vline(start: 0,
end: 2,
stroke: rgb("#cdcdcd")
),
    table.cell(colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [Beginning Value])),
    table.cell(colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [Ending Value])),
      table.hline(stroke: rgb("#cdcdcd")),
    table.cell(text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [Amount(₹)])),
    table.cell(text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [%])),
     table.vline(start: 0,
end: 2,
stroke: rgb("#cdcdcd")
),
    table.cell(text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [Amount(₹)])),
    table.cell(text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [%])),

    table.vline(
stroke: rgb("#cdcdcd")
),

  {{range .AssetwiseAllocation}}
    align(left)[#text(size: 18pt, "{{.AssetGroupName}}")],
    align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberWithoutDecimalPointer .StartMarketValue}}")],
    align(center)[#text(size: 18pt, "{{ConvertToFormattedNumberPointer .StartExposure}}"+"%")],
    align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberWithoutDecimalPointer .EndMarketValue}}")],
    align(center)[#text(size: 18pt, "{{ConvertToFormattedNumberPointer .EndExposure}}"+"%")],
    table.hline(stroke: rgb("#cdcdcd")),
{{end}}

  )
  ]
]
]

#place(top+right,dy: 10pt)[
 #box(
  fill:white,
    inset: (y: 14pt, x: 50pt),
    width: 49.5%,
    height: 1000pt,
    radius: 8pt,
    stroke: (2.8pt + luma(88%))
  )[
    #place(dx: 10pt, dy: -15pt,
  pad(..titlePadding, text("Portfolio Breakup by Product Type", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold"))
)
#place(top+right, dy: 50pt, dx: -700pt)[

  // Simulate the data structure from the template
  #let data = (
    {{range .SecurityCategoryAllocation}}
(SecurityCategory: "{{ .SecurityCategory}}", StartExposure: {{ .StartExposure}}, EndExposure: {{ .EndExposure}}),
{{end}}
  )

  // Extract arrays from the data
  #let categories = data.map(item => item.SecurityCategory)
  #let beginning = data.map(item => item.StartExposure)
  #let ending = data.map(item => item.EndExposure)

  #let max-value = 1500

  // Chart dimensions
  #let bar-width = 50pt
  #let bar-spacing = 4pt
  #let group-spacing = 10pt
  #let chart-height = 330pt
   #let chart-width = 300pt

  // Draw the entire chart
  #block(width: auto, height: auto, inset: 0pt, {
    v(20pt)

    // Main chart area with Y-axis and bars
    box(width: auto, height: auto, {
      // Y-axis with values and grid lines
      place(
        box(width: chart-width, height: chart-height, {
          // Y-axis vertical line
          place(dx: 34pt, dy: 0pt, line(start: (0pt, 0pt), end: (0pt, chart-height), stroke: 1pt))

          // Y-axis values and horizontal grid lines - increments of 250
          for i in range(7) {
            let y-value = max-value - i * 250
            let y-pos = chart-height * float(i * 250) / float(max-value)
            // Y-axis value

            place(dx: -10pt, dy: y-pos, align(right, text(size: 12pt,[#y-value]+"M")))
            // Horizontal grid line (light gray)

          }
        })
      )

      // Chart with bars
      place(dx: 35pt, dy: 0pt, {
        box(width: auto, height: chart-height, {
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
            place(dx: x-pos, dy: 0pt, {
              // Beginning value bar (green)
              place(dx: 0pt, dy: chart-height - beg-height,
                rect(width: bar-width, height: beg-height, fill: rgb("#39b97d"), radius: (top: 15pt))
              )
              // Ending value bar (blue)
              place(dx: bar-width + bar-spacing, dy: chart-height - end-height,
                rect(width: bar-width, height: end-height, fill: rgb("#4886c6"
 ), radius: (top: 15pt))
              )
              // Category label
              place(dx: 0pt, dy: chart-height + 7pt,
                box(width: 2*bar-width + bar-spacing, {
                  align(center, text(size: 15pt)[#cat])
                })
              )
              // Tick mark on x-axis
              place(dx: bar-width, dy: chart-height,
                line(start: (0pt, 0pt), end: (0pt, 5pt), stroke: 1pt)
              )
            })

            // Move to next group position
            x-pos += 2 * bar-width + bar-spacing + group-spacing
          }
        })
      })
    })

    // Y-axis label (commented out in original code)
    // place(dx: -30pt, dy: chart-height/2, rotate(90deg, text(size: 12pt)[Value]))

    // Legend
    v(0pt)
    place(dx: 450pt, [
      #align(center, {
        box(width: 15pt, height: 15pt, fill: rgb("#39b97d"))
        h(5pt)
        text(size: 12pt)[Beginning Value]
        h(30pt)
        box(width: 15pt, height: 15pt, fill: rgb("#4886c6"))
        h(5pt)
        text(size: 12pt)[Ending Value]
      })
    ])
  })
]



#place(dy: 500pt)[
  #set table(
    fill:(x,y) =>
    if y==0 or y==1{
      rgb("#f1f1f1")
    }
  )

  #table(
    columns: (1.5fr,1fr,.5fr,1fr,.5fr),
    stroke: none,
align: center+horizon,
    inset: 20pt,
    table.hline(stroke: rgb("#cdcdcd")),
       table.vline(
stroke: rgb("#cdcdcd")
),
     table.cell(rowspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold", [Product Type])),
     table.vline(start: 0,
end: 2,
stroke: rgb("#cdcdcd")
),
    table.cell(colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [Beginning Value])),

    table.cell(colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [Ending Value])),
    table.hline(stroke: rgb("#cdcdcd")),
    table.cell(text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [Amount(₹)])),
    table.cell(text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [%])),
       table.vline(start: 0,
end: 2,
stroke: rgb("#cdcdcd")
),

    table.cell(text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [Amount(₹)])),
    table.cell(text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  [%])),


    table.vline(
stroke: rgb("#cdcdcd")
),
  {{range .SecurityCategoryAllocation}}
    align(left)[#text(size: 18pt, "{{.SecurityCategory}}")],
    align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberWithoutDecimalPointer .StartMarketValue}}")],
    align(center)[#text(size: 18pt, "{{ConvertToFormattedNumberPointer .StartExposure}}"+"%")],
    align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberWithoutDecimalPointer .EndMarketValue}}")],
    align(center)[#text(size: 18pt, "{{ConvertToFormattedNumberPointer .EndExposure}}"+"%")],
    table.hline(stroke: rgb("#cdcdcd")),
{{end}}

  )
  ]
]
]
// #place(dy: -75pt)[
//    #custom-footer
// ]
