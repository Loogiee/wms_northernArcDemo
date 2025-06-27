#pagebreak()
#set page(paper: "a2", flipped: true,
margin: (top:50pt,left:35pt,right:35pt))

// #import "footer.typ": custom-footer

#let titlePadding = (top: 15pt, bottom: 15pt, left: 20pt, right: 20pt)

#let primaryColors = (
  "#5470c6", // Equities
  "#91cc75", // Alternatives
  "#fac858", // Fixed Income
  "#ee6666", // Commodities
  "#73c0de"  // Liq & Eqv.
)

#let currentData1 = (
  (value: 30, name: "Equities"),
  (value: 61, name: "Alternatives"),
  (value: 6, name: "Commodities"),
  (value: 0.6, name: "Fixed Income"),
  (value: 0, name: "Liq & Eqv.")
)

#let currentData2 = (
  (value: 18, name: "Equities"),
  (value: 48, name: "Alternatives"),
  (value: 32, name: "Fixed Income"),
  (value: 0.6, name: "Commodities"),
  (value: 0, name: "Liq & Eqv.")
)
#place(top+left, dx: 0pt, dy: -20pt,)[
    #text("Portfolio Allocation", size: 40pt, fill: rgb("0e496e"), weight: "extrabold")
]


#place(
    top+right, dx: -35pt, dy: -30pt, [#image("./assets/images/kfintech-logo.png", width: 252pt,height:50pt)])
 #hide[
  #heading(outlined: true)[#text([Portfolio Allocation],fill:rgb("#0d3c6a"))]
]

#place(dy: 30pt, [#line(length: 100%)])
#v(100pt)


// Footer Section


// Footer end
#place(top+left,dy: 70pt)[
  #box(
    inset: (y: 14pt, x: 10pt),
    width: 780pt,
    height: 1000pt,
    radius: 8pt,
    stroke: (2.8pt + luma(88%))
  )[
    // Chart titles
    #place(dx: 70pt, dy: 220pt, text(weight: "extrabold", size: 25pt, "Beginning Allocation
        30-Sep-2023"))
     #place(dx: 470pt, dy: 220pt, text(weight: "extrabold", size: 25pt, " Ending Allocation
     30-Jun-2024"))

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
            data: currentData1
          ),
        )
      ),
#place(
 dx: 20%, dy: -210pt
)[
  #grid(
    columns: (1fr, 1fr, 1fr,1fr),
    column-gutter: (0% + -9.1em,),
    gutter: -5.1em,       // Slightly reduced gutter
    inset: -2.2em,     // Reduced inset for less side padding
    align: left,
    stack(dir: ltr, spacing: 6pt,
      rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(0))),
      text("0.6% CO", size: 16pt)
    ),
    stack(dir: ltr, spacing: 6pt,
      rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(1))),
      text("61.9 DE", size: 16pt)
    ),
    stack(dir: ltr, spacing: 6pt,
      rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
      text("30.7 EQ", size: 16pt)
    ),
    stack(dir: ltr, spacing: 6pt,
      rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
      text("6.8 HY", size: 16pt)
    )
  )
]

      ],
      box(
         width: 120%, height: 70%, stroke: none)[
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
            data: currentData2
          ),
        )
      )
      #place(
      dx: 95pt,  dy: -188pt
      )[

     #grid(
    columns: (1fr, 1fr, 1fr,1fr),
    column-gutter: (0% + -9.1em,),
    gutter: -5.1em,       // Slightly reduced gutter
    inset: -2.2em,        // Reduced inset for less side padding
    align: left,
 stack(dir: ltr, spacing: 6pt,
      rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(0))),
      text("0.6% CO", size: 16pt)
    ),

    stack(dir: ltr, spacing: 6pt,
      rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(1))),
      text("61.9 DE", size: 16pt)
    ),
    stack(dir: ltr, spacing: 6pt,
      rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
      text("30.7 EQ", size: 16pt)
    ),
    stack(dir: ltr, spacing: 6pt,
      rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(2))),
      text("6.8 HY", size: 16pt)
    )  )

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


  #table(
    columns: (1fr,1fr,1fr,1fr,1fr),
    stroke: none,
    align: center+horizon,
    inset: 20pt,
      table.hline(
stroke: rgb("#cdcdcd")
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
    align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberPointer .StartMarketValue}}")],
    align(center)[#text(size: 18pt, "{{ConvertToFormattedNumberPointer .StartExposure}}"+"%")],
    align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberPointer .EndMarketValue}}")],
    align(center)[#text(size: 18pt, "{{ConvertToFormattedNumberPointer .EndExposure}}"+"%")],
    table.hline(stroke: rgb("#cdcdcd")),
{{end}}

  )
  ]
]
]

