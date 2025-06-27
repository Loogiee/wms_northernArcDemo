#pagebreak()
  #let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
       #text("Mutual Funds - Investment Summar", size: 16pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
      #text("as on "+ReportDate,size: 8pt, fill: rgb("#585858"))
       #place(dy: 8pt,dx:-10pt,[#line(length: 100%,stroke: 0.4pt + rgb("#cdcdcd"))])
      ],
       place(top+right,dx: -15pt,dy: 10pt,
          [#image("./assets/images/kfintech-logo.png", width: 155pt,height: 30pt)]),
      place(dy: -10pt,[#line(length: 100%,stroke: 0.5pt + rgb("#cdcdcd"))])
)
)
{{$DataCount:=0}}

{{if .MututalFundHoldingSection}}
{{$DataCount = 1}}
{{end}}

#set page(paper: "a4", flipped: true,
margin: (top:45pt,left:15pt,right:15pt),
header: context{
  if counter(page).get().first() >= 1 {
    align(top)[#customHeader]
  }
})
{{if ne $DataCount  0}}

#set table(
  stroke: none,
inset: (top: 10pt, left: 10pt, right: 10pt, bottom: 10pt),
)
#table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr,1fr,1fr,1fr),

    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 10, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell([#text(fill: heading0, weight: "black", "Name")]),
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Folio Number")]),
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Units")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Purchase Value")]),
    table.cell(align(center)[#text(fill: heading0, weight: "black", "Inception Date")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Unrealized Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Market Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Absolute Return")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "XIRR %")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Life Days")]),
  ),
  {{$ShowOnce := true}}
{{range  .MututalFundHoldingSection}}
   {{if Contains .SecurityName "TOTAL"}}
    {{$ShowOnce = true}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("Total",fill :heading0)]),
    table.cell(align(left)[#text("{{.FolioNo}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Quantity}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}",fill :heading0)]),
    table.cell(align(center)[#text("{{.PurchaseDate}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .XIRR}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .HoldingDays}}",fill :heading0)]),
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
    table.cell(align(center)[#text("{{.PurchaseDate}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .XIRR}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .HoldingDays}}")]),
  {{end}}
{{end}}
)

{{end}}