// {{$DataCount:=0}}
// #let a =(
// {{if .MututalFundHoldingSection}}
// "Mutual Funds - Investment Summar",
// {{$DataCount = 1}}
// {{end}}
// {{if .PmsHoldingSection}}
// "PMS - Investment Summary",
// {{$DataCount =1}}
// {{end}}
// {{if .DirectEquHoldingSection}}
// "Direct Equity Holding - Advisor Wise",
// {{$DataCount =1}}
// {{end}}
// )

// {{if ne $DataCount  0}}
{{if .MututalFundHoldingSection}}
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Mutual Funds - Investment Summary", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
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
#set table(
  stroke: none,
inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
)
 #hide[
  #place()[== #text("Asset Class Summary - MF Investment Summary")]
]
#table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1.3fr, 1fr,1fr,.5fr,1fr),

    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 10, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading0, weight: "black", "Name")]),
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Folio Number")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Units")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Purchase Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Market Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Unrealized Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Absolute Return")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "XIRR %")]),
    table.cell(align(center)[#text(fill: heading0, weight: "black", "Inception Date")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Life Days")]),
  ),
  {{$ShowOnce := true}}
{{range  .MututalFundHoldingSection}}
   {{if Contains .SecurityName "TOTAL"}}
    {{$ShowOnce = true}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    {{$TotalLable:="Sub Total"}}
      {{if Contains .SecurityName "GRAND_TOTAL"}}{{$TotalLable ="Grand Total"}}{{end}}
    table.cell([#text("{{$TotalLable}}",fill :heading0)]),
    table.cell(align(left)[#text("{{.FolioNo}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Quantity}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}",fill :heading0)]),
    table.cell(align(center)[#text("{{.PurchaseDate}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberWithoutDecimalPointer .HoldingDays}}",fill :heading0)]),
  {{else}}
  {{if $ShowOnce}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 10, align(left)[#text("{{.GroupLabel}}" )],fill: highlightBlue ),
      {{$ShowOnce = false}}
      {{end}}
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("{{.SecurityName}}")]),
    table.cell(align(left)[#text("{{.FolioNo}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Quantity}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}")]),
    table.cell(align(center)[#text("{{.PurchaseDate}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberWithoutDecimalPointer .HoldingDays}}")]),
  {{end}}
{{end}}
)
{{end}}
{{if .PmsHoldingSection}}
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("PMS - Investment Summary", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
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
  #place()[== #text("Asset Class Summary - PMS Investment Summary")]
]
#table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr,1fr),

    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 8, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading0, weight: "black", "Provider name")]),
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Folio Number")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Inflow")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Outflow")]),
    table.cell(align(center)[#text(fill: heading0, weight: "black", "Market Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Market Value date")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "XIRR %")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Asset Exposure %")]),
  ),
{{range  .PmsHoldingSection}}
   {{if Contains .SecurityName "TOTAL"}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    {{$TotalLable:="Sub Total"}}
      {{if Contains .SecurityName "GRAND_TOTAL"}}{{$TotalLable ="Grand Total"}}{{end}}
    table.cell([#text("{{$TotalLable}}",fill :heading0)]),
    table.cell(align(left)[#text("{{.FolioNo}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Inflow}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Outflow}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill :heading0)]),
    table.cell(align(right)[#text("",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposure}}",fill :heading0)]),
  {{else}}
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("{{.SecurityName}}")]),
    table.cell(align(left)[#text("{{.FolioNo}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Inflow}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Outflow}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposure}}")]),
  {{end}}
{{end}}
)
{{end}}
{{if .DirectEquHoldingSection}}
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Direct Equity Holding - Advisor Wise", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
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
  #place()[== #text("Asset Class Summary - Direct Equity Holding Advisor Wise")]
]
#table(
    columns: (1.5fr, .7fr, .7fr, 1fr, 1fr, .7fr, .7fr,.7fr,1.2fr,1fr,1fr),

    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 11, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading0, weight: "black", "Name")]),
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Code")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "No. of shares")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Purchase Price")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Purchase Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Dividend")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Market Price")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Market Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Unrealized Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Gain/Loss %")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Asset Exposure %")]),
  ),
{{range  .DirectEquHoldingSection}}
   {{if Contains .SecurityName "TOTAL"}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    {{$TotalLable:="Sub Total"}}
      {{if Contains .SecurityName "GRAND_TOTAL"}}{{$TotalLable ="Grand Total"}}{{end}}
    table.cell([#text("{{$TotalLable}}",fill :heading0)]),
    table.cell(align(left)[#text("{{.ISIN}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Quantity}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AveragePrice}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquCost}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Dividend}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketPrice}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AppreDepre}}",fill :heading0)]),
     table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AbsoluteReturn}}",fill :heading0)]),
      table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposurePct}}",fill :heading0)]),
  {{else}}
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("{{.SecurityName}}")]),
    table.cell(align(left)[#text("{{.ISIN}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Quantity}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AveragePrice}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquCost}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Dividend}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketPrice}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AppreDepre}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AbsoluteReturn}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposurePct}}")]),
  {{end}}
{{end}}
)
{{end}}
// {{end}}