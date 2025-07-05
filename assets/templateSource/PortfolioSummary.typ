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
// #pagebreak()

#set page(paper: "a2", flipped: true,
margin: (top:80pt,left:15pt,right:15pt),
header: none)
// #place(
//     context {
//       let outline_data = query(heading.where(level:2))
//       for entry in outline_data {
//         // entry
//         if entry.body.text.contains("Asset Class Summary -"){
//           link(
//             entry.location(),
//             [#text(weight: "bold", entry.body.text.split("- ").at(-1))            #entry.location().page() \
//             ]
//           )
//         }
//       }
//     }
//   )
#hide[ #heading(outlined: true)[#text([Asset Class Summary],fill:rgb("#0d3c6a"))]]
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
          "Asset Class\n  Summary",
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
        if entry.body.text.contains("Asset Class Summary -"){
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

#let heading0 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#9cccf8")
#set text(weight: "black")

// Asset Class Wise Summary
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
          [#image("./assets/images/Client_logo.png", width: 250pt,height: 40pt, fit: "contain")])
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
    columns: (1.5fr, 1fr, .7fr, 1fr, 1.2fr, 1fr, 1.2fr, .5fr,.6fr, 1.5fr),
    stroke: none,
    inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 10, align: left + horizon, [#text(fill: heading0,size: 20pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),

    // Column headers
    table.cell(align(left)[#text(fill: heading0,weight: "black", "Particulars")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Market Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black","% Holding")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Holding Cost")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Realised Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Dividend Interest")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Gain/Loss Unrealised")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "IRR %")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "BMIRR %")]),
    table.cell(align(left)[#text(fill: heading0,weight: "black", "Benchmark")]),
  ),
{{$ShowOnce := true}}
 {{range  .AssetSubassetSection}}
    {{if Contains .SecurityCategory "TOTAL"}}
    {{$ShowOnce = true}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    {{$TotalLable:="Sub Total"}}
    {{if Contains .SecurityCategory "GRAND TOTAL"}}{{$TotalLable ="Grand Total"}}{{end}}
    table.cell(align(left)[#text("{{$TotalLable}}",fill: heading0)],),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill:heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposure}}",fill:heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}",fill:heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}",fill:heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Dividend}}",fill:heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}",fill:heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}",fill:heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .BMXIRR}}",fill:heading0)]),
    table.cell(align(left)[#text("{{.BenchmarkName}}",fill:heading0)]),
    {{else}}
    {{if $ShowOnce}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(colspan: 10, align(left)[#text("{{.AssetGroupName}}" )],fill: highlightBlue),
    {{$ShowOnce = false}}
    {{end}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.SecurityCategory}}" )] ),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposure}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Dividend}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .BMXIRR}}")]),
    table.cell(align(left)[#text("{{.BenchmarkName}}")]),
    {{end}}
  {{end}}

  )
{{end}}

// Product Wise Exposure - Advisors / Distributors
{{if .SubAssetSection}}
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
          [#image("./assets/images/Client_logo.png", width: 250pt,height: 40pt, fit: "contain")])

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
  #place()[== #text("Asset Class Summary - Product Wise Exposure")]
]
  #table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: none,
   inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 9, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
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
      {{$TotalLable:="Sub Total"}}
      {{if Contains .SecurityCategory "GRAND TOTAL"}}{{$TotalLable ="Grand Total"}}{{end}}
      table.cell(align(left)[#text("{{$TotalLable}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}" ,fill: heading0)],),
      table.cell(align(right)[#text("-" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposure}}" ,fill: heading0)],),
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
      table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposure}}" )],),
    {{end}}
  {{end}}
  )
{{end}}

// // Sub Asset Class Wise Exposure - Advisors / Distributors
{{if .SubassetMarketCapTypeSection}}
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
          [#image("./assets/images/Client_logo.png", width: 250pt,height: 40pt, fit: "contain")])

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
    columns: (2fr, 1fr, 1fr, 1.3fr, 1fr, 1fr, .5fr,.5fr, .7fr),
    stroke: none,
    inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 9, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell(align(left)[#text(fill: heading0,weight: "black", "Asset Class")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Purchase Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black","Market Value")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Unrealised Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Dividend Interest")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Realised Gain/Loss")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "IRR %")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "BMIRR %")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Exposure %")]),
  ),
 {{$ShowOnce := true}}

  {{range  .SubassetMarketCapTypeSection}}
    {{if Contains .AssetGroupName "TOTAL"}}
       {{$ShowOnce = true}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      {{$TotalLable:="Sub Total"}}
      {{if Contains .SecurityCategory "GRAND TOTAL"}}{{$TotalLable ="Grand Total"}}{{end}}
      table.cell(align(left)[#text("{{$TotalLable}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .DistributedIncome}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .BMXIRR}}" ,fill: heading0)],),
      table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposure}}" ,fill: heading0)],),
    {{else}}
      {{if $ShowOnce}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 9, align(left)[#text("{{.SecurityCategory}}" )],fill: highlightBlue ),
      {{$ShowOnce = false}}
      {{end}}
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("{{.GroupLabel}}" )] ),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .DistributedIncome}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .RealGainLoss}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .BMXIRR}}" )],),
      table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AssetExposure}}" )],),
    {{end}}
  {{end}}
  )
{{end}}

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
          [#image("./assets/images/Client_logo.png", width: 250pt,height: 40pt, fit: "contain")])

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
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1.3fr, 1fr,1fr,1fr,1fr),

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
 {{$RequredDateFormat :="02 Jan 2006"}}
{{range  .MututalFundHoldingSection}}
   {{if Contains .SecurityName "TOTAL"}}
    {{$ShowOnce = true}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    {{$TotalLable:="Sub Total"}}
      {{if Contains .SecurityName "GRAND TOTAL"}}{{$TotalLable ="Grand Total"}}{{end}}
    table.cell([#text("{{$TotalLable}}",fill :heading0)]),
    table.cell(align(left)[#text("{{.FolioNo}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumber4Pointer .Quantity}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AbsoluteReturn}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}",fill :heading0)]),
    table.cell(align(center)[#text("-",fill :heading0)]),
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
    table.cell(align(right)[#text("{{ConvertToFormattedNumber4Pointer .Quantity}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .AbsoluteReturn}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedPercentagePointer .XIRR}}")]),
    table.cell(align(center)[#text("{{DateFormatter .PurchaseDate $RequredDateFormat}}")]),
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
          [#image("./assets/images/Client_logo.png", width: 250pt,height: 40pt, fit: "contain")])

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
      {{if Contains .SecurityName "GRAND TOTAL"}}{{$TotalLable ="Grand Total"}}{{end}}
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
          [#image("./assets/images/Client_logo.png", width: 250pt,height: 40pt, fit: "contain")])

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
      {{if Contains .SecurityName "GRAND TOTAL"}}{{$TotalLable ="Grand Total"}}{{end}}
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