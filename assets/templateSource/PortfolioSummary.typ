#pagebreak()
#pagebreak()
#set text(size:8pt,weight: "bold")
#let heading0 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#9cccf8")

{{$DataCount:=0}}

{{if .SubassetMarketCapTypeSection}}
// "Product Wise Exposure - Advisors / Distributors"
{{$DataCount = 1}}
{{end}}

{{if .AssetSubassetSection}}
// "Asset Class Wise Summary"
{{$DataCount = 1}}
{{end}}

{{if .SubassetMarketCapTypeSection}}
// "Sub Asset Class Wise Exposure - Advisors / Distributors"
{{$DataCount = 1}}
{{end}}


#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
       #text("Asset Class Wise Summary", size: 16pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
      #text("as on "+ReportDate,size: 8pt, fill: rgb("#585858"))
      ],
       place(top+right,dx: -15pt,dy: 10pt,
          [#image("./assets/images/kfintech-logo.png", width: 155pt,height: 30pt)]),
      place(dy: -10pt,[#line(length: 100%,stroke: 0.5pt + rgb("#cdcdcd"))])
)
)

#set page(paper: "a4", flipped: true,
margin: (top:35pt,left:15pt,right:15pt),
header: context{
  if counter(page).get().first() >= 1 {
    align(top)[#customHeader]
  }
})
{{if ne $DataCount  0}}

  #table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: none,
    inset: (top: 15pt, left: 10pt, right: 10pt, bottom: 15pt),
    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 9, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell(align(left)[#text(fill: heading0, "Particulars")]),
    table.cell(align(right)[#text(fill: heading0, "Market Value")]),
    table.cell(align(center+horizon)[#text(fill: heading0, "% Holding")]),
    table.cell(align(right)[#text(fill: heading0, "Holding Cost")]),
    table.cell(align(right)[#text(fill: heading0, "Gain/Loss Realised")]),
    table.cell(align(right)[#text(fill: heading0, "Dividend Interest")]),
    table.cell(align(right)[#text(fill: heading0, "Gain/Loss Unrealised")]),
    table.cell(align(center+horizon)[#text(fill: heading0, "IRR %")]),
    table.cell(align(left)[#text(fill: heading0, "Benchmark")]),
  ),


 {{range  .AssetSubassetSection}}
    {{if Contains .SecurityCategory "TOTAL"}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.AssetGroupName}}" )],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")],fill: highlightBlue),
    table.cell(align(center+horizon)[#text("{{ .AssetExposure}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Dividend}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}")],fill: highlightBlue),
    table.cell(align(center+horizon)[#text("{{ConvertToFormattedNumberPointer .XIRR}}")],fill: highlightBlue),
    table.cell(align(left)[#text("{{.BenchmarkName}}")],fill: highlightBlue),
    {{else}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.SecurityCategory}}" )] ),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(center+horizon)[#text("{{ .AssetExposure}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Dividend}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}")]),
    table.cell(align(center+horizon)[#text("{{ConvertToFormattedNumberPointer .XIRR}}")]),
    table.cell(align(left)[#text("{{.BenchmarkName}}")]),
    {{end}}
  {{end}}

  )
  #pagebreak()
   #text("Product Wise Exposure - Advisors / Distributors", size: 16pt, fill: rgb("0e496e"), weight: "extrabold")\
    #text("as on "+ReportDate,size: 8pt, fill: rgb("#585858"))
    #hide[
      #heading(outlined: true)[#text([Product Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"))]
    ]
    #place(dy: -5pt,[#line(length: 100%,stroke: 0.5pt + rgb("#cdcdcd"))])

    #place(top+right,
          dx: -10pt,
          dy: -8pt,
          [#image("./assets/images/kfintech-logo.png", width: 155pt,height: 30pt)])

  #table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: none,
    inset: (x, y) => if y == 0 and y == 1 {
    10pt
  } else {
    15pt
  },
    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 8, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell(align(left)[#text(fill: heading0, "Asset Class")]),
    table.cell(align(right)[#text(fill: heading0, "Purchase Value")]),
    table.cell(align(right)[#text(fill: heading0, "Market Value")]),
    table.cell(align(right)[#text(fill: heading0, "Unrealised Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0, "Dividend Interest")]),
    table.cell(align(right)[#text(fill: heading0, "Realised Gain/Loss")]),
    table.cell(align(center)[#text(fill: heading0, "IRR %")]),
    table.cell(align(center)[#text(fill: heading0, "Exposure %")]),
  ),
  {{$SubassetMarketCapTypeSection := .SubassetMarketCapTypeSection}}

  {{range  .SubassetMarketCapTypeSection}}
    {{if Contains .AssetGroupName "TOTAL"}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Total" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .DistributedIncome}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}" ,fill: heading0)],),
      table.cell(align(center)[#text("{{.XIRR}}" ,fill: heading0)],),
      table.cell(align(center)[#text("{{.AssetExposure}}" ,fill: heading0)],),
    {{else}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("{{.GroupLabel}}" )] ),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .DistributedIncome}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}" )],),
      table.cell(align(center)[#text("{{.XIRR}}" )],),
      table.cell(align(center)[#text("{{.AssetExposure}}" )],),
    {{end}}
  {{end}}
  )

    #pagebreak()
   #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 16pt, fill: rgb("0e496e"), weight: "extrabold")\
    #text("as on "+ReportDate,size: 8pt, fill: rgb("#585858"))
    #hide[
      #heading(outlined: true)[#text([Sub Asset Class Wise Exposure - Advisors / Distributors],fill:rgb("#0d3c6a"))]
    ]
    #place(dy: -5pt,[#line(length: 100%,stroke: 0.5pt + rgb("#cdcdcd"))])

    #place(top+right,
          dx: -10pt,
          dy: -8pt,
          [#image("./assets/images/kfintech-logo.png", width: 155pt,height: 30pt)])

  #table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: none,
    inset: (x, y) => if y == 0 and y == 1 {
    10pt
  } else {
    15pt
  },
    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 8, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell(align(left)[#text(fill: heading0, "Asset Class")]),
    table.cell(align(right)[#text(fill: heading0, "Purchase Value")]),
    table.cell(align(right)[#text(fill: heading0, "Market Value")]),
    table.cell(align(right)[#text(fill: heading0, "Unrealised Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0, "Income")]),
    table.cell(align(right)[#text(fill: heading0, "Realised Gain/Loss")]),
    table.cell(align(center)[#text(fill: heading0, "IRR%")]),
    table.cell(align(center)[#text(fill: heading0, "Exposure %")]),
  ),

  {{range  .SubAssetSection}}
    {{if Contains .AssetGroupName "TOTAL"}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Total" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}" ,fill: heading0)],),
      table.cell(align(right)[#text("-" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}" ,fill: heading0)],),
      table.cell(align(center)[#text("{{.XIRR}}" ,fill: heading0)],),
      table.cell(align(center)[#text("{{.AssetExposure}}" ,fill: heading0)],),
    {{else}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("{{.GroupLabel}}" )] ),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}" )],),
      table.cell(align(right)[#text("-" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}" )],),
      table.cell(align(center)[#text("{{.XIRR}}" )],),
      table.cell(align(center)[#text("{{.AssetExposure}}" )],),
    {{end}}
  {{end}}
  )

{{end}}

