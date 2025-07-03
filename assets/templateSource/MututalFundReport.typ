{{$DataCount:=0}}
{{if .AmcWiseSection}}
{{$DataCount = 1}}
{{end}}

{{if ne $DataCount 0 }}
#set page(paper: "a2", flipped: true,
margin: (top:80pt,left:15pt,right:15pt),
header: none
)
#pagebreak()
#hide[ #heading(outlined: true)[#text([Mutual Fund Analysis],fill:rgb("#0d3c6a"))]]
#place(dx: -15pt,dy:-80pt,
  image(width:101% ,height: 109.7%,"./assets/images/Holding_Report2.0.png")
)
#place(
  dx:720pt,dy:-80pt,
  box(height: 109.7%,width: 70%,fill: rgb(0, 0, 0,60%))
)
#place(dx:519pt,dy:400pt,
   box(
      inset: 2em,
      fill: rgb("#75bbd4"),

      align(
        left,
        text(
          "Mutual Fund\n  Analysis",
          fill: white,
          size:40pt,
          weight: "black"
        )
      )
    ),
)
#place(
  horizon+center,
  dx:-10pt,
  dy:-10pt,
  stack(
    dir: ltr,
    spacing: 2em,
     stack(
      dir: ttb,
      circle(fill: rgb("#75bbd4"),radius: 1.5em),
      line(
        angle: 90deg,
        length: 35em,
        stroke: (
          paint:rgb("#75bbd4"),
          thickness:1em,
        )
      ),
      circle(fill: rgb("#75bbd4"),radius: 1.5em),
    ),
  )
)

  #place(
    dx:20%,
    dy:30%,
    context {
      let outline_data = query(heading.where(level:2))
      for entry in outline_data {
        // entry
        if entry.body.text.contains("Mutual Fund Analysis -"){
          link(
            entry.location(),
            [
            #pad(left: 550pt,
               box(
                 // stroke: 1pt+green,
                  width: 60%,
                  inset: 10pt,
                  // inset: (top: 0pt,bottom: 0pt),
                    stack(
                      dir: ltr,
                      spacing: 10%,
                      align(left)[
                        #stack(
                          dir: ltr,
                          spacing: 20pt,
                          circle(radius:7pt,fill: white),
                          text(weight: "bold",fill: white,size:24pt,entry.body.text.split("- ").at(-1)),
                        )
                      ],
                      align(right,text(weight: "bold",fill: white,size:24pt)[#entry.location().page()])
                  )
                )
          )
            ]
          )
        }
      }
    }
  )
{{end}}

