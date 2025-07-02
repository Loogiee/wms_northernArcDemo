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
    inset: (top: 30pt, left: 20pt, right: 20pt, bottom: 30pt),
    width: 49.5%,
    height:100%,
    radius: 20pt,
    stroke: (2.8pt + luma(88%))
  )[
      #place(dx: 130pt, dy: 210pt, text(weight: "extrabold", size: 15pt, "Beginning Allocation"))
      #place(dx: 150pt, dy: 230pt, text(weight: "extrabold", size: 15pt,  ReportBeginDate))

      #place(dx: 530pt, dy: 210pt, text(weight: "extrabold", size: 15pt, "Ending Allocation"))
      #place(dx: 540pt, dy: 230pt, text(weight: "extrabold", size: 15pt,  ReportEndDate))

      #text("Portfolio Allocation by  Asset Class", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")
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


#set table(stroke: stroke(thickness:01pt,paint: rgb("#cdcdcd")))

  #box(width:100%,stroke: stroke(thickness:01pt,paint: rgb("#cdcdcd")),radius: 20pt,clip: true)[
 #table(
    columns: (1.5fr,1fr,.7fr,1fr,.7fr),
    stroke: none,
    align: center+horizon,
    inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
    table.header(
    table.cell(fill:rgb("#ebebeb"),rowspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold", "Product Type")),
    table.vline(start: 0,end: 2,stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Beginning Value")),
    table.cell(fill:rgb("#ebebeb"),colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Ending Value")),
    table.hline(stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Amount (₹)")]),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "%")]),
    table.vline(start: 0,end: 2,stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Amount (₹)")]),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "%")]),
  ),
  {{range .AssetwiseAllocation}}
    table.cell(align(left)[#text(size: 18pt, "{{.AssetGroupName}}")]),
    table.cell(align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberWithoutDecimalPointer .StartMarketValue}}")]),
    table.cell(align(right)[#text(size: 18pt, "{{ConvertToFormattedPercentagePointer .StartExposure}}"+"%")]),
    table.cell(align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberWithoutDecimalPointer .EndMarketValue}}")]),
    table.cell(align(right)[#text(size: 18pt, "{{ConvertToFormattedPercentagePointer .EndExposure}}"+"%")]),
    table.hline(stroke: rgb("#cdcdcd")),
{{end}}

  )]
  ]
]
]

#place(top+right,dy: 10pt)[
 #box(
  fill:white,
  inset: (left:20pt,right:20pt,top:40pt),
    width: 49.5%,
    height: 100%,
    radius: 20pt,
    stroke: (2.8pt + luma(88%))
  )[
    #place(dx: 10pt, dy: -15pt,pad(..titlePadding, text("Portfolio Breakup by Product Type", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")))
#place(top+left, dy: 20pt, dx: 0pt)[
  // Simulate the data structure from the template
  #let data = ({{range .SecurityCategoryAllocation}}
                (SecurityCategory: "{{ .SecurityCategory}}", StartExposure: {{ .StartMarketValue}}, EndExposure: {{ .EndMarketValue}}),
              {{end}})
  #box()[
#echarm.render(width: 100%, height: 450pt, options: (
    xAxis: (
    type: "category",
    data: ("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
    axisLine: (
      "show": true,
    ),
      axisTick: (
      "show": false
    ),
  ),
  yAxis: (
    type: "value",
    axisLine: (
      "show": true,
    ),
  ),
  series: (
    (data: (120, 20, 150, 80, 70, 110, 130),
    type: "bar",
    stack:"a",
    name:"a"
  ),
  (data: (12, 0, 15, 8, 7, 10, 30),
    type: "bar",
    name:"b",
    stack:"b",
  ))
))]
]

#place(dy: 500pt)[
  #box(width:100%,stroke: stroke(thickness:01pt,paint: rgb("#cdcdcd")),radius: 20pt,clip: true)[
 #table(
    columns: (1.5fr,1fr,.7fr,1fr,.7fr),
    stroke: none,
    align: center+horizon,
    inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
    table.header(
    table.cell(fill:rgb("#ebebeb"),rowspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold", [Product Type])),
    table.vline(start: 0,end: 2,stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Beginning Value")),
    table.cell(fill:rgb("#ebebeb"),colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Ending Value")),
    table.hline(stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Amount (₹)")]),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "%")]),
    table.vline(start: 0,end: 2,stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Amount (₹)")]),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "%")]),
  ),
  {{range .SecurityCategoryAllocation}}
    table.cell(align(left)[#text(size: 18pt, "{{.SecurityCategory}}")]),
    table.cell(align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberWithoutDecimalPointer .StartMarketValue}}")]),
    table.cell(align(right)[#text(size: 18pt, "{{ConvertToFormattedPercentagePointer .StartExposure}}"+"%")]),
    table.cell(align(right)[#text(size: 18pt, "{{ConvertToFormattedNumberWithoutDecimalPointer .EndMarketValue}}")]),
    table.cell(align(right)[#text(size: 18pt, "{{ConvertToFormattedPercentagePointer .EndExposure}}"+"%")]),
    table.hline(stroke: rgb("#cdcdcd")),
{{end}}

  )]
  ]
]
]
// #place(dy: -75pt)[
//    #custom-footer
// ]
