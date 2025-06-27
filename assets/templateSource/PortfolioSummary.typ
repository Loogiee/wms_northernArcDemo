#pagebreak()
#pagebreak()
#set page(paper: "a2", flipped: true,
margin: (top:15pt,left:35pt,right:35pt))
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


{{if ne $DataCount  0}}
    #text("Asset Class Wise Summary", size: 40pt, fill: rgb("0e496e"), weight: "extrabold")\
    #text("as on "+ReportDate,size: 15pt, fill: rgb("#585858"))
#hide[
  #heading(outlined: true)[#text([ Ageing Report],fill:rgb("#0d3c6a"))]
]
#place(dy: -10pt,[#line(length: 100%,stroke: 0.5pt + rgb("#cdcdcd"))])

#place(top+right,
       dx: -15pt,
       dy: -40pt,
      [#image("./assets/images/kfintech-logo.png", width: 252pt,height: 50pt)])



#v(20pt)

#let heading0 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#9cccf8")

#set table(

  stroke: none,
  // fill: (x, y) => if y == 0 or y == 2 {
  //   headerBg
  // } else if y == 3 or y == 8 or y == 11 or y == 13 {
  //   highlightBlue
  // } else {
  //   whiteBg
  // },
  align: (x, y) => if y == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x, y) => if y == 0 or y == 1 {
    35pt
  } else {
    25pt
  },
)


  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),

    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 9, align: left + horizon, [#text(fill: heading0,size: 25pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading0, weight: "black", [Particulars])]),
    table.cell([#text(fill: heading0, weight: "black", [Market Value])]),
    table.cell([#text(fill: heading0, weight: "black", [% Holding])]),
    table.cell([#text(fill: heading0, weight: "black", [Holding Cost])]),
    table.cell([#text(fill: heading0, weight: "black", [Gain/Loss Realised])]),
    table.cell([#text(fill: heading0, weight: "black", [Dividend Interest])]),
    table.cell([#text(fill: heading0, weight: "black", [Gain/Loss Unrealised])]),
    table.cell([#text(fill: heading0, weight: "black", [IRR%])]),
    table.cell([#text(fill: heading0, weight: "black", [Benchmark])]),
  ),


 {{range  .AssetSubassetSection}}
    {{if Contains .SecurityCategory "TOTAL"}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.AssetGroupName}}" )],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")],fill: highlightBlue),
    table.cell(align(center)[#text("{{ .AssetExposure}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Dividend}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}")],fill: highlightBlue),
    table.cell(align(center)[#text("{{ConvertToFormattedNumberPointer .XIRR}}")],fill: highlightBlue),
    table.cell(align(left)[#text("{{.BenchmarkName}}")],fill: highlightBlue),
    {{else}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.SecurityCategory}}" )] ),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(center)[#text("{{ .AssetExposure}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Dividend}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}")]),
    table.cell(align(center)[#text("{{ConvertToFormattedNumberPointer .XIRR}}")]),
    table.cell(align(left)[#text("{{.BenchmarkName}}")]),
    {{end}}
{{end}}

  )
{{end}}