// AMC Wise Exposure - All Advisors
{{if .AmcWiseSection}}
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("AMC Wise Exposure - All Advisors", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
        #text("as on "+ReportDate,size: 14pt, fill: rgb("#585858"))
        #place(dy: 8pt,dx:-10pt,[#line(length: 100%,stroke: 0.4pt + rgb("#cdcdcd"))])
      ],
       place(top+right,dx: -15pt,dy: 12pt,
          [#image("./assets/images/kfintech-logo.png", width: 250pt,height: 40pt, fit: "contain")])

)
)
#set page(paper: "a2", flipped: true,
margin: (top:80pt,left:15pt,right:15pt),
header: context{
  if counter(page).get().first() >= 1 {
    align(top)[#customHeader]
  }
})
#hide[
  #place()[== #text("Mutual Fund Analysis - AMC wise Exposure")]
]
#table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),

    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 6, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Name")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Purchase Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Market Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Unrealised Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "XIRR")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", " Asset Exposure %")]),
  ),
{{$ShowOnce := true}}
{{range  .AmcWiseSection}}
   {{if Contains .IssuerName "TOTAL"}}
    {{$ShowOnce = true}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    {{$TotalLable:="Sub Total"}}
    {{if Contains .IssuerName "GRAND_TOTAL"}}{{$TotalLable ="Grand Total"}}{{end}}
    table.cell(align(left)[#text("{{$TotalLable}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposure}}",fill :heading0)]),
  {{else}}
  {{if $ShowOnce}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 6, align(left)[#text("{{.AssetGroupName}}" )],fill: highlightBlue ),
      {{$ShowOnce = false}}
      {{end}}
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.IssuerName}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposure}}")]),
  {{end}}
{{end}}
)
{{end}}


// Fund Manager Wise Exposure - All Advisor
{{if .FundManagerSection}}
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Fund Manager Wise Exposure - All Advisor", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
        #text("as on "+ReportDate,size: 14pt, fill: rgb("#585858"))
        #place(dy: 8pt,dx:-10pt,[#line(length: 100%,stroke: 0.4pt + rgb("#cdcdcd"))])
      ],
       place(top+right,dx: -15pt,dy: 12pt,
          [#image("./assets/images/kfintech-logo.png", width: 250pt,height: 40pt, fit: "contain")])

)
)
#set page(paper: "a2", flipped: true,
margin: (top:80pt,left:15pt,right:15pt),
header: context{
  if counter(page).get().first() >= 1 {
    align(top)[#customHeader]
  }
})
#hide[
  #place()[== #text("Mutual Fund Analysis - Fund Manager wise Exposure")]
]
#table(
    columns: (1fr, 1.5fr, 1fr, 1fr),

    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 4, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell(align(left)[#text(fill: heading0, weight: "black", " Fund Manager")]),
    table.cell(align(left)[#text(fill: heading0, weight: "black", "AMC")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Market Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Exposure %")]),
  ),

{{range  .FundManagerSection}}
{{$isTotalRow := Contains .FundManagerName "TOTAL"}}
  {{if not $isTotalRow}}
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.FundManagerName}}")]),
    table.cell(align(left)[#text("{{.IssuerName}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .TotAssetExposure}}")]),
  {{end}}
{{end}}
{{range  .FundManagerSection}}
{{$isTotalRow := Contains .FundManagerName "TOTAL"}}
  {{if $isTotalRow}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Grand Total",fill :heading0)]),
    table.cell(align(left)[#text("{{.IssuerName}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .TotAssetExposure}}",fill :heading0)]),
  {{end}}
{{end}}
)
{{end}}

// Equity Mutual Fund - Quants
{{$CountData := 0}}
{{if .EquityMfAmcAllocation}}
{{$CountData = 1}}
{{end}}
{{if .EquityMfIndustryAllocation}}
{{$CountData = 1}}
{{end}}
{{if .EquityMfMarketCapitalization}}
{{$CountData = 1}}
{{end}}
{{if .EquityQuants}}
{{$CountData = 1}}
{{end}}

{{if ne $CountData 0}}
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Equity Mutual Fund - Quants", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
        #text(" ")
        #place(dy: -2pt)[#text("as on "+ReportDate,size: 14pt, fill: rgb("#585858"))]
        #place(dy: 14pt,dx:-10pt,[#line(length: 100%,stroke: 0.4pt + rgb("#cdcdcd"))])
      ],
       place(top+right,dx: -15pt,dy: 15pt,
          [#image("./assets/images/kfintech-logo.png", width: 250pt,height: 40pt, fit: "contain")])

)
)
#set page(paper: "a2", flipped: true,
margin: (top:80pt,left:15pt,right:15pt),
header: context{
  if counter(page).get().first() >= 1 {
    align(top)[#customHeader]
  }
})
#hide[
  #place()[== #text("Mutual Fund Analysis - Equity Mutual Fund Quants")]
]

#let currentData1 = (
 {{range .EquityMfMarketCapitalization}}
  ( value: {{ConvertToFormattedPercentagePointer .Percentage}},
     name: "{{ .MarketCapType}}"
  ),
{{end}}
 )
 //top left
 #let amcBar = (width, label: "100%", color: rgb("#2caffe")) => {
  // Convert width to a ratio if it's a float (assuming width is a percentage like 16.52)
  let widthRatio = if type(width) == "float" { calc.min(width / 100, 1.0) } else { width }

  // Apply a scaling factor to increase the standard width (e.g., 1.5x)
  let scaledWidthRatio = calc.min(widthRatio * 1.0, 1.0) // Scale width by 1.5, cap at 1.0

  if (scaledWidthRatio <= 0.0) {
    return rect(
      width: 20%,
      fill: white,
      height: 17.2pt,
      align(left + horizon, text(size: 15pt, label, fill: black)) // Left-align label
    )
  }
  return stack(
    dir: ltr,
    spacing: 5pt,
    rect(
      width: scaledWidthRatio * 100%, // Use scaled width
      fill: color,
      height: 35pt,
      radius: (right: 5pt)
    ),
    align(left + horizon, text(size: 15pt, label, baseline: 3pt)) // Left-align label outside bar
  )
}
#place(top+left,
  dx: 0pt, dy: 20pt
)[
  #box(
    width: 49%,
    height: 50%,
   stroke: rgb("#cecece"),
    radius: 20pt,
    inset: 10pt
  )[
    // Title
    #place(dx: 0pt,dy: 5pt)[
    #text("Industry Allocation(%)", size: 25pt, fill: rgb("0e496e"), weight: "bold")
    #v(10pt)

#set table(
  align: (x, y) => {
    if x == 0 {
      (right + horizon)
    } else {
      (left + horizon)
    }
  },
  inset: 2pt
)

