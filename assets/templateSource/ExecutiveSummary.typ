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
// Current asset allocation data
#let currentData = (

 {{range .AllocationComparisonSection}}
  ( value: {{ .StrategicPercentage}},
     name: "{{ .AssetGroupName}}",
  ),
{{end}}
)

#let targetData = (

 {{range .AllocationComparisonSection}}
  ( value: {{ .TotalExposurePercentage}},
     name: "{{ .AssetGroupName}}",
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
#place(top + right)[
  #box(
    inset: (y: 14pt, x: 10pt),
    width: 49.5%,
    height:49%,
    radius: 20pt,
    fill: white,
    stroke: (2.8pt + luma(88%)),
  )[
    // Chart titles
      #place(dx:20%, dy: 28%, text(weight: "extrabold", size: 22pt, "Current"))
    #place(dx:71%, dy: 28%, text(weight: "extrabold", size: 22pt, "Target"))

    #place(dx: 10pt, dy: -15pt, pad(..titlePadding, text(
      "Asset Allocation (%)",
      size: 30pt,
      fill: rgb("0e496e"),
      weight: "extrabold",
    )))
#let currentData1 = (
{{range .AllocationComparisonSection}}
  ( value: {{ .TotalExposurePercentage}},
     name: "{{ .AssetGroupName}}",
  ),
{{end}}
)

#let currentData2 = (
{{range .AllocationComparisonSection}}
  ( value: {{ .StrategicPercentage}},
     name: "{{ .AssetGroupName}}",
  ),
{{end}}
)

    // Main header
 #pad(left: 5pt,top: 0pt,
    // Grid for the two charts
    grid(
      columns: (1fr, 1fr),
      align: (center),
      // Current allocation chart
      box(
        width: 100%, height: 100%, stroke: none)[
           #place(dy:-10%,dx:10%)[
        #echarm.render(width: 80%, height:80%, options: (
          series: (
            name: "Current Allocation",
            type: "pie",
            radius: ("50%", "60%"),
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
      )],
      #place(
       dx: 0pt,
        dy: 250pt
      )[
  #grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  inset: (left:10pt,top:20pt,right:10pt,bottom:10pt),
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
         width: 100%, height: 100%, stroke: none)[
          #place(dy:-10%,dx:10%)[
        #echarm.render(width: 80%, height: 80%, options: (
          series: (
            name: "Current Allocation",
            type: "pie",
            radius: ("50%", "60%"),
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
      )]
      #place(
     dx: 0pt,
        dy: 250pt
      )[
    #grid(
   columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  inset: (left:10pt,top:20pt,right:10pt,bottom:10pt),
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


  ]
]
#place(bottom + left)[
#box(
    fill:white,
    inset: (y: 14pt, x: 10pt),
    width: 49.5%,
    height:49.5%,
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
        table.cell(align(center)[#text("{{.Date}}")]),
        table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .ExcessReturns}}"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .BMXIRR}}"+"%")]),
        {{end}}
      ),
    )
    // Grid for the two chart
    // Legend for the charts
  ]
]
#place(bottom + right)[
  #let jsonData = (
  (
    Date: "June 2024",
    allocations: (
      (asset_group_name: "Commodities", value: 1.76),
      (asset_group_name: "Equities", value: 88.24),
      (asset_group_name: "Fixed Income", value: 0.0),
      (asset_group_name: "Liquid", value: 0.0),
      (asset_group_name: "new", value: 10.0),
    )
  ),
  (
    Date: "September 2024",

    allocations: (
            (asset_group_name: "Commodities", value: 1.15),
          (asset_group_name: "Equities", value: 88.84),
          (asset_group_name: "Fixed Income", value: 0.0),
          (asset_group_name: "Liquid", value: 0.01),
          (asset_group_name: "new", value: 10.0),
        )
      ),
  (
    Date: "December 2024",
    allocations: (
      (asset_group_name: "Commodities", value: 0.62),
      (asset_group_name: "Equities", value: 88.26),
      (asset_group_name: "Fixed Income", value: 1.11),
      (asset_group_name: "Liquid", value: 0.01),
      (asset_group_name: "new", value: 10.0),
    )
  ),
  (
    Date: "December 2024",
   allocations: (
      (asset_group_name: "Commodities", value: 0.62),
      (asset_group_name: "Equities", value: 88.26),
      (asset_group_name: "Fixed Income", value: 1.11),
      (asset_group_name: "Liquid", value: 0.01),
      (asset_group_name: "new", value: 10.0),
    )
  ),
  (
    Date: "December 2024",
    allocations: (
      (asset_group_name: "Commodities", value: 0.62),
      (asset_group_name: "Equities", value: 88.26),
      (asset_group_name: "Fixed Income", value: 1.11),
      (asset_group_name: "Liquid", value: 0.01),
      (asset_group_name: "new", value: 10.0),
    )
  ),
  (
    Date: "December 2024",
    allocations: (
      (asset_group_name: "Commodities", value: 0.62),
      (asset_group_name: "Equities", value: 88.26),
      (asset_group_name: "Fixed Income", value: 1.11),
      (asset_group_name: "Liquid", value: 0.01),
      (asset_group_name: "new", value: 10.0),
    )
  ),
  (
    Date: "December 2024",
    allocations: (
      (asset_group_name: "Commodities", value: 0.62),
      (asset_group_name: "Equities", value: 88.26),
      (asset_group_name: "Fixed Income", value: 1.11),
      (asset_group_name: "Liquid", value: 0.01),
      (asset_group_name: "new", value: 10.0),
    )
  ),
