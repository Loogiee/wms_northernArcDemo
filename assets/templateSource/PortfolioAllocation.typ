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

#place(dx:408pt,dy:266pt)[#line(length: 45%,angle: 90deg,stroke: (2.8pt + luma(88%)))]
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
#place(dx:408pt,dy:100pt)[#line(length: 45%,angle: 90deg,stroke: (2.8pt + luma(88%)))]

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

  #let portBrkupdata = ({{range .SecurityCategoryAllocation}}
                (SecurityCategory: "{{ .SecurityCategory}}", StartExposure: {{ .StartMarketValue}}/1000000, EndExposure: {{ .EndMarketValue}}/1000000),
              {{end}})

#place(dx:460pt,dy: 30pt)[
  #table(
    stroke: none,
    columns: (.1fr,.3fr,.1fr,1.6fr),
    table.cell(align(right+horizon)[#circle(fill: rgb(primaryColors.at(1)),radius: .4em)]),
    table.cell(align(left+horizon)[#text("Beginning Value",size: .8em)]),
    table.cell(align(right+horizon)[#circle(fill: rgb(primaryColors.at(0)),radius: .4em)]),
    table.cell(align(left+horizon)[#text("Ending Value",size: .8em)]),

  )
]
#place(dy:40pt,dx:-40pt)[
#let wrapped_name =(name)=> {if name.len() > 10 {
        let words = name.split(" ")
        let mid = calc.floor(words.len() / 2)
        words.slice(0, mid).join(" ") + "\n" + words.slice(mid).join(" ")
      } else {
        name
}
}
#echarm.render(width: 110%, height: 450pt, options: (
    xAxis: (
    type: "category",
    data: portBrkupdata.map((items)=> wrapped_name((items.SecurityCategory))),
    axisLabel:(formatter: "{value}",color: "#000000",fontWeight: "bold"),
    axisLine: ("show": true),
    axisTick: ("show": false),
    nameTruncate: (maxWidth :10)
    ),
    calculable: true,
  yAxis: (
    type: "value",

    axisLine: ("show": true),
     axisLabel:(formatter: "{value}M",color: "#000000",fontWeight: "bold"),
  ),
  series: (
    (data: portBrkupdata.map((items)=> items.StartExposure),
    type: "bar",
    stack:"startExposure",
    name:"startExposure",
    barWidth: 23,
     // barGap: "10%",
     barCategoryGap: "1%",
    color:primaryColors.at(1)),
  (data: portBrkupdata.map((items)=> items.EndExposure),
    type: "bar",
    name:"endExposure",
    stack:"endExposure",
    barWidth: 23,
     // barGap: "10%",
     barCategoryGap: "1%",
    color:primaryColors.at(0))
  )
)
)
]
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