#place(dx: -100pt, dy: 20pt)[
  #table(
    columns: (1fr, 1fr),
    stroke: none,
    column-gutter: 10pt,
    {{range .EquityMfIndustryAllocation}}
    box(align(top, text("{{.IndustryName}}"))),
    amcBar({{ConvertToFormattedPercentagePointer .Percentage}}, label: text("{{ConvertToFormattedPercentagePointer .Percentage}}%")),
    {{end}}
  )
]  ]

  ]
  ]

 //bottom left
#place(bottom+left,
  dx: 0pt, dy: -10pt
)[

  #box(
    width: 49%,
    height: 45%,
    stroke: rgb("#cecece"),
    radius: 20pt,
    inset: 20pt
  )[
    // Title
    #place(dx: 0pt,dy: 5pt)[
    #text("AMC Allocation(%)",  size: 25pt, fill: rgb("0e496e"), weight: "bold")

    #v(10pt)
#set table(
  align: (x, y) => {
    if x == 0 {
      (right + horizon)
    } else {
      (left + horizon)
    }
  },
  inset: 2pt
)

#place(dx: -100pt, dy: 20pt)[
  #table(
    columns: (1fr, 1fr),
    stroke: none,
    column-gutter: 10pt,
    {{range .EquityMfAmcAllocation}}
    box(width: 250pt,align(top, text("{{.IssuerName}}"))),
    amcBar({{ConvertToFormattedPercentagePointer .Percentage}}, label: text("{{ConvertToFormattedPercentagePointer .Percentage}}%")),
    {{end}}
  )
]
  ]
  ]
]

 //top right
#place(top+right,
dx: 0pt,dy:20pt)[
#place(dx: 20pt,dy:20pt)[#text(" Market Capitalization Allocation(%)", size: 25pt,  fill: rgb("0e496e"), weight: "extrabold")]
  #box(width: 49%,height: 50%, stroke: rgb("#cecece"),radius: 20pt)[
  #pad(left: 250pt,top: -650pt,
    grid(
      columns: (1fr, 1fr),
      align: (center),
      // Current allocation chart
      box(
        width: 130%, height: 150%, stroke: none)[
        #echarm.render(width: 100%, height: 100%, options: (
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
      ),
    ]
  )
)


#place(
 dx: 70pt, dy: -150pt
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
]
]


 //bottom right
