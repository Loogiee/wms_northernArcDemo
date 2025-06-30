package templateProcesser

var DisclaimerText = `
#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Client Portfolio Statement", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
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


#box(
  fill: rgb("#f4f5f6"),

  width: 98%,
  height: 100pt,
  stroke: none,
  radius: (
    left: 0pt,
    top-right: 100pt,
    top-left: 100pt,
    bottom-right: 0pt,
    bottom-left: 0pt,
  ),
)


#place(top + left, dx: 30pt, dy: 40pt)[
  #text([Disclaimer], size: 40pt, fill: rgb("#0d3c6a"), weight: "extrabold")]

#v(-14pt)


#set par(justify: true)
#box(
  fill: rgb("fff"),
  inset: (top :24pt,bottom:35pt,left:20pt,right:20pt)
)[#text(weight: "medium",
      size: 20pt,
      [This statement is for the exclusive and confidential use of the addressee only. Any is distribution, use or reproduction of this report without prior written permission of Kfintech Limited ("Kfintech") is unauthorised
        and strictly prohibited. Kfintech shall not be liable for any delay in receipt of this report.
        \
        \
        Kfintech Limited is only a distributor of third party investment products and not an advisor in offering investment advice and any information contained in this report or otherwise communicated shall not be
        construed as investment advice. All decisions to purchase or sell units/securities shall be on the basis of the personal judgement of the customer arrived at after due consideration and after understanding the risk
        factors associated with them. Kfintech does not in any manner guarantee any returns on any investment products.
        \
        \
        This report is for information purposes only. Although the information herein has been obtained from sources believed to be reliable by Kfintech Technologies Public Limited: Kfintech, does not guarantee, represent
        or warrant its accuracy, completeness or fairness. While effort was made to ensure the accuracy of information indicated in this report, neither Kfintech nor any of its afiliates, of cers, directors or employees shall
        in anyway be accountable, liable or responsible for any inaccuracy, omission, incompleteness or errors in the contents hereof.
        \
        \
        Kfintech disclaims all liability in relation to use of data or information used in this report which is sourced from third parties. The prices, value, income and appreciation of the securities mentioned in this
        statement are based on current market conditions as of the Statement Date mentioned herein and are subject to change without prior notice.
        \
        \
        Investments in securities are subject to risk including but not limited the risk of loss of the initial principal amount invested. Past performance is not indicative of future results. Please note the calculations shown
        in this report are purely indicative and are based on applicable tax laws. The client is solely responsible for consulting his/her/its own independent advisors as to the legal, tax, accounting and related matters
        concerning investments and nothing in this document or in any communication shall constitute such legal, tax or accounting advice.
        \
        \
        In case of any deviation from your Risk Pro le, you are requested to review your portfolio and take relevant action on the same.
        \
        \
        Please notify us immediately and in any case within 7 (seven) days of the Statement Date if you notice any error or discrepancy in the entries in this report otherwise the same will be considered correct.
        \
        \
        Portfolio details of Held away assets have been aggregated based on information provided by the client. The accuracy, authenticity of the data including prices, maturity details and performance cannot be
        ascertained by Kfintech and the responsibility to provide correct information on such assets and to make it meaningful solely lies with the Client/Investor. The Client/Investor is responsible for updating the
        information on a regular basis including reporting every such transaction. Kfintech takes no responsibility for authentication of any such data provided by the Client.
        \
        \
        Please note that the new entity name has been of cially updated with the Registrar of Companies (ROC). However, it is important to note that we are currently in the process of seeking approval from the
        regulators. Therefore, any mentions of the updated name should be interpreted within this ongoing regulatory context.]
    ))]
`
