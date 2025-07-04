// Capital Gain/Loss Report
{{if .MututalFundTransSection}}
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Capital Gain/Loss Report", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
        #text(" ")
        #place(dy: -2pt)[#text("Statement Date From : "+ReportBeginDate+" and "+ReportEndDate,size: 14pt, fill: rgb("#585858"))]
        #place(dy: 14pt,dx:-10pt,[#line(length: 100%,stroke: 0.4pt + rgb("#cdcdcd"))])
      ],
       place(top+right,dx: -15pt,dy: 15pt,
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
#table(
    columns: (.7fr, 1.5fr, 1.5fr, .7fr, .7fr, .7fr, .7fr, .7fr, .7fr),

    // Header
    table.header(
    table.cell(rowspan: 2, colspan: 11, align: left + horizon, [#text(fill: heading0,size: 15pt, weight: "bold", [ Portfolio Analysis Report])]),
    table.hline(stroke: rgb(gray)),

    // Column headers
    table.cell(align(left)[#text(fill: heading0, weight: "black", "Scheme")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Quantity")]),
    table.cell(align(center)[#text(fill: heading0, weight: "black", "Purchase Date")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Purchase Price")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Purchase Value")]),
    table.cell(align(center)[#text(fill: heading0, weight: "black", "Sale Date")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Sale Price")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Sale Value")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Days Held")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Short Term")]),
    table.cell(align(right)[#text(fill: heading0, weight: "black", "Long Term")]),
  ),
)
{{end}}