#place(bottom+right,
  dx: 0pt, dy: -10pt
)[

  #let EquityQuantsData = (
{{range .EquityQuants}}
    (Metric: "{{.Metric}}", Values: [{{ConvertToFormattedPercentagePointer .ValueYear}}]),
{{end}}
  )

  // Create a bordered box containing the table
  #box(
    width: 49%,
    height: 45%,
    stroke: rgb("#cecece"),
    radius: 20pt,
    inset: 20pt
  )[
    // Title
    #place(dx: 0pt,dy: 5pt)[
    #text("Equity Quants",  size: 25pt, fill: rgb("0e496e"), weight: "bold")
    #v(10pt)
    // Table
    #table(

      columns: (2fr, 1fr),
     stroke: none,
     inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
      align: (left, right),
      // Header row
      table.cell(fill: rgb("#dadada"))[Metric],
      table.cell(fill: rgb("#dadada"), align: right)[*Value(yr)*],
      // Data rows
      ..EquityQuantsData.map(row => {
        (
          text(row.Metric),
          text(row.Values),
        )
      }).flatten()
    )
  ]
  ]
]
{{end}}

// Mutual Fund - Sector Wise Exposure
{{if .SectorWiseSection}}
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Mutual Fund - Sector Wise Exposure", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
        #text("as on "+ReportDate, fill: rgb("#585858"))
        #place(dy: 8pt,dx:-10pt,[#line(length: 100%,stroke: 0.4pt + rgb("#cdcdcd"))])
      ],
       place(top+right,dx: -15pt,dy: 12pt,
          [#image("./assets/images/kfintech-logo.png", width: 250pt,height: 40pt, fit: "contain")])

)
)
#set page(paper: "a2", flipped: true,
margin: (top:80pt,left:15pt,right:15pt),
header: context{
  if counter(page).get().first() >= 1 {
    align(top)[#customHeader]
  }
})
#hide[
  #place()[== #text("Mutual Fund Analysis - Sector Wise Exposure")]
]
#table(
    columns: (2fr, 1fr, 1fr),

    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 3, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Name")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Amount")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Exposure %")]),
  ),
  {{range  .SectorWiseSection}}
  {{$isTotalRow := Contains .SectorName "TOTAL"}}
  {{if not $isTotalRow}}
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.SectorName}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .TotAssetExposure}}")]),
  {{end}}
{{end}}
{{range  .SectorWiseSection}}
  {{$isTotalRow := Contains .SectorName "Grand Total"}}
  {{if $isTotalRow}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Total",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .TotAssetExposure}}",fill :heading0)]),
  {{end}}
{{end}}
)
{{end}}


// Transaction History - Mutual Funds
{{if .MututalFundTransSection}}
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Transaction History - Mutual Funds", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
        #text(" ")
        #place(dy: -2pt)[#text("Statement Date From : "+ReportBeginDate+" and "+ReportEndDate,size: 14pt, fill: rgb("#585858"))]
        #place(dy: 14pt,dx:-10pt,[#line(length: 100%,stroke: 0.4pt + rgb("#cdcdcd"))])
      ],
       place(top+right,dx: -15pt,dy: 15pt,
          [#image("./assets/images/kfintech-logo.png", width: 250pt,height: 40pt, fit: "contain")])

)
)
#set page(paper: "a2", flipped: true,
margin: (top:80pt,left:15pt,right:15pt),
header: context{
  if counter(page).get().first() >= 1 {
    align(top)[#customHeader]
  }
})
#hide[
  #place()[== #text("Mutual Fund Analysis - Transaction History")]
]
#table(
    columns: (.7fr, 1.5fr, 1.5fr, .7fr, .7fr, .7fr, .7fr, .7fr, .7fr),

    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 9, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Asset Class")]),
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Sub Asset Class")]),
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Name")]),
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Folio No")]),
    table.cell(align(center)[#text(fill: heading0, weight: "black", "Transaction Date")]),
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Description")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Units")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Purchase Price")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Amount")]),
  ),
{{$RequredDateFormat :="02 Jan 2006"}}
{{range  .MututalFundTransSection}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.AssetGroupName}}")]),
    table.cell(align(left)[#text("{{.SecurityCategory}}")]),
    table.cell(align(left)[#text("{{.SecurityName}}")]),
    table.cell(align(left)[#text("{{.FolioNo}}")]),
    table.cell(align(center)[#text("{{DateFormatter .TransDate $RequredDateFormat}}")]),
    table.cell(align(left)[#text("{{.TransCode}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Quantity}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Price}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquCost}}")]),
{{end}}
)
{{end}}


// #pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Debt Mutual Fund - Quants", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
        // #text(" ")
       #text("as on "+ReportDate,size: 14pt, fill: rgb("#585858"))
        #place(dy: 14pt,dx:-10pt,[#line(length: 100%,stroke: 0.4pt + rgb("#cdcdcd"))])
      ],
       place(top+right,dx: -15pt,dy: 15pt,
          [#image("./assets/images/kfintech-logo.png", width: 250pt,height: 40pt, fit: "contain")])

)
)
#set page(paper: "a2", flipped: true,
margin: (top:80pt,left:15pt,right:15pt),
header: context{
  if counter(page).get().first() >= 1 {
    align(top)[#customHeader]
  }
})
#hide[
  #place()[== #text("Mutual Fund Analysis - Debt Mutual Fund Quants")]
]

#let currentData1 = (
  {{range .EquityMfMarketCapitalization}}
  ( value: {{ConvertToFormattedPercentagePointer .Percentage}},
     name: "{{ .MarketCapType}}"
  ),
{{end}}


 )



 //top left

#place(top+left,
dx: 0pt,dy:20pt)[

#place(
dx: 20pt,dy:30pt)[#text(" Rating Allocation(%)", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")]


  #box(width: 32%,height: 48%,stroke: rgb("#cecece"),radius: 20pt)[


  #pad(left: 150pt,top: -650pt,


    grid(
      columns: (1fr, 1fr),
      align: (center),
      // Current allocation chart
      box(
        width: 130%, height: 150%, stroke: none)[
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
              //show: true,
            ),
            data: currentData1
          ),
        )
      ),
    ]
  )
)

#place(
 dx: 80pt, dy: -180pt
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


]
  ]