(
    Date: "December 2024",
    allocations: (
      (asset_group_name: "Commodities", value: 0.62),
      (asset_group_name: "Equities", value: 88.26),
      (asset_group_name: "Fixed Income", value: 1.11),
      (asset_group_name: "Liquid", value: 0.01),
      (asset_group_name: "new", value: 10.0),
    )
  ),
)
#box(width: 49.5%,height: 49.5%,radius: 20pt,fill: white,stroke: (2.8pt + luma(88%)))[
#place(dx: 15pt, dy:20pt, pad(..titlePadding, text(
    "Quarterly Asset Allocation Trends",
    size: 25pt,
    fill: rgb("0e496e"),
    weight: "extrabold",
  )))
  #place(dx:-50pt,dy:80pt)[
  #echarm.render(
  width: 100%,
  height: 450pt,
  options: (
    grid: (
      left: "10%",
      right: "5%",
      bottom: "25%", // Minimize space below x-axis
      containLabel: true,
      // top: "1%",
    ),
    xAxis: (
      type: "value",
      min: 0,
      max: 100, // Assuming percentages
      interval: 10, // Set ticks at 0, 10, 20, ..., 100
      axisLine: (
        "show": false,
      ),
      axisLabel: (
        fontWeight:"bold",
        // fontSize: 20, // Smaller font size for labels
        margin: 4, // Reduce label margin
      ),
      axisTick: (
        "show": false // Hide ticks to save space
      ),
      splitLine: (
        "show": false // Hide grid lines for cleaner look
      ),
    ),
   yAxis: (
      type: "category",
      data: jsonData.map(item => item.Date),
      axisLine: (
        "show": false,
      ),
      axisTick: (
        "show": false
      ),
      axisLabel: (
        fontWeight:"bold",
        // fontSize: 18,
        margin: 5
      ),
    ),
    series: {
      // Get unique asset_group_name values from the first allocations array
      let assetGroups = jsonData.at(0).allocations.map(a => a.asset_group_name)
      // Generate series dynamically
      assetGroups.enumerate().map(((index, name)) => (
        name: name,
        type: "bar",
        stack: "assetStack",
        data: jsonData.map(item => item.allocations.at(index).value),
        color: primaryColors.at(index)
      ))
    },
    legend: (
      "show": true,
      top: "80%",
      left: "center",
      right: "center",
       icon: "circle"

    ),
    tooltip: (
      trigger: "axis",
     axisPointer: (
        type: "shadow"
      )
    )
  )
)]
]
]