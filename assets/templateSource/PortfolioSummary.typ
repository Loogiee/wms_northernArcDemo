{{$DataCount:=0}}
{{if .SubassetMarketCapTypeSection}}
{{$DataCount = 1}}
{{end}}

{{if .AssetSubassetSection}}
{{$DataCount = 1}}
{{end}}

{{if .SubassetMarketCapTypeSection}}
{{$DataCount = 1}}
{{end}}

{{if ne $DataCount 0 }}
// #pagebreak()
#pagebreak()
#hide[ #heading(outlined: true)[#text([Asset Class Summary],fill:rgb("#0d3c6a"))]]
#place(
    context {
      let outline_data = query(heading.where(level:2))
      for entry in outline_data {
        // entry
        if entry.body.text.contains("Asset Class Summary -"){
          link(
            entry.location(),
            [#text(weight: "bold", entry.body.text.split("- ").at(-1))            #entry.location().page() \
            ]
          )
        }
      }
    }
  )
{{end}}

#let heading0 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#9cccf8")
#set text(weight: "black")
{{if .AssetSubassetSection}}
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Asset Class Wise Summary", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
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
  #place()[== #text("Asset Class Summary - Asset Class Wise Summary")]
]
  #table(
    columns: (1.5fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, .5fr, 1.5fr),
    stroke: none,
    inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 9, align: left + horizon, [#text(fill: heading0,size: 20pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),

    // Column headers
    table.cell(align(left)[#text(fill: heading0,weight: "black", "Particulars")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Market Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black","% Holding")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Holding Cost")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Gain/Loss Realised")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Dividend Interest")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Gain/Loss Unrealised")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "IRR %")]),
    table.cell(align(left)[#text(fill: heading0,weight: "black", "Benchmark")]),
  ),
 {{range  .AssetSubassetSection}}
    {{if Contains .SecurityCategory "TOTAL"}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.AssetGroupName}}" )],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ .AssetExposure}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Dividend}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}")],fill: highlightBlue),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .XIRR}}")],fill: highlightBlue),
    table.cell(align(left)[#text("{{.BenchmarkName}}")],fill: highlightBlue),
    {{else}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.SecurityCategory}}" )] ),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("{{ .AssetExposure}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Dividend}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .XIRR}}")]),
    table.cell(align(left)[#text("{{.BenchmarkName}}")]),
    {{end}}
  {{end}}

  )
{{end}}

{{if .SubassetMarketCapTypeSection}}
  #pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Product Wise Exposure - Advisors / Distributors", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
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
  #place()[== #text("Asset Class Summary - Product wise Exposure")]
]
  #table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: none,
    inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 8, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell(align(left)[#text(fill: heading0,weight: "black", "Asset Class")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Purchase Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black","Market Value")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Unrealised Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Dividend Interest")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Realised Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "IRR %")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Exposure %")]),
  ),
 {{$ShowOnce := true}}

  {{range  .SubassetMarketCapTypeSection}}
    {{if Contains .AssetGroupName "TOTAL"}}
       {{$ShowOnce = true}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Total" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .DistributedIncome}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{.XIRR}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{.AssetExposure}}" ,fill: heading0)],),
    {{else}}
      {{if $ShowOnce}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 8, align(left)[#text("{{.SecurityCategory}}" )],fill: highlightBlue ),
      {{$ShowOnce = false}}
      {{end}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("{{.GroupLabel}}" )] ),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .DistributedIncome}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}" )],),
      table.cell(align(right)[#text("{{.XIRR}}" )],),
      table.cell(align(right)[#text("{{.AssetExposure}}" )],),
    {{end}}
  {{end}}
  )
{{end}}
{{if .SubAssetSection}}
    #pagebreak()
    #let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Sub Asset Class Wise Exposure - Advisors / Distributors", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
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
  #place()[== #text("Asset Class Summary - Sub Asset Class wise Summary")]
]
  #table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: none,
   inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 8, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),
    // Column headers
    table.cell(align(left)[#text(fill: heading0,weight: "black", "Asset Class")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Purchase Value")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Market Value")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Unrealised Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Income")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Realised Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "IRR%")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Exposure %")]),
  ),
 {{$ShowOnce := true}}
  {{range  .SubAssetSection}}
    {{if Contains .AssetGroupName "TOTAL"}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
       {{$ShowOnce = true}}
      table.cell(align(left)[#text("Total" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}" ,fill: heading0)],),
      table.cell(align(right)[#text("-" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{.XIRR}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{.AssetExposure}}" ,fill: heading0)],),
    {{else}}
      {{if $ShowOnce}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 8, align(left)[#text("{{.SecurityCategory}}" )],fill: highlightBlue ),
      {{$ShowOnce = false}}
      {{end}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("{{.GroupLabel}}" )] ),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}" )],),
      table.cell(align(right)[#text("-" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}" )],),
      table.cell(align(right)[#text("{{.XIRR}}" )],),
      table.cell(align(right)[#text("{{.AssetExposure}}" )],),
    {{end}}
  {{end}}
  )
{{end}}