#let currentData2 = (
  {{range .EquityMfMarketCapitalization}}
  ( value: {{ConvertToFormattedPercentagePointer .Percentage}},
     name: "{{ .MarketCapType}}"
  ),
{{end}}
 )



//  //top mid

#place(top+left,
dx: 550pt,dy:20pt)[

#place(
dx: 20pt,dy:30pt)[#text(" Instrument Allocation(%)", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")]


  #box(width: 32%,height: 48%,stroke: rgb("#cecece"),radius: 20pt)[


  #pad(left: 150pt,top: -650pt,


    grid(
      columns: (1fr, 1fr),
      align: (center),
      // Current allocation chart
      box(
        width: 130%, height: 150%, stroke: none)[
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
      ),
    ]
  )
)


#place(
 dx: 80pt, dy: -180pt
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


]
  ]

 //top right

#place(top+right,
  dx: 0pt, dy: 20pt
)[
  #box(
    width: 32%,
    height:48%,
   stroke: rgb("#cecece"),
    radius: 20pt,
    clip: true,
    inset: 20pt
  )[
    // Title
    #place(dx: 0pt,dy: 5pt)[
    #text("Industry Allocation(%)", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")



     #v(10pt)

  #let amcBar = (width, label: "100%", color: rgb("#2caffe")) => {
  // Convert width to a ratio if it's a float (assuming width is a percentage like 16.52)
  let widthRatio = if type(width) == "float" { calc.min(width / 100, 1.0) } else { width }


  if (widthRatio <= 0.0) {
    return rect(
      width: 20%,
      fill: white,
      height: 17.2pt,
      align(left + horizon, text(size: 15pt, label, fill: black)) // Left-align label
    )
  }
  return stack(
    dir: ltr,
    spacing: 5pt,
    rect(width: widthRatio * 100%, fill: color, height: 30pt, radius: (right: 5pt)),
    align(left + horizon, text(size: 15pt, label, baseline: 3pt)) // Left-align label outside bar
  )
}

#set table(
  align: (x, y) => {
    if x == 0 {
      (right + horizon)
    } else {
      (left + horizon)
    }
  },
  inset: 2pt
)