#place(top+right,dy: 70pt,dx: -30pt)[
 #box(
    inset: (y: 14pt, x: 50pt),
    width: 780pt,
    height: 1000pt,
    radius: 8pt,
    stroke: (2.8pt + luma(88%))
  )[
    #place(dx: 10pt, dy: -15pt,
  pad(..titlePadding, text("Portfolio Breakup by Product Type", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold"))
)
#place(top+right,dy: 50pt,dx: -650pt)[
 #let categories = ("AIF", "Equity", "Mutual Funds", "NCD", "PMS")

#let beginning = (30, 10, 1000, 15, 25)

#let ending = (40, 60, 1350, 20, 30)

#let max-value = 1500

// Chart dimensions

#let bar-width = 50pt

#let bar-spacing = 4pt

#let group-spacing = 20pt

#let chart-height = 380pt

// Draw the entire chart

#block(width: auto, height: auto, inset: 0pt, {



  v(20pt)

  // Main chart area with Y-axis and bars

  box(width: auto, height: auto, {

    // Y-axis with values and grid lines

    place(

      box(width: 30pt, height: chart-height, {

        // Y-axis vertical line

        place(dx: 30pt, dy: 0pt, line(start: (0pt, 0pt), end: (0pt, chart-height), stroke: 1pt))

        // Y-axis values and horizontal grid lines - increments of 250

        for i in range(7) {

          let y-value = max-value - i * 250

          let y-pos = chart-height * float(i * 250) / float(max-value)

          // Y-axis value

          place(dx: 0pt, dy: y-pos, align(right, text(size: 8pt)[#y-value]))

          // Horizontal grid line (light gray)

          place(dx: 30pt, dy: y-pos, line(start: (0pt, 0pt), end: (50pt, 0pt), stroke: (paint: rgb(200, 200, 200), thickness: 0.5pt)))

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

                  rect(width: bar-width, height: beg-height, fill: rgb(0, 128, 0),radius: (

    top: 15pt)))

            // Ending value bar (blue)

            place(dx: bar-width + bar-spacing, dy: chart-height - end-height,

                  rect(width: bar-width, height: end-height, fill: rgb(0, 0, 255),radius: (

    top: 15pt),))

            // Category label

            place(dx: 0pt, dy: chart-height + 5pt,

                  box(width: 2*bar-width + bar-spacing, {

                    align(center, text(size: 10pt, weight: "medium")[#cat])

                  }))

            // Tick mark on x-axis

            place(dx: bar-width, dy: chart-height,

                  line(start: (0pt, 0pt), end: (0pt, 5pt), stroke: 1pt))

          })

          // Move to next group position

          x-pos += 2 * bar-width + bar-spacing + group-spacing

        }

      })

    })

  })

  // Y-axis label

  // place(dx: -30pt, dy: chart-height/2, rotate(90deg, text(size: 12pt)[Value]))

  // Legend

  v(50pt)
  place(dx: 450pt,)[
  #align(center, {
    box(width: 15pt, height: 15pt, fill: rgb(0, 128, 0))
    h(5pt)
    text(size: 12pt)[Beginning Value]
    h(30pt)
    box(width: 15pt, height: 15pt, fill: rgb(0, 0, 255))
    h(5pt)
    text(size: 12pt)[Ending Value]
  })
]
})]
#place(dy: 500pt)[
  #set table(
    fill:(x,y) =>
    if y==0 or y==1{
      rgb("#f1f1f1")
    }
  )

  #table(
    columns: (1.5fr,1fr,1fr,1fr,1fr),
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
    align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberPointer .StartMarketValue}}")],
    align(center)[#text(size: 18pt, "{{ConvertToFormattedNumberPointer .StartExposure}}"+"%")],
    align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberPointer .EndMarketValue}}")],
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