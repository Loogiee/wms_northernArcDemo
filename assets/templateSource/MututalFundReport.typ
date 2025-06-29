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
#place(
    context {
      let outline_data = query(heading.where(level:2))
      for entry in outline_data {
        // entry
        if entry.body.text.contains("Mutual Fund Analysis -"){
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
    table.cell(align(left)[#text("Total",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AcquisitionCost}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .Appreciation}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .XIRR}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AssetExposure}}",fill :heading0)]),
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
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .XIRR}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .AssetExposure}}")]),
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
    columns: (2fr, 1fr, 1fr, 1fr),

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
   {{if Contains .FundManagerName "TOTAL"}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Total",fill :heading0)]),
    table.cell(align(left)[#text("{{.IssuerName}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .TotAssetExposure}}",fill :heading0)]),
  {{else}}
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.FundManagerName}}")]),
    table.cell(align(left)[#text("{{.IssuerName}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .TotAssetExposure}}")]),
  {{end}}
{{end}}
)
{{end}}


// Mutual Fund - Sector Wise Exposure
{{if .SectorWiseSection}}
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Mutual Fund - Sector Wise Exposurer", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
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
   {{if Contains .SectorName "TOTAL"}}
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Total",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}",fill :heading0)]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .TotAssetExposure}}",fill :heading0)]),
  {{else}}
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("{{.SectorName}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .MarketValue}}")]),
    table.cell(align(right)[#text("{{ConvertToFormattedNumberPointer .TotAssetExposure}}")]),
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