#place(dx: 80pt, dy: 40pt)[
  #table(
    columns: (150pt, 240pt),
    stroke: none,
    column-gutter: 10pt,
    {{range .EquityMfAmcAllocation}}
    box(width: 250pt,align(top, text(size: 15pt, "{{.IssuerName}}"))),
    amcBar({{ConvertToFormattedPercentagePointer .Percentage}}, label: text(size: 15pt, "{{ConvertToFormattedPercentagePointer .Percentage}}%")),
    {{end}}
  )
]

  ]
  ]
]

#let currentData2 = (
  (value:  100, name: "Upto 12 Months"),
 )

#place(bottom+left,
dx: 0pt,dy:20pt)[

#place(
dx: 20pt,dy:30pt)[#text("Avg Maturity Allocation(%)", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")]


  #box(width: 32%,height: 48%,stroke: rgb("#cecece"),radius: 20pt)[


  #pad(left: 150pt,top: 100pt,


    grid(
      columns: (1fr, 1fr),
      align: (center),
      // Current allocation chart
      box(
        width: 130%, height: 150%, stroke: none)[
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
    ]
  )
)
#place(
 dx: 80pt, dy: -180pt
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
]
  ]
//top left
#place(top+left,
dx: 0pt,dy:20pt)[



  #box(width: 32%,height: 48%,stroke: rgb("#cecece"),radius: 20pt)[


  #pad(left: 150pt,top: -650pt,


    grid(
      columns: (1fr, 1fr),
      align: (center),
      // Current allocation chart
      box(
        width: 130%, height: 150%, stroke: none)[
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
    ]
  )
)





]
  ]




//  //bottom mid

#place(bottom+left,
  dx: 550pt, dy: 20pt
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
    stroke: rgb("#cecece") ,
    radius: 20pt,
    inset: 20pt
  )[
    #place(
dx: 20pt,dy:30pt)[#text("Debt Quants", size: 30pt,  fill: rgb("0e496e"),font: "Bai Jamjuree", weight: "extrabold")]



//table
#set table(
      fill: (x, y) =>
      if y == 0 {
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
      ..bottomdata.map(row => {
        (
          text(size: 14pt, row.Metric),
          text(size: 14pt, row.Values),
        )
      }).flatten()
    )
  ]
  ]


//bottom right

#place(bottom+right,
  dx: 0pt, dy: 20pt
)[

  #box(
    width: 33%,
    height: 48%,
    clip: true,
    stroke: rgb("#cecece"),
    radius: 20pt,
    inset: 20pt
  )[
    // Title
    #place(dx: 0pt,dy: 5pt)[
    #text("AMC Allocation(%)", font: "Bai Jamjuree", size: 18pt, fill: rgb("0e496e"), weight: "bold")

   #v(10pt)

  #let amcBar = (width, label: "100%", color: rgb("#2caffe")) => {
  // Convert width to a ratio if it's a float (assuming width is a percentage like 16.52)
  let widthRatio = if type(width) == "float" { calc.min(width / 100, 1.0) } else { width }


  if (widthRatio <= 0.0) {
    return rect(
      width: 20%,
      fill: white,
      height: 17.2pt,
      align(left + horizon, text(size: 15pt, label, fill: black)) // Left-align label
    )
  }
  return stack(
    dir: ltr,
    spacing: 5pt,
    rect(width: widthRatio * 100%, fill: color, height: 30pt, radius: (right: 5pt)),
    align(left + horizon, text(size: 15pt, label, baseline: 3pt)) // Left-align label outside bar
  )
}

#set table(
  align: (x, y) => {
    if x == 0 {
      (right + horizon)
    } else {
      (left + horizon)
    }
  },
  inset: 2pt
)

#place(dx: 100pt, dy: 40pt)[
  #table(
    columns: (150pt, 240pt),
    stroke: none,
    column-gutter: 10pt,
    {{range .EquityMfIndustryAllocation}}
    box(width: 250pt,align(top, text(size: 15pt, "{{.IndustryName}}"))),
    amcBar({{ConvertToFormattedPercentagePointer .Percentage}}, label: text(size: 15pt, "{{ConvertToFormattedPercentagePointer .Percentage}}%")),
    {{end}}
  )
]
  ]
  ]
]

