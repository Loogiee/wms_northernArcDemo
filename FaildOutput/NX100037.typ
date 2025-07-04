#import "@preview/echarm:0.2.0"
// Define colors and data

#let primaryColors = (
  "#1e90ff",
  "#0ecb81",
  "#f79009",
  "#f14366",
  "#73c0de",
  "#EA342C",
  "#FE9900",
  "#060270",
  "#E3a2",
  "#aEF702",
  "#ec02",
  "#702"
)
#let customFooter = box(width: 100%, height: 30pt,  align(center + bottom)[
  #place(dy: -20pt,[#line(length: 100%,stroke: 0.5pt + rgb("#cdcdcd"))])

  #place(dx: .5%)[
    #text("Report is at : ", size: 20pt, weight: "medium", fill: blue)
    #text("Investor Level", size: 20pt, weight: "medium", fill: black)
  ]
    #place(dx: 30%)[
    #text("Customer Name : ", size: 20pt, weight: "medium", fill: blue)
    #text("BIBI RANI NANGIA", size: 20pt, weight: "medium", fill: black)
  ]
  #place(dx: 65%)[
    #text("RM Name : ", size: 20pt, weight: "medium", fill: blue)
    #text("Abhishek Puri", size: 20pt, weight: "medium", fill: black)
  ]
  #place(dx: 98%)[
    #text(
      context {
        let pageNum = counter(page).get().first()
        if pageNum < 10 {
          "0" + str(pageNum)
        } else {
          pageNum
        }
      },
      size: 21pt,
      weight: "medium",
      fill: blue,
    )
  ]
])
#set text(size: 16pt, font: "Bai Jamjuree",weight: "bold")
#set page(
  paper: "a2",
  flipped: true,
  fill: rgb("#fbfbfb"),
  margin: (
    top: 50pt,
    left: 35pt,
    right: 20pt,
    bottom: 70pt,
  ),
  footer: context {
    if counter(page).get().first() > 1 {
      align(bottom)[#customFooter]
    }
  },
)
// #set outline.entry(fill: none)
#let pageNumber = context {
  counter(page).display()
}

#let ReportDate = "19 Mar 2025"
#let ReportBeginDate = "30 Sep 2020"
#let ReportEndDate = "19 Mar 2025"
#let ReportPeriod = "04 Jul 2025"
// #place(dx: 1100pt, dy: -50pt)[
//   #image("./assets/images/bg design2.jpg", width: 100%, height: 100%)
// ]
#place(top + right, dx: -90pt)[
  #image("./assets/images/Client_logo.png", width: 300pt)
]
#place(bottom + left, dx: -40pt, dy: -100pt)[
  #image("./assets/images/design.png", width: 480pt)
]


#place(bottom + right, dx: -140pt, dy: -100pt)[
  #image("./assets/images/bgdesign.jpg", width: 1050pt, height: 370pt)
]

#place(
  dx: 1050pt,
  dy: 450pt,
)[
  #box(width: 500pt, height: 400pt, fill: rgb("#EEF1F0"))[
    #place(
      dx: 100pt,
      dy: 60pt,
      //  index box code
      context {
        let outline_data = query(heading.where(level: 1))
        for entry in outline_data {
          link(entry.location(), [
            #box(width: 80%, text(weight: "bold", size: 20pt, fill: rgb("#005397"), entry.body))
            #v(10pt)
          ])
        }
      },
    )

  ]


  #place(top + right, dx: -440pt, dy: 50pt, line(
    stroke: 2pt + rgb("#2F75B5"),
    start: (0pt, 0pt),
    end: (0pt, 330pt),
  ))
  #place(top + right, dx: -437pt, dy: 50pt, box(fill: rgb("#0090F3"), width: 6pt, height: 25pt))
  #place(
    bottom + right,
    dy: -320pt,
    dx: -20pt,
  )[
    #box(fill: rgb("#005397"), stroke: none, width: 50pt, height: 80pt, radius: (
      left: 0pt,
      right: 0pt,
      bottom-right: 100pt,
      bottom-left: 00pt,
    ))[


      #pad(
        left: 0% + 0pt,
        top: 0% + 0pt,
        right: 0% + 10pt,
        bottom: 0% + 50pt,
      )[
        #text(weight: "bold", "Index", fill: white)
      ]
    ]
  ]
]





#show heading: it => place(text(weight: "bold", fill: red, size: 0pt, it.body))

#place(
  dx: 50pt,
  dy: 100pt,
)[
  #box()[

    #text(fill: rgb("#0B1A24"), weight: "bold",  size: 80pt, "PORTFOLIO")\
    \
    #text(fill: rgb("#248DDC"), weight: "bold",  size: 50pt, "ANALYSIS REPORT")\
    \
    #text(fill: rgb("#0B1A24"), weight: "bold",  size: 25pt, "BIBI RANI NANGIA / ")
    #text(fill: rgb("#D4567B"), weight: "bold",  size: 25pt, "NX100027")
  ]
]

#place(dx: 50pt,dy:0pt)[
  #place(
    top + left,

    dy: 350pt,
  )[
    #block()[
      #text("Report as on date", size: 20pt, weight: "bold",  fill: rgb("248DDC"))
      \
      \
      #text(ReportDate, size: 20pt, weight: "bold",  fill: black)
    ]
  ]
  #place(
    top + left,
    dx: 300pt,
    dy: 350pt,
  )[
    #block()[
      #text("Report Period", size: 20pt, weight: "bold", fill: rgb("248DDC"))\
      \
      #text(ReportBeginDate+ " - " +ReportEndDate, size: 20pt, weight: "bold",  fill: black)
    ]
  ]

  #place(
    top + left,
    dx: 630pt,
    dy: 350pt,
  )[
    #block()[
      #text("Print date", size: 20pt, weight: "bold",  fill: rgb("248DDC"))
      \
      \
      #text(ReportPeriod, size: 20pt, weight: "bold",  fill: black)
    ]
  ]

  #place(
    top + left,
    dy: 430pt,
  )[
    #block()[
      #text("Report is at", size: 20pt, weight: "bold",  fill: rgb("248DDC"))
      \
      \
      #text("PORTFOLIO", size: 25pt, weight: "bold",  fill: black)
    ]
  ]

]
#place(
  bottom + left,
  dx: 80pt,
  dy: 50pt,
)[
  #place(bottom + left, dx: -25pt, dy: -70pt, rect(width: 100%, stroke: none)[
    #set stack(spacing: 16pt)

    #stack(
      stack(spacing: 0.4cm, text("RM Name", weight: "bold", fill: rgb("248DDC"), size: 20pt)),
      block(width: 350pt)[
        #stack(block(width: 350pt)[
          #text("Abhishek Puri", fill: black, weight: "bold", size: 20pt)
        ])
      ],
    )
  ])



#place(bottom + left, dx: 510pt, dy: -70pt, rect(width: 100%, stroke: none)[
  #set stack(spacing: 16pt)
  #set text(hyphenate: true, lang: "en")

  #stack(
    block(width: 350pt, height: 30pt)[
   #text("Email", weight: "bold", fill: rgb("248DDC"), size: 20pt)
  ],
    block(width: 350pt)[
      #stack(
        block(width: 350pt)[
          #box(width: 350pt, clip: false)[
            #text("abhishek.puri@nexedge.capital".replace(".", ".").replace("@", "@"), fill: black, weight: "bold", size: 20pt)
          ]
        ]
      )
    ],
  )
])
  #place(bottom + left, dx: 1260pt, dy: -70pt, rect(width: 100%, stroke: none)[
    #set stack(spacing: 16pt)

    #stack(
      stack(spacing: 0.4cm, text("Phone Number", weight: "bold", fill: rgb("248DDC"), size: 20pt)),
      block(width: 350pt)[
        #stack(block(width: 350pt)[
          #text("8851555342", fill: black, weight: "bold", size: 20pt)
        ])
      ],
    )
  ])
]

// #pagebreak()


#show heading: it => place(text(weight: "bold",fill: red,size: 0pt,it.body))
// #show outline.entry: it => [
//   #link(
//     it.element.location(),
//     [
//       #text(weight: "bold", size: 3em,it.body)
//       #text(weight: "bold", size: 3em,it.page),
//     ]
//   )
// ]
// #place(
//   horizon+center,
//   dx:15em,
//   stack(
//     dir: ltr,
//     spacing: 2em,
//     outline(title: none,depth: 1)
//   )
// )#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Executive Summary", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
        #text(" ",size: 14pt, fill: rgb("#585858"))
        #place(dy: 8pt,dx:-10pt,[#line(length: 100%,stroke: 0.4pt + rgb("#cdcdcd"))])
      ],
       place(top+right,dx: -15pt,dy: 12pt,
          [#image("./assets/images/Client_logo.png", width: 250pt,height: 40pt, fit: "contain")])
)
)
#set page(paper: "a2", flipped: true,fill: rgb("#f4f5f6"),
margin: (top:80pt,left:15pt,right:15pt),
header: context{
  if counter(page).get().first() >= 1 {
    align(top)[#customHeader]
  }
})

#let headerBg = rgb("#f4f5f6")

// Page and header settings
#let NexedgeHeaderColor = "#353535"
#let headersize_xs = 18pt
#let titlePadding = (top: 15pt, bottom: 15pt, left: 20pt, right: 20pt)

#let smallCardList = (
  
  (
    description: "HOLDING COST",
    Value: "₹ 13,23,78,054",
    Date: "As on 19 Mar 2025",
    Colors :"#000",
    Image: "./assets/images/two.png"
  ),
  
  (
    description: "CURRENT VALUE",
    Value: "₹ 15,93,14,162",
    Date: "As on 19 Mar 2025",
    Colors :"#000",
    Image: "/assets/images/three.png"
  ),
  
  (
    description: "INFLOW MINUS OUTFLOW",
    Value: "₹ 13,23,62,307",
    Date: "Since Inception",
    Colors :"#000",
    Image: "./assets/images/one.png"
  ),
  
  (
    description: "PORTFOLIO RETURN(IRR)",
    Value: "10.74%",
    Date: "Since Inception",
    Colors :"#15ff00de",
    Image: "./assets/images/four.png"
  ),
  
  (
    description: "BENCHMARK RETURN(IRR)",
    Value: "9.05%",
    Date: "Since Inception",
    Colors :"#15ff00de",
    Image: "./assets/images/six.png"
  ),
  
  (
    description: "BenchmarkInfo_CRISIL Comp IDX",
    Value: "26.24%",
    Date: "",
    Colors :"#15ff00de",
    Image: "./assets/images/six.png"
  ),
  
  (
    description: "BenchmarkInfo_NIFTY 500",
    Value: "63.85%",
    Date: "",
    Colors :"#15ff00de",
    Image: "./assets/images/six.png"
  ),
  
)
#hide[
  #heading(outlined: true)[#text([Executive Summary], fill: rgb("#0d3c6a"))]
]
#place(top + left, dy: 20pt)[

  #let benchItems = smallCardList.filter(item => item.description.contains("BenchmarkInfo_"))
  // Fil'er for i'ems wi'hou' "BenchmarkInfo_" in descrip'ion
  #let nonBenchItems = smallCardList.filter(item => not item.description.contains("BenchmarkInfo_"))

  // Ensure we have a' leas' 5 non-benchmark i'ems for box1-box4 and box6
  #let nonBenchCount = nonBenchItems.len()
  #let boxesBeforeCombined = if nonBenchCount >= 4 { nonBenchItems.slice(0, 4) } else { nonBenchItems }
  #let boxesAfterCombined = if nonBenchCount > 4 { nonBenchItems.slice(4) } else { () }

  #grid(
    columns: 2,
    column-gutter: 10pt,
    row-gutter: 10pt,
    // Boxes 1-4 (firs' 4 non-benchmark i'ems or placeholders)
    ..boxesBeforeCombined.map(item => {
      box(
        inset: 15pt,
        width: 405pt,
        height: 155pt,
        radius: 8pt,
        stroke: (2.8pt + luma(88%)),
        fill: white,
      )[
        // Display descrip'ion
        #place(dx:310pt)[#image(item.Image, width: 50pt, height: 55pt)]
        #text(item.description, size: 20pt, weight: "extrabold")\
        // Display da'e
        #place(dy:-15pt)[#text(item.Date, size: 14pt, fill: rgb("#00000041"), weight: "extrabold", spacing: 2pt, baseline: -3pt)]
        // Display value
        #align(bottom, text(item.Value,fill:rgb(item.Colors), size: 25pt, spacing: 2pt, weight: "bold", stretch: 50%))
      ]
    }),
    // Add placeholders if fewer 'han 4 non-benchmark i'ems
    ..if nonBenchCount < 4 {
      range(4 - nonBenchCount).map(_ => box(width: 400pt, height: 155pt))
    } else { () },
    // Combined box for benchmark i'ems in 5'h posi'ion
    if benchItems.len() > 0 {
      box(
        inset: (y: 14pt, x: 10pt),
        width: 405pt,
        height: 155pt,
        radius: 8pt,
        stroke: (2.8pt + luma(88%)),
        fill: white,
      )[
        #grid(
          columns: 2,
          column-gutter: 180pt,
          inset: (left:8pt,right:10pt),
          // Ver'ical alignmen' for each column
          ..benchItems.map(item => {
            // Trunca'e "BenchmarkInfo_" from descrip'ion
            let displayDesc = item.description.replace("BenchmarkInfo_", "")
            box(height:126pt)[
              // Display 'runca'ed descrip'ion
              #align(bottom)[
              #text(displayDesc, size: 15pt, weight: "extrabold")
              // Display value below descrip'ion
             #text(item.Value, size: 25pt,fill:rgb(item.Colors), spacing: 2pt, weight: "bold")
            ]]
          })
        )
      ]
    } else {
      // Emp'y box if no benchmark i'ems
      box(width: 400pt, height: 155pt)
    },
    // Box 6 and onward (remaining non-benchmark i'ems)
    ..boxesAfterCombined.map(item => {
      box(
        inset: 15pt,
        width: 404pt,
        height: 155pt,
        radius: 8pt,
        stroke: (2.8pt + luma(88%)),
        fill: white,
      )[
        #place(dx:310pt)[#image(item.Image, width: 50pt, height: 55pt)]
        // Display descrip'ion
        #text(item.description, size: 20pt, weight: "extrabold")\
        // Display da'e
        #place(dy:-15pt)[#text(item.Date, size: 14pt, fill: rgb("#00000041"), weight: "extrabold", spacing: 2pt, baseline: -3pt)]
        // Display value
        #align(bottom, text(item.Value,fill:rgb(item.Colors), size: 25pt, spacing: 2pt, weight: "bold", stretch: 50%))
      ]
    })
  )
]

// Place donut chart on the right
#place(top + right,dy:17pt)[
  #box(
    inset: (y: 14pt, x: 10pt),
    width: 49.5%,
    height:46.7%,
    radius: 20pt,
    fill: white,
    stroke: (2.8pt + luma(88%)),
  )[
    // Chart titles
      #place(dx:20%, dy: 35%, text(weight: "extrabold", size: 22pt, "Current"))
    #place(dx:71%, dy: 35%, text(weight: "extrabold", size: 22pt, "Target"))

    #place(dx: 10pt, dy: -15pt, pad(..titlePadding, text(
      "Asset Allocation (%)",
      size: 30pt,
      fill: rgb("0e496e"),
      weight: "extrabold",
    )))
#let currentData = (
 
 
    
    ( value: 53.99,
      name: "Equities",
    ),
    
    ( value: 30.29,
      name: "Fixed Income",
    ),
    
    ( value: 15.73,
      name: "Liquid",
    ),
    
  

 

)

#let targetData = (
 
 

 
    
    ( value: 5,
      name: "Cash / Cash Equivalents",
    ),
    
    ( value: 5,
      name: "Commodity",
    ),
    
    ( value: 90,
      name: "Debt",
    ),
    
  

)
    // Main header
 #pad(left: 5pt,top: 40pt,
    // Grid for the two charts
    grid(
      columns: (1fr, 1fr),
      align: (center),
      // Current allocation chart
      box(
        width: 100%, height: 100%, stroke: none)[
           #place(dy:-10%,dx:10%)[
        #echarm.render(width: 80%, height:80%, options: (
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
            data: currentData
          ),
        )
      )]
      #place(
       dx: 0pt,
        dy: 250pt
      )[
  #grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  inset: (left:10pt,top:20pt,right:0pt,bottom:10pt),
  align: left,
  // Dynamically generate legend items
  ..currentData.enumerate().map(((i, item)) => {
    let value = str(item.value) + "%"
    let name = item.name
    stack(
      dir: ttb, // Stack vertically
      spacing: 5pt, // Space between color-value and name
      stack(
        dir: ltr, // Horizontal stack for color and value
        spacing: 15pt,
        rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(i))),
        text(value, size: 14pt)
      ),
      place(
        dx: 27pt, // Offset to align name under value (12pt for rect width + 15pt for spacing)
        text(name, size: 14pt)
      )
    )
  })
)
]
#place(dx:408pt,dy:0pt)[#line(length: 100%,angle: 90deg,stroke: (2.8pt + luma(88%)))]

      ],
      box(
         width: 100%, height: 100%, stroke: none,clip: true)[
          #place(dy:-10%,dx:10%)[
        #echarm.render(width: 80%, height: 80%, options: (
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
            data: targetData
          ),
        )
      )]
      #place(
     dx: 15pt,
        dy: 260pt
      )[
    #grid(
   columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  inset: (left:10pt,top:20pt,right:0pt,bottom:10pt),
  align: left,
  // Dynamically generate legend items
  ..targetData.enumerate().map(((i, item)) => {
    let value = str(item.value) + "%"
    let name = item.name
    stack(
      dir: ttb, // Stack vertically
      spacing: 5pt, // Space between color-value and name
      stack(
        dir: ltr, // Horizontal stack for color and value
        spacing: 15pt,
        rect(width: 12pt, height: 10pt, radius: 50%, fill: rgb(primaryColors.at(i))),
        text(value, size: 14pt)
      ),
      place(
        dx: 27pt, // Offset to align name under value (12pt for rect width + 15pt for spacing)
        text(name, size: 14pt)
      )
    )
  })
)
      ]
      ],


    )
  )


  ]
]
#place(bottom + left)[
#box(
    fill:white,
    inset: (y: 14pt, x: 10pt),
    width: 49.5%,
    height:49.5%,
    radius: 8pt,
    stroke: (2.8pt + luma(88%)),
  )[
    #place(dx: 0pt, dy: 0pt, pad(..titlePadding, text(
      " Relative Performance",
      size: 25pt,
      fill: rgb("0e496e"),
      weight: "extrabold",
    )))
    // Main header
    #set table(fill: (x, y) => if y == 0 {
      headerBg
    } else {
      rgb("#ffff")
    })

    #place(
      dx: 2pt,
      dy: 60pt,


      // Table with horizontal lines only
      table(
        //stroke: (x, y) => if y == 0 or y == 1 { (bottom: 1pt + black) } else { none },
        columns: (0.9fr, 1.2fr, 1.5fr, 1.2fr),
        inset: 25pt,
        align: center+horizon,
        stroke: none,

        // Table header with increased text size
        table.header(
          table.cell(align(right)[#text(fill: rgb("#0d3b6b"), weight: "black", " ")]),
          table.cell(align(right)[#text(fill: rgb("#0d3b6b"), weight: "black", "Portfolio Returns")]),
          table.cell(align(right)[#text(fill: rgb("#0d3b6b"), weight: "black", "Benchmark Returns")]),
          table.cell(align(right)[#text(fill: rgb("#0d3b6b"), weight: "black", "Excess Returns")]),
        ),
        
        table.cell(align(center)[#text("Mar 2024")]),
        table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("14.07"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("-1.31"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("15.38"+"%")]),
        
        table.cell(align(center)[#text("Jun 2024")]),
        table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("16.70"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("-0.53"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("17.23"+"%")]),
        
        table.cell(align(center)[#text("Sep 2024")]),
        table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("17.62"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("-0.43"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("18.05"+"%")]),
        
        table.cell(align(center)[#text("Dec 2024")]),
        table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("13.99"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("1.68"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("12.31"+"%")]),
        
      ),
    )
    // Grid for the two chart
    // Legend for the charts
  ]
]
#place(bottom + right)[
  #let jsonData = (

  (
    Date: "Mar 2024",
    allocations: (
      
      (asset_group_name: "Equities", value: 56.3),
      
      (asset_group_name: "Fixed Income", value: 43.7),
      
      (asset_group_name: "Liquid", value: 0),
      
    )
  ),
 
  (
    Date: "Jun 2024",
    allocations: (
      
      (asset_group_name: "Equities", value: 60.04),
      
      (asset_group_name: "Fixed Income", value: 39.96),
      
      (asset_group_name: "Liquid", value: 0),
      
    )
  ),
 
  (
    Date: "Sep 2024",
    allocations: (
      
      (asset_group_name: "Equities", value: 58.98),
      
      (asset_group_name: "Fixed Income", value: 34.03),
      
      (asset_group_name: "Liquid", value: 6.99),
      
    )
  ),
 
  (
    Date: "Dec 2024",
    allocations: (
      
      (asset_group_name: "Equities", value: 59.2),
      
      (asset_group_name: "Fixed Income", value: 31.09),
      
      (asset_group_name: "Liquid", value: 9.71),
      
    )
  ),
 
)

#box(width: 49.5%,height: 49.5%,radius: 20pt,fill: white,stroke: (2.8pt + luma(88%)))[
#place(dx: 15pt, dy:20pt, pad(..titlePadding, text(
    "Quarterly Asset Allocation Trends",
    size: 25pt,
    fill: rgb("0e496e"),
    weight: "extrabold",
  )))
  #place(dx:-50pt,dy:50pt)[
  #echarm.render(
  width: 100%,
  height: 450pt,
  options: (
    grid: (
      left: "10%",
      right: "5%",
      bottom: "25%", // Minimize space below x-axis
      containLabel: true,
      // top: "1%",
    ),
    xAxis: (
      type: "value",
      min: 0,
      max: 100, // Assuming percentages
      interval: 10, // Set ticks at 0, 10, 20, ..., 100
      axisLine: (
        "show": false,
      ),
      axisLabel: (
        fontWeight:"bold",
        // fontSize: 20, // Smaller font size for labels
        margin: 4, // Reduce label margin
      ),
      axisTick: (
        "show": false // Hide ticks to save space
      ),
      splitLine: (
        "show": false // Hide grid lines for cleaner look
      ),
    ),
   yAxis: (
      type: "category",
      data: jsonData.map(item => item.Date),
      inverse:true,
      axisLine: (
        "show": false,
      ),
      axisTick: (
        "show": false
      ),
      axisLabel: (
        fontWeight:"bold",
        // fontSize: 18,
        margin: 5
      ),
    ),
    series: {
      // Get unique asset_group_name values from the first allocations array
      let assetGroups = jsonData.at(0).allocations.map(a => a.asset_group_name)
      // Generate series dynamically
      assetGroups.enumerate().map(((index, name)) => (
        name: name,
        type: "bar",
        stack: "assetStack",
        data: jsonData.map(item => item.allocations.at(index).value),
        color: primaryColors.at(index)
      ))
    },
    legend: (
      "show": true,
      top: "80%",
      left: "center",
      right: "center",
       icon: "circle"

    ),
    tooltip: (
      trigger: "axis",
     axisPointer: (
        type: "shadow"
      )
    )
  )
)]
]
]#pagebreak()
#let customHeader =box(
      width: 100%,
      height: 30pt,
      stack(
     place(dx: 10pt,dy: 15pt)[
        #text("Portfolio Allocation", size: 38pt, fill: rgb("#0d3c6a"), weight: "extrabold")\
        #text(" ",size: 14pt, fill: rgb("#585858"))
        #place(dy: 8pt,dx:-10pt,[#line(length: 100%,stroke: 0.4pt + rgb("#cdcdcd"))])
      ],
       place(top+right,dx: -15pt,dy: 12pt,
          [#image("./assets/images/Client_logo.png", width: 250pt,height: 40pt, fit: "contain")])
)
)
#set page(paper: "a2", flipped: true,fill: rgb("#f4f5f6"),
margin: (top:80pt,left:15pt,right:15pt),
header: context{
  if counter(page).get().first() >= 1 {
    align(top)[#customHeader]
  }
})
#hide[
  #heading(outlined: true)[#text([Portfolio Allocation], fill: rgb("#0d3c6a"))]
]


#let currentData1 = (

  ( value: 0,
     name: "Equities",
     total: 0
  ),

  ( value: 0,
     name: "Fixed Income",
     total: 0
  ),

  ( value: 0,
     name: "Liquid",
     total: 0
  ),

)

#let currentData2 = (

  ( value: 53.99,
     name: "Equities",
     total: 8.601036867e+07
  ),

  ( value: 30.29,
     name: "Fixed Income",
     total: 4.825008826e+07
  ),

  ( value: 15.73,
     name: "Liquid",
     total: 2.505370467e+07
  ),

)

#place(dx:408pt,dy:266pt)[#line(length: 45%,angle: 90deg,stroke: (2.8pt + luma(88%)))]
#place(top+left,dy: 10pt)[
  #box(
    fill:white,
    inset: (top: 30pt, left: 20pt, right: 20pt, bottom: 30pt),
    width: 49.5%,
    height:100%,
    radius: 20pt,
    stroke: (2.8pt + luma(88%))
  )[
      #place(dx: 130pt, dy: 210pt, text(weight: "extrabold", size: 15pt, "Beginning Allocation"))
      #place(dx: 150pt, dy: 230pt, text(weight: "extrabold", size: 15pt,  ReportBeginDate))

      #place(dx: 530pt, dy: 210pt, text(weight: "extrabold", size: 15pt, "Ending Allocation"))
      #place(dx: 540pt, dy: 230pt, text(weight: "extrabold", size: 15pt,  ReportEndDate))

      #text("Portfolio Allocation by  Asset Class", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")
    // Main header
        #pad(left: 5pt,top: -150pt,
    // Grid for the two charts
    grid(
      columns: (1fr, 1fr),
      align: (center),
      // Current allocation chart
      box(
        width: 120%, height: 70%, stroke: none)[
        #echarm.render(width: 80%, height:80%, options: (
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
      #place(
       dx: 30pt,
        dy: -190pt  // Adjust this value to move the legend below the chart
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

      ],
      box(
         width: 120%, height: 70%, stroke: none)[
        #echarm.render(width: 80%, height: 80%, options: (
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
      )
      #place(
      dx: 50pt,  dy: -165pt
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
      ],


    )
  )
#place(dy: -138pt)[


#set table(stroke: stroke(thickness:01pt,paint: rgb("#cdcdcd")))

  #box(width:100%,stroke: stroke(thickness:01pt,paint: rgb("#cdcdcd")),radius: 20pt,clip: true)[
 #table(
    columns: (1.5fr,1fr,.7fr,1fr,.7fr),
    stroke: none,
    align: center+horizon,
    inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
    table.header(
    table.cell(fill:rgb("#ebebeb"),rowspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold", "Product Type")),
    table.vline(start: 0,end: 2,stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Beginning Value")),
    table.cell(fill:rgb("#ebebeb"),colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Ending Value")),
    table.hline(stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Amount (₹)")]),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "%")]),
    table.vline(start: 0,end: 2,stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Amount (₹)")]),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "%")]),
  ),
  
    table.cell(align(left)[#text(size: 18pt, "Equities")]),
    table.cell(align(right)[#text(size: 18pt, "0")]),
    table.cell(align(right)[#text(size: 18pt, "0"+"%")]),
    table.cell(align(right)[#text(size: 18pt, "8,60,10,369")]),
    table.cell(align(right)[#text(size: 18pt, "53.99"+"%")]),
    table.hline(stroke: rgb("#cdcdcd")),

    table.cell(align(left)[#text(size: 18pt, "Fixed Income")]),
    table.cell(align(right)[#text(size: 18pt, "0")]),
    table.cell(align(right)[#text(size: 18pt, "0"+"%")]),
    table.cell(align(right)[#text(size: 18pt, "4,82,50,088")]),
    table.cell(align(right)[#text(size: 18pt, "30.29"+"%")]),
    table.hline(stroke: rgb("#cdcdcd")),

    table.cell(align(left)[#text(size: 18pt, "Liquid")]),
    table.cell(align(right)[#text(size: 18pt, "0")]),
    table.cell(align(right)[#text(size: 18pt, "0"+"%")]),
    table.cell(align(right)[#text(size: 18pt, "2,50,53,705")]),
    table.cell(align(right)[#text(size: 18pt, "15.73"+"%")]),
    table.hline(stroke: rgb("#cdcdcd")),


  )]
  ]
]
]
#place(dx:408pt,dy:100pt)[#line(length: 45%,angle: 90deg,stroke: (2.8pt + luma(88%)))]

#place(top+right,dy: 10pt)[
 #box(
  fill:white,
  inset: (left:20pt,right:20pt,top:40pt),
    width: 49.5%,
    height: 100%,
    radius: 20pt,
    stroke: (2.8pt + luma(88%))
  )[
#place(dx: 10pt, dy: -15pt,pad(..titlePadding, text("Portfolio Breakup by Product Type", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")))
#place(top+left, dy: 20pt, dx: 0pt)[
  // Simulate the data structure from the template

  #let portBrkupdata = (
                (SecurityCategory: "Arbitrage Funds", StartExposure: 0/1000000, EndExposure: 2.505370467e+07/1000000),
              
                (SecurityCategory: "Mutual Funds/ETFs", StartExposure: 0/1000000, EndExposure: 1.3426045693e+08/1000000),
              )

#place(dx:460pt,dy: 30pt)[
  #table(
    stroke: none,
    columns: (.1fr,.3fr,.1fr,1.6fr),
    table.cell(align(right+horizon)[#circle(fill: rgb(primaryColors.at(1)),radius: .4em)]),
    table.cell(align(left+horizon)[#text("Beginning Value",size: .8em)]),
    table.cell(align(right+horizon)[#circle(fill: rgb(primaryColors.at(0)),radius: .4em)]),
    table.cell(align(left+horizon)[#text("Ending Value",size: .8em)]),

  )
]
#place(dy:40pt,dx:-40pt)[
#let wrapped_name =(name)=> {if name.len() > 10 {
        let words = name.split(" ")
        let mid = calc.floor(words.len() / 2)
        words.slice(0, mid).join(" ") + "\n" + words.slice(mid).join(" ")
      } else {
        name
}
}
#echarm.render(width: 110%, height: 450pt, options: (
    xAxis: (
    type: "category",
    data: portBrkupdata.map((items)=> wrapped_name((items.SecurityCategory))),
    axisLabel:(formatter: "{value}",color: "#000000",fontWeight: "bold"),
    axisLine: ("show": true),
    axisTick: ("show": false),
    nameTruncate: (maxWidth :10)
    ),
    calculable: true,
  yAxis: (
    type: "value",
    axisLine: ("show": true),
     axisLabel:(formatter: "{value}M",color: "#000000",fontWeight: "bold"),
    splitLine: (
      "show": false
    ),
  ),
  series: (
    (data: portBrkupdata.map((items)=> items.StartExposure),
    type: "bar",
    stack:"startExposure",
    name:"startExposure",
    barWidth: 23,
     // barGap: "10%",
     barCategoryGap: "1%",
    color:primaryColors.at(1)),
  (data: portBrkupdata.map((items)=> items.EndExposure),
    type: "bar",
    name:"endExposure",
    stack:"endExposure",
    barWidth: 23,
     // barGap: "10%",
     barCategoryGap: "1%",
    color:primaryColors.at(0))
  )
)
)
]
]

#place(dy: 500pt)[
  #box(width:100%,stroke: stroke(thickness:01pt,paint: rgb("#cdcdcd")),radius: 20pt,clip: true)[
 #table(
    columns: (1.5fr,1fr,.7fr,1fr,.7fr),
    stroke: none,
    align: center+horizon,
    inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
    table.header(
    table.cell(fill:rgb("#ebebeb"),rowspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold", [Product Type])),
    table.vline(start: 0,end: 2,stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Beginning Value")),
    table.cell(fill:rgb("#ebebeb"),colspan: 2,text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Ending Value")),
    table.hline(stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Amount (₹)")]),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "%")]),
    table.vline(start: 0,end: 2,stroke: 0.3pt+rgb("#00000070")),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "Amount (₹)")]),
    table.cell(fill:rgb("#ebebeb"),align(right)[#text(size: 18pt,fill: rgb("#0d3b6b"), weight: "bold",  "%")]),
  ),
  
    table.cell(align(left)[#text(size: 18pt, "Arbitrage Funds")]),
    table.cell(align(right)[#text(size: 18pt, "0")]),
    table.cell(align(right)[#text(size: 18pt, "0"+"%")]),
    table.cell(align(right)[#text(size: 18pt, "2,50,53,705")]),
    table.cell(align(right)[#text(size: 18pt, "15.73"+"%")]),
    table.hline(stroke: rgb("#cdcdcd")),

    table.cell(align(left)[#text(size: 18pt, "Mutual Funds/ETFs")]),
    table.cell(align(right)[#text(size: 18pt, "0")]),
    table.cell(align(right)[#text(size: 18pt, "0"+"%")]),
    table.cell(align(right)[#text(size: 18pt, "13,42,60,457")]),
    table.cell(align(right)[#text(size: 18pt, "84.27"+"%")]),
    table.hline(stroke: rgb("#cdcdcd")),


  )]
  ]
]
]
// #place(dy: -75pt)[
//    #custom-footer
// ]














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


#let heading0 = rgb("#0d3c6a")
#let headerBg = rgb("#f4f5f6")
#let whiteBg = white
#let highlightBlue = rgb("#9cccf8")
#set text(weight: "black")

// Asset Class Wise Summary

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
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Gain/Loss Realised")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Dividend Interest")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "Gain/Loss Unrealised")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "IRR %")]),
    table.cell(align(right)[#text(fill: heading0,weight: "black", "BMIRR %")]),
    table.cell(align(left)[#text(fill: heading0,weight: "black", "Benchmark")]),
  ),

 
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(colspan: 10, align(left)[#text("Equities" )],fill: highlightBlue),
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Mutual Funds/ETFs" )] ),
    table.cell(align(right)[#text("8,60,10,368.67")]),
    table.cell(align(right)[#text("100")]),
    table.cell(align(right)[#text("6,78,96,605.06")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("1,81,13,763.61")]),
    table.cell(align(right)[#text("14.17")]),
    table.cell(align(right)[#text("11.11")]),
    table.cell(align(left)[#text("NIFTY 200 TRI")]),
    
  
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Sub Total",fill: heading0)],),
    table.cell(align(right)[#text("8,60,10,368.67",fill:heading0)]),
    table.cell(align(right)[#text("100",fill:heading0)]),
    table.cell(align(right)[#text("6,78,96,605.06",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("1,81,13,763.61",fill:heading0)]),
    table.cell(align(right)[#text("14.17",fill:heading0)]),
    table.cell(align(right)[#text("11.11",fill:heading0)]),
    table.cell(align(left)[#text("-",fill:heading0)]),
    
  
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(colspan: 10, align(left)[#text("Fixed Income" )],fill: highlightBlue),
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Mutual Funds/ETFs" )] ),
    table.cell(align(right)[#text("4,82,50,088.26")]),
    table.cell(align(right)[#text("100")]),
    table.cell(align(right)[#text("3,99,98,000.08")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("82,52,088.18")]),
    table.cell(align(right)[#text("7.25")]),
    table.cell(align(right)[#text("7.90")]),
    table.cell(align(left)[#text("CRISIL Comp. Bond")]),
    
  
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Sub Total",fill: heading0)],),
    table.cell(align(right)[#text("4,82,50,088.26",fill:heading0)]),
    table.cell(align(right)[#text("100",fill:heading0)]),
    table.cell(align(right)[#text("3,99,98,000.08",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("82,52,088.18",fill:heading0)]),
    table.cell(align(right)[#text("7.25",fill:heading0)]),
    table.cell(align(right)[#text("7.90",fill:heading0)]),
    table.cell(align(left)[#text("-",fill:heading0)]),
    
  
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(colspan: 10, align(left)[#text("Liquid" )],fill: highlightBlue),
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Arbitrage Funds" )] ),
    table.cell(align(right)[#text("2,50,53,704.67")]),
    table.cell(align(right)[#text("100")]),
    table.cell(align(right)[#text("2,44,83,449.26")]),
    table.cell(align(right)[#text("15,747.64")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("5,70,255.41")]),
    table.cell(align(right)[#text("6.68")]),
    table.cell(align(right)[#text("6.75")]),
    table.cell(align(left)[#text("CRISIL Liquid")]),
    
  
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Sub Total",fill: heading0)],),
    table.cell(align(right)[#text("2,50,53,704.67",fill:heading0)]),
    table.cell(align(right)[#text("100",fill:heading0)]),
    table.cell(align(right)[#text("2,44,83,449.26",fill:heading0)]),
    table.cell(align(right)[#text("15,747.64",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("5,70,255.41",fill:heading0)]),
    table.cell(align(right)[#text("6.68",fill:heading0)]),
    table.cell(align(right)[#text("6.75",fill:heading0)]),
    table.cell(align(left)[#text("-",fill:heading0)]),
    
  
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Grand Total",fill: heading0)],),
    table.cell(align(right)[#text("15,93,14,161.60",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("13,23,78,054.40",fill:heading0)]),
    table.cell(align(right)[#text("15,747.64",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("2,69,36,107.20",fill:heading0)]),
    table.cell(align(right)[#text("10.74",fill:heading0)]),
    table.cell(align(right)[#text("9.45",fill:heading0)]),
    table.cell(align(left)[#text("-",fill:heading0)]),
    
  

  )


// Product Wise Exposure - Advisors / Distributors


// // Sub Asset Class Wise Exposure - Advisors / Distributors

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
 

  
    
      
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 9, align(left)[#text("Arbitrage Funds" )],fill: highlightBlue ),
      
      
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Liquid: Arbitrage Funds" )] ),
      table.cell(align(right)[#text("2,44,83,449.26" )],),
      table.cell(align(right)[#text("2,50,53,704.67" )],),
      table.cell(align(right)[#text("5,70,255.41" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("15,747.64" )],),
      table.cell(align(right)[#text("6.68" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("100" )],),
    
  
    
       
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      
      
      table.cell(align(left)[#text("Sub Total" ,fill: heading0)],),
      table.cell(align(right)[#text("2,44,83,449.26" ,fill: heading0)],),
      table.cell(align(right)[#text("2,50,53,704.67" ,fill: heading0)],),
      table.cell(align(right)[#text("5,70,255.41" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("15,747.64" ,fill: heading0)],),
      table.cell(align(right)[#text("6.68" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("100" ,fill: heading0)],),
    
  
    
      
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 9, align(left)[#text("Mutual Funds/ETFs" )],fill: highlightBlue ),
      
      
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Equities: Large Cap" )] ),
      table.cell(align(right)[#text("1,11,99,440.00" )],),
      table.cell(align(right)[#text("1,42,81,097.97" )],),
      table.cell(align(right)[#text("30,81,657.97" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("11.78" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("10.64" )],),
    
  
    
      
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Equities: Mid Cap" )] ),
      table.cell(align(right)[#text("66,99,664.99" )],),
      table.cell(align(right)[#text("93,16,282.91" )],),
      table.cell(align(right)[#text("26,16,617.92" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("13.76" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("6.94" )],),
    
  
    
      
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Equities: Multi/Flexi cap" )] ),
      table.cell(align(right)[#text("3,66,98,165.07" )],),
      table.cell(align(right)[#text("4,57,65,458.17" )],),
      table.cell(align(right)[#text("90,67,293.10" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("15.04" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("34.09" )],),
    
  
    
      
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Equities: Small Cap" )] ),
      table.cell(align(right)[#text("54,99,725.00" )],),
      table.cell(align(right)[#text("82,66,947.34" )],),
      table.cell(align(right)[#text("27,67,222.34" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("16.78" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("6.16" )],),
    
  
    
      
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Equities: Thematic" )] ),
      table.cell(align(right)[#text("77,99,610.00" )],),
      table.cell(align(right)[#text("83,80,582.28" )],),
      table.cell(align(right)[#text("5,80,972.28" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("9.67" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("6.24" )],),
    
  
    
      
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Fixed Income: Banking & PSU Funds" )] ),
      table.cell(align(right)[#text("2,99,98,500.07" )],),
      table.cell(align(right)[#text("3,59,90,321.13" )],),
      table.cell(align(right)[#text("59,91,821.06" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("7.03" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("26.81" )],),
    
  
    
      
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Fixed Income: Dynamic Funds" )] ),
      table.cell(align(right)[#text("99,99,500.01" )],),
      table.cell(align(right)[#text("1,22,59,767.13" )],),
      table.cell(align(right)[#text("22,60,267.12" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("7.89" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("9.13" )],),
    
  
    
       
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      
      
      table.cell(align(left)[#text("Sub Total" ,fill: heading0)],),
      table.cell(align(right)[#text("10,78,94,605.14" ,fill: heading0)],),
      table.cell(align(right)[#text("13,42,60,456.93" ,fill: heading0)],),
      table.cell(align(right)[#text("2,63,65,851.79" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("10.87" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("100" ,fill: heading0)],),
    
  
    
       
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      
      
      table.cell(align(left)[#text("Grand Total" ,fill: heading0)],),
      table.cell(align(right)[#text("13,23,78,054.40" ,fill: heading0)],),
      table.cell(align(right)[#text("15,93,14,161.60" ,fill: heading0)],),
      table.cell(align(right)[#text("2,69,36,107.20" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("15,747.64" ,fill: heading0)],),
      table.cell(align(right)[#text("10.74" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
    
  
  )



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
  
 

   
  
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 10, align(left)[#text("Equities: Large Cap" )],fill: highlightBlue ),
      
      
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("HDFC Nifty 50 Index Fund -Growth")]),
    table.cell(align(left)[#text("20036786/57")]),
    table.cell(align(right)[#text("14,866.3700")]),
    table.cell(align(right)[#text("29,99,850.00")]),
    table.cell(align(right)[#text("32,12,472.62")]),
    table.cell(align(right)[#text("2,12,622.62")]),
    table.cell(align(right)[#text("7.09")]),
    table.cell(align(right)[#text("6.35")]),
    table.cell(align(center)[#text("12 Oct 2023")]),
    table.cell(align(right)[#text("404")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("Mirae Asset Large Cap Fund Regular- Growth")]),
    table.cell(align(left)[#text("79958647361")]),
    table.cell(align(right)[#text("1,08,164.9300")]),
    table.cell(align(right)[#text("81,99,590.00")]),
    table.cell(align(right)[#text("1,10,68,625.35")]),
    table.cell(align(right)[#text("28,69,035.35")]),
    table.cell(align(right)[#text("34.99")]),
    table.cell(align(right)[#text("12.51")]),
    table.cell(align(center)[#text("24 Jun 2022")]),
    table.cell(align(right)[#text("898")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
      
    table.cell([#text("Sub Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("1,23,031.3000",fill :heading0)]),
    table.cell(align(right)[#text("1,11,99,440.00",fill :heading0)]),
    table.cell(align(right)[#text("1,42,81,097.97",fill :heading0)]),
    table.cell(align(right)[#text("30,81,657.97",fill :heading0)]),
    table.cell(align(right)[#text("27.52",fill :heading0)]),
    table.cell(align(right)[#text("11.78",fill :heading0)]),
    table.cell(align(center)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
  

   
  
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 10, align(left)[#text("Equities: Mid Cap" )],fill: highlightBlue ),
      
      
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("PGIM India Midcap Opportunities Fund Regular-Growth")]),
    table.cell(align(left)[#text("91014278746")]),
    table.cell(align(right)[#text("1,61,432.7300")]),
    table.cell(align(right)[#text("66,99,664.99")]),
    table.cell(align(right)[#text("93,16,282.91")]),
    table.cell(align(right)[#text("26,16,617.92")]),
    table.cell(align(right)[#text("39.06")]),
    table.cell(align(right)[#text("13.76")]),
    table.cell(align(center)[#text("24 Jun 2022")]),
    table.cell(align(right)[#text("892")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
      
    table.cell([#text("Sub Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("1,61,432.7300",fill :heading0)]),
    table.cell(align(right)[#text("66,99,664.99",fill :heading0)]),
    table.cell(align(right)[#text("93,16,282.91",fill :heading0)]),
    table.cell(align(right)[#text("26,16,617.92",fill :heading0)]),
    table.cell(align(right)[#text("39.06",fill :heading0)]),
    table.cell(align(right)[#text("13.76",fill :heading0)]),
    table.cell(align(center)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
  

   
  
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 10, align(left)[#text("Equities: Multi/Flexi cap" )],fill: highlightBlue ),
      
      
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("HDFC Focused 30 Fund-Growth")]),
    table.cell(align(left)[#text("20036786/57")]),
    table.cell(align(right)[#text("38,012.3200")]),
    table.cell(align(right)[#text("82,99,585.02")]),
    table.cell(align(right)[#text("79,53,279.70")]),
    table.cell(align(right)[#text("-3,46,305.32")]),
    table.cell(align(right)[#text("-4.17")]),
    table.cell(align(right)[#text("-8.14")]),
    table.cell(align(center)[#text("16 Jul 2024")]),
    table.cell(align(right)[#text("181")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("Invesco India Flexi Cap Fund Regular - Growth")]),
    table.cell(align(left)[#text("31023974234")]),
    table.cell(align(right)[#text("3,13,505.4400")]),
    table.cell(align(right)[#text("58,99,705.02")]),
    table.cell(align(right)[#text("51,50,894.41")]),
    table.cell(align(right)[#text("-7,48,810.61")]),
    table.cell(align(right)[#text("-12.69")]),
    table.cell(align(right)[#text("-27.34")]),
    table.cell(align(center)[#text("11 Oct 2024")]),
    table.cell(align(right)[#text("148")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("Parag Parikh Flexi Cap Fund Regular-Growth")]),
    table.cell(align(left)[#text("12689762")]),
    table.cell(align(right)[#text("2,62,306.9300")]),
    table.cell(align(right)[#text("1,41,99,290.02")]),
    table.cell(align(right)[#text("2,04,47,402.35")]),
    table.cell(align(right)[#text("62,48,112.33")]),
    table.cell(align(right)[#text("44.00")]),
    table.cell(align(right)[#text("20.59")]),
    table.cell(align(center)[#text("24 Jun 2022")]),
    table.cell(align(right)[#text("630")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("SBI Focused Equity Fund-Growth")]),
    table.cell(align(left)[#text("30372259")]),
    table.cell(align(right)[#text("38,240.3000")]),
    table.cell(align(right)[#text("82,99,585.01")]),
    table.cell(align(right)[#text("1,22,13,881.71")]),
    table.cell(align(right)[#text("39,14,296.70")]),
    table.cell(align(right)[#text("47.16")]),
    table.cell(align(right)[#text("15.85")]),
    table.cell(align(center)[#text("24 Jun 2022")]),
    table.cell(align(right)[#text("923")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
      
    table.cell([#text("Sub Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("6,52,064.9900",fill :heading0)]),
    table.cell(align(right)[#text("3,66,98,165.07",fill :heading0)]),
    table.cell(align(right)[#text("4,57,65,458.17",fill :heading0)]),
    table.cell(align(right)[#text("90,67,293.10",fill :heading0)]),
    table.cell(align(right)[#text("24.71",fill :heading0)]),
    table.cell(align(right)[#text("15.04",fill :heading0)]),
    table.cell(align(center)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
  

   
  
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 10, align(left)[#text("Equities: Small Cap" )],fill: highlightBlue ),
      
      
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("Kotak Small Cap Fund Regular-Growth")]),
    table.cell(align(left)[#text("10784222/35")]),
    table.cell(align(right)[#text("35,680.7600")]),
    table.cell(align(right)[#text("54,99,725.00")]),
    table.cell(align(right)[#text("82,66,947.34")]),
    table.cell(align(right)[#text("27,67,222.34")]),
    table.cell(align(right)[#text("50.32")]),
    table.cell(align(right)[#text("16.78")]),
    table.cell(align(center)[#text("24 Jun 2022")]),
    table.cell(align(right)[#text("935")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
      
    table.cell([#text("Sub Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("35,680.7600",fill :heading0)]),
    table.cell(align(right)[#text("54,99,725.00",fill :heading0)]),
    table.cell(align(right)[#text("82,66,947.34",fill :heading0)]),
    table.cell(align(right)[#text("27,67,222.34",fill :heading0)]),
    table.cell(align(right)[#text("50.32",fill :heading0)]),
    table.cell(align(right)[#text("16.78",fill :heading0)]),
    table.cell(align(center)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
  

   
  
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 10, align(left)[#text("Equities: Thematic" )],fill: highlightBlue ),
      
      
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(right)[#text("2,58,979.6800")]),
    table.cell(align(right)[#text("77,99,610.00")]),
    table.cell(align(right)[#text("83,80,582.28")]),
    table.cell(align(right)[#text("5,80,972.28")]),
    table.cell(align(right)[#text("7.45")]),
    table.cell(align(right)[#text("9.67")]),
    table.cell(align(center)[#text("20 Mar 2023")]),
    table.cell(align(right)[#text("312")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
      
    table.cell([#text("Sub Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("2,58,979.6800",fill :heading0)]),
    table.cell(align(right)[#text("77,99,610.00",fill :heading0)]),
    table.cell(align(right)[#text("83,80,582.28",fill :heading0)]),
    table.cell(align(right)[#text("5,80,972.28",fill :heading0)]),
    table.cell(align(right)[#text("7.45",fill :heading0)]),
    table.cell(align(right)[#text("9.67",fill :heading0)]),
    table.cell(align(center)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
  

   
  
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 10, align(left)[#text("Fixed Income: Banking & PSU Funds" )],fill: highlightBlue ),
      
      
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("HSBC Banking and PSU Debt Fund-Growth")]),
    table.cell(align(left)[#text("5962018/67")]),
    table.cell(align(right)[#text("7,58,351.4500")]),
    table.cell(align(right)[#text("1,49,99,250.03")]),
    table.cell(align(right)[#text("1,78,44,237.17")]),
    table.cell(align(right)[#text("28,44,987.14")]),
    table.cell(align(right)[#text("18.97")]),
    table.cell(align(right)[#text("6.62")]),
    table.cell(align(center)[#text("24 Jun 2022")]),
    table.cell(align(right)[#text("973")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("ICICI Prudential Banking & PSU Debt-Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(right)[#text("5,70,192.2700")]),
    table.cell(align(right)[#text("1,49,99,250.04")]),
    table.cell(align(right)[#text("1,81,46,083.96")]),
    table.cell(align(right)[#text("31,46,833.92")]),
    table.cell(align(right)[#text("20.98")]),
    table.cell(align(right)[#text("7.45")]),
    table.cell(align(center)[#text("24 Jun 2022")]),
    table.cell(align(right)[#text("973")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
      
    table.cell([#text("Sub Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("13,28,543.7200",fill :heading0)]),
    table.cell(align(right)[#text("2,99,98,500.07",fill :heading0)]),
    table.cell(align(right)[#text("3,59,90,321.13",fill :heading0)]),
    table.cell(align(right)[#text("59,91,821.06",fill :heading0)]),
    table.cell(align(right)[#text("19.97",fill :heading0)]),
    table.cell(align(right)[#text("7.03",fill :heading0)]),
    table.cell(align(center)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
  

   
  
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 10, align(left)[#text("Fixed Income: Dynamic Funds" )],fill: highlightBlue ),
      
      
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("Nippon India Dynamic Bond Fund-Growth")]),
    table.cell(align(left)[#text("499266492702")]),
    table.cell(align(right)[#text("3,38,898.8400")]),
    table.cell(align(right)[#text("99,99,500.01")]),
    table.cell(align(right)[#text("1,22,59,767.13")]),
    table.cell(align(right)[#text("22,60,267.12")]),
    table.cell(align(right)[#text("22.60")]),
    table.cell(align(right)[#text("7.89")]),
    table.cell(align(center)[#text("24 Jun 2022")]),
    table.cell(align(right)[#text("973")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
      
    table.cell([#text("Sub Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("3,38,898.8400",fill :heading0)]),
    table.cell(align(right)[#text("99,99,500.01",fill :heading0)]),
    table.cell(align(right)[#text("1,22,59,767.13",fill :heading0)]),
    table.cell(align(right)[#text("22,60,267.12",fill :heading0)]),
    table.cell(align(right)[#text("22.60",fill :heading0)]),
    table.cell(align(right)[#text("7.89",fill :heading0)]),
    table.cell(align(center)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
      
    table.cell([#text("Grand Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("28,98,632.0200",fill :heading0)]),
    table.cell(align(right)[#text("10,78,94,605.14",fill :heading0)]),
    table.cell(align(right)[#text("13,42,60,456.93",fill :heading0)]),
    table.cell(align(right)[#text("2,63,65,851.79",fill :heading0)]),
    table.cell(align(right)[#text("24.44",fill :heading0)]),
    table.cell(align(right)[#text("10.87",fill :heading0)]),
    table.cell(align(center)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
  

)








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


// AMC Wise Exposure - All Advisors

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


   
  
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 6, align(left)[#text("Equities" )],fill: highlightBlue ),
      
      
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("HDFC Mutual Fund")]),
    table.cell(align(right)[#text("1,12,99,435.02")]),
    table.cell(align(right)[#text("1,11,65,752.32")]),
    table.cell(align(right)[#text("-1,33,682.70")]),
    table.cell(align(right)[#text("-1.78")]),
    table.cell(align(right)[#text("12.98")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("ICICI Prudential Mutual Fund")]),
    table.cell(align(right)[#text("77,99,610.00")]),
    table.cell(align(right)[#text("83,80,582.28")]),
    table.cell(align(right)[#text("5,80,972.28")]),
    table.cell(align(right)[#text("9.67")]),
    table.cell(align(right)[#text("9.74")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Invesco Mutual Fund")]),
    table.cell(align(right)[#text("58,99,705.02")]),
    table.cell(align(right)[#text("51,50,894.41")]),
    table.cell(align(right)[#text("-7,48,810.61")]),
    table.cell(align(right)[#text("-27.34")]),
    table.cell(align(right)[#text("5.99")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Kotak Mahindra Mutual Fund")]),
    table.cell(align(right)[#text("54,99,725.00")]),
    table.cell(align(right)[#text("82,66,947.34")]),
    table.cell(align(right)[#text("27,67,222.34")]),
    table.cell(align(right)[#text("16.78")]),
    table.cell(align(right)[#text("9.61")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Mirae Asset Mutual Fund")]),
    table.cell(align(right)[#text("81,99,590.00")]),
    table.cell(align(right)[#text("1,10,68,625.35")]),
    table.cell(align(right)[#text("28,69,035.35")]),
    table.cell(align(right)[#text("12.51")]),
    table.cell(align(right)[#text("12.87")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("PGIM India Mutual Fund")]),
    table.cell(align(right)[#text("66,99,664.99")]),
    table.cell(align(right)[#text("93,16,282.91")]),
    table.cell(align(right)[#text("26,16,617.92")]),
    table.cell(align(right)[#text("13.76")]),
    table.cell(align(right)[#text("10.83")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("PPFAS Mutual Fund")]),
    table.cell(align(right)[#text("1,41,99,290.02")]),
    table.cell(align(right)[#text("2,04,47,402.35")]),
    table.cell(align(right)[#text("62,48,112.33")]),
    table.cell(align(right)[#text("20.59")]),
    table.cell(align(right)[#text("23.77")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("SBI Mutual Fund")]),
    table.cell(align(right)[#text("82,99,585.01")]),
    table.cell(align(right)[#text("1,22,13,881.71")]),
    table.cell(align(right)[#text("39,14,296.70")]),
    table.cell(align(right)[#text("15.85")]),
    table.cell(align(right)[#text("14.20")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Sub Total",fill :heading0)]),
    table.cell(align(right)[#text("6,78,96,605.06",fill :heading0)]),
    table.cell(align(right)[#text("8,60,10,368.67",fill :heading0)]),
    table.cell(align(right)[#text("1,81,13,763.61",fill :heading0)]),
    table.cell(align(right)[#text("14.17",fill :heading0)]),
    table.cell(align(right)[#text("100",fill :heading0)]),
  

   
  
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 6, align(left)[#text("Fixed Income" )],fill: highlightBlue ),
      
      
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("HSBC Mutual Fund")]),
    table.cell(align(right)[#text("1,49,99,250.03")]),
    table.cell(align(right)[#text("1,78,44,237.17")]),
    table.cell(align(right)[#text("28,44,987.14")]),
    table.cell(align(right)[#text("6.62")]),
    table.cell(align(right)[#text("36.98")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("ICICI Prudential Mutual Fund")]),
    table.cell(align(right)[#text("1,49,99,250.04")]),
    table.cell(align(right)[#text("1,81,46,083.96")]),
    table.cell(align(right)[#text("31,46,833.92")]),
    table.cell(align(right)[#text("7.45")]),
    table.cell(align(right)[#text("37.61")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Nippon India Mutual Fund")]),
    table.cell(align(right)[#text("99,99,500.01")]),
    table.cell(align(right)[#text("1,22,59,767.13")]),
    table.cell(align(right)[#text("22,60,267.12")]),
    table.cell(align(right)[#text("7.89")]),
    table.cell(align(right)[#text("25.41")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Sub Total",fill :heading0)]),
    table.cell(align(right)[#text("3,99,98,000.08",fill :heading0)]),
    table.cell(align(right)[#text("4,82,50,088.26",fill :heading0)]),
    table.cell(align(right)[#text("82,52,088.18",fill :heading0)]),
    table.cell(align(right)[#text("7.25",fill :heading0)]),
    table.cell(align(right)[#text("100",fill :heading0)]),
  

   
  
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(colspan: 6, align(left)[#text("Liquid" )],fill: highlightBlue ),
      
      
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("HDFC Mutual Fund")]),
    table.cell(align(right)[#text("49,99,750.01")]),
    table.cell(align(right)[#text("52,26,971.84")]),
    table.cell(align(right)[#text("2,27,221.83")]),
    table.cell(align(right)[#text("6.82")]),
    table.cell(align(right)[#text("20.86")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Invesco Mutual Fund")]),
    table.cell(align(right)[#text("1,09,68,451.58")]),
    table.cell(align(right)[#text("1,11,54,185.72")]),
    table.cell(align(right)[#text("1,85,734.14")]),
    table.cell(align(right)[#text("6.73")]),
    table.cell(align(right)[#text("44.52")]),
  

   
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("PPFAS Mutual Fund")]),
    table.cell(align(right)[#text("85,15,247.67")]),
    table.cell(align(right)[#text("86,72,547.11")]),
    table.cell(align(right)[#text("1,57,299.44")]),
    table.cell(align(right)[#text("6.47")]),
    table.cell(align(right)[#text("34.62")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Sub Total",fill :heading0)]),
    table.cell(align(right)[#text("2,44,83,449.26",fill :heading0)]),
    table.cell(align(right)[#text("2,50,53,704.67",fill :heading0)]),
    table.cell(align(right)[#text("5,70,255.41",fill :heading0)]),
    table.cell(align(right)[#text("6.68",fill :heading0)]),
    table.cell(align(right)[#text("100",fill :heading0)]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Grand Total",fill :heading0)]),
    table.cell(align(right)[#text("13,23,78,054.40",fill :heading0)]),
    table.cell(align(right)[#text("15,93,14,161.60",fill :heading0)]),
    table.cell(align(right)[#text("2,69,36,107.20",fill :heading0)]),
    table.cell(align(right)[#text("10.74",fill :heading0)]),
    table.cell(align(right)[#text("100",fill :heading0)]),
  

)



// Fund Manager Wise Exposure - All Advisor

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



  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Gaurav Misra")]),
    table.cell(align(left)[#text("Mirae Asset Mutual Fund")]),
    table.cell(align(right)[#text("1,10,68,625.35")]),
    table.cell(align(right)[#text("7.41")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Manish Banthia")]),
    table.cell(align(left)[#text("ICICI Prudential Mutual Fund")]),
    table.cell(align(right)[#text("90,73,041.98")]),
    table.cell(align(right)[#text("6.08")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Rohit Lakhotia")]),
    table.cell(align(left)[#text("ICICI Prudential Mutual Fund")]),
    table.cell(align(right)[#text("90,73,041.98")]),
    table.cell(align(right)[#text("6.08")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Mahesh A Chhabria")]),
    table.cell(align(left)[#text("HSBC Mutual Fund")]),
    table.cell(align(right)[#text("89,22,118.59")]),
    table.cell(align(right)[#text("5.98")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Asif Rizwi")]),
    table.cell(align(left)[#text("HSBC Mutual Fund")]),
    table.cell(align(right)[#text("89,22,118.59")]),
    table.cell(align(right)[#text("5.98")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Harish Bihani")]),
    table.cell(align(left)[#text("Kotak Mahindra Mutual Fund")]),
    table.cell(align(right)[#text("82,66,947.34")]),
    table.cell(align(right)[#text("5.54")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Vivek Sharma")]),
    table.cell(align(left)[#text("Nippon India Mutual Fund")]),
    table.cell(align(right)[#text("61,29,883.56")]),
    table.cell(align(right)[#text("4.11")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Pranay Sinha")]),
    table.cell(align(left)[#text("Nippon India Mutual Fund")]),
    table.cell(align(right)[#text("61,29,883.56")]),
    table.cell(align(right)[#text("4.11")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Rama Iyer Srinivasan")]),
    table.cell(align(left)[#text("SBI Mutual Fund")]),
    table.cell(align(right)[#text("61,06,940.86")]),
    table.cell(align(right)[#text("4.09")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Pradeep Kesavan")]),
    table.cell(align(left)[#text("SBI Mutual Fund")]),
    table.cell(align(right)[#text("61,06,940.86")]),
    table.cell(align(right)[#text("4.09")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Dhruv Muchhal")]),
    table.cell(align(left)[#text("HDFC Mutual Fund")]),
    table.cell(align(right)[#text("52,83,382.81")]),
    table.cell(align(right)[#text("3.54")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Rukun Tarachandani")]),
    table.cell(align(left)[#text("PPFAS Mutual Fund")]),
    table.cell(align(right)[#text("48,23,735.30")]),
    table.cell(align(right)[#text("3.23")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Mansi Kariya")]),
    table.cell(align(left)[#text("PPFAS Mutual Fund")]),
    table.cell(align(right)[#text("48,23,735.30")]),
    table.cell(align(right)[#text("3.23")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Raj Mehta")]),
    table.cell(align(left)[#text("PPFAS Mutual Fund")]),
    table.cell(align(right)[#text("48,23,735.30")]),
    table.cell(align(right)[#text("3.23")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Raunak Onkar")]),
    table.cell(align(left)[#text("PPFAS Mutual Fund")]),
    table.cell(align(right)[#text("48,23,735.30")]),
    table.cell(align(right)[#text("3.23")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Rajeev Thakkar")]),
    table.cell(align(left)[#text("PPFAS Mutual Fund")]),
    table.cell(align(right)[#text("48,23,735.30")]),
    table.cell(align(right)[#text("3.23")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Roshi Jain")]),
    table.cell(align(left)[#text("HDFC Mutual Fund")]),
    table.cell(align(right)[#text("39,76,639.85")]),
    table.cell(align(right)[#text("2.66")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Kuber Mannadi")]),
    table.cell(align(left)[#text("Invesco Mutual Fund")]),
    table.cell(align(right)[#text("30,75,902.79")]),
    table.cell(align(right)[#text("2.06")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Deepak Gupta")]),
    table.cell(align(left)[#text("Invesco Mutual Fund")]),
    table.cell(align(right)[#text("30,75,902.79")]),
    table.cell(align(right)[#text("2.06")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Arun Agarwal")]),
    table.cell(align(left)[#text("HDFC Mutual Fund")]),
    table.cell(align(right)[#text("29,12,979.27")]),
    table.cell(align(right)[#text("1.95")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Nirman S. Morakhia")]),
    table.cell(align(left)[#text("HDFC Mutual Fund")]),
    table.cell(align(right)[#text("29,12,979.27")]),
    table.cell(align(right)[#text("1.95")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Roshan Chutkey")]),
    table.cell(align(left)[#text("ICICI Prudential Mutual Fund")]),
    table.cell(align(right)[#text("27,93,527.43")]),
    table.cell(align(right)[#text("1.87")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Sankaran Naren")]),
    table.cell(align(left)[#text("ICICI Prudential Mutual Fund")]),
    table.cell(align(right)[#text("27,93,527.43")]),
    table.cell(align(right)[#text("1.87")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Sharmila D''mello")]),
    table.cell(align(left)[#text("ICICI Prudential Mutual Fund")]),
    table.cell(align(right)[#text("27,93,527.43")]),
    table.cell(align(right)[#text("1.87")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Taher Badshah")]),
    table.cell(align(left)[#text("Invesco Mutual Fund")]),
    table.cell(align(right)[#text("25,75,447.20")]),
    table.cell(align(right)[#text("1.72")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Amit Ganatra")]),
    table.cell(align(left)[#text("Invesco Mutual Fund")]),
    table.cell(align(right)[#text("25,75,447.20")]),
    table.cell(align(right)[#text("1.72")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Utsav Mehta")]),
    table.cell(align(left)[#text("PGIM India Mutual Fund")]),
    table.cell(align(right)[#text("23,29,070.73")]),
    table.cell(align(right)[#text("1.56")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Puneet Pal")]),
    table.cell(align(left)[#text("PGIM India Mutual Fund")]),
    table.cell(align(right)[#text("23,29,070.73")]),
    table.cell(align(right)[#text("1.56")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Vivek Sharma")]),
    table.cell(align(left)[#text("PGIM India Mutual Fund")]),
    table.cell(align(right)[#text("23,29,070.73")]),
    table.cell(align(right)[#text("1.56")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Vinay Paharia")]),
    table.cell(align(left)[#text("PGIM India Mutual Fund")]),
    table.cell(align(right)[#text("23,29,070.73")]),
    table.cell(align(right)[#text("1.56")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Anil Bamboli")]),
    table.cell(align(left)[#text("HDFC Mutual Fund")]),
    table.cell(align(right)[#text("13,06,742.96")]),
    table.cell(align(right)[#text("0.88")]),
  



  
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("14,93,10,508.50",fill :heading0)]),
    table.cell(align(right)[#text("100",fill :heading0)]),
  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  

)


// Equity Mutual Fund - Quants















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
  #place()[== #text("Mutual Fund Analysis - Equity Mutual Fund Quants")]
]

#let currentData1 = (
 
  ( value: 53.21,
     name: "Multi/Flexi cap"
  ),

  ( value: 16.60,
     name: "Large Cap"
  ),

  ( value: 10.83,
     name: "Mid Cap"
  ),

  ( value: 9.74,
     name: "Thematic"
  ),

  ( value: 9.61,
     name: "Small Cap"
  ),

 )
 //top left
#place(top+left,
  dx: 0pt, dy: 20pt
)[
  #box(
    width: 49.5%,
    height:48.8%,
   stroke: rgb("#cecece"),
    radius: 20pt,
    clip: true,
    inset: 20pt
  )[// Title
    #place(dx: 0pt,dy: 5pt)[
    #text("Industry Allocation(%)", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")
    ]
 #let EquityMFIndData =(
      
 (category :"Others", value:49.70),
 
 (category :"Banking", value:20.36),
 
 (category :"Software", value:6.85),
 
 (category :"Drugs & Pharma", value:5.41),
 
 (category :"Cement", value:3.23),
 
 (category :"Coal & Lignite", value:2.88),
 
 (category :"Online Services", value:2.73),
 
 (category :"Telecom Services", value:2.50),
 
 (category :"Cars & Multi Utility Vehicles", value:2.25),
 
 (category :"Auto Ancillaries", value:2.19),
 
 (category :"Electricity Distribution", value:1.90),
 
)
   #place(dx:50pt,dy:30pt)[#echarm.render(width: 2610pt, height: 100%, options: (
          yAxis: (
          type: "category",
          inverse:true,
          data: EquityMFIndData.map((items)=> (items.category)),
          axisLine: ("show": false),
          axisTick: ("show": false),
          axisLabel: (align: right,
                    // padding: (0,12,0,0),
                      color: "#000000",
                      fontSize:15,
                      fontWeight: "bold"),
          ),
        xAxis: (splitLine: ("show": false),
                type: "value",
                min: 0,
                max: 450.00,
                axisLine: ("show": false),
                axisLabel: ("show": false),
              ),
        series: (data: (EquityMFIndData.map((items)=> items.value)),
                type: "bar",
                color:primaryColors.at(0),
                stack:"a",
                name:"a",
                barWidth: 20,
                barGap: 15,
                label: (
                      "show": true,
                      position: "right",
                      color: "#000000",
                      fontSize:15,
                      "formatter": "{c}%",
                      fontWeight:"bold"
                    ),
              )
      )
      )]
  ]
]

 //bottom left
#place(bottom+left,
  dx: 0pt, dy: 5pt
)[
  #box(
    width: 49.5%,
    height:48.5%,
   stroke: rgb("#cecece"),
    radius: 20pt,
    clip: true,
    inset: 20pt
  )[// Title
    #place(dx: 0pt,dy: 5pt)[
    #text("AMC Allocation(%)", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")
    ]
 #let EquityMFAmcData =(
      
 (category :"PPFAS Mutual Fund", value:23.77),
 
 (category :"Others", value:15.60),
 
 (category :"SBI Mutual Fund", value:14.20),
 
 (category :"HDFC Mutual Fund", value:12.98),
 
 (category :"Mirae Asset Mutual Fund", value:12.87),
 
 (category :"PGIM India Mutual Fund", value:10.83),
 
 (category :"ICICI Prudential Mutual Fund", value:9.74),
 
)
   #place(dx:50pt,dy:20pt)[
        #box(stroke:none,clip: true)[#echarm.render(width: 2610pt, height: 100%, options: (
          yAxis: (
          type: "category",
          inverse:true,
          data: EquityMFAmcData.map((items)=> (items.category)),
          axisLine: ("show": false),
          axisTick: ("show": false),
          axisLabel: (align: right,
                    // padding: (0,12,0,0),
                      color: "#000000",
                      fontSize:15,
                      fontWeight: "bold"),
          ),
        xAxis: (splitLine: ("show": false),
                type: "value",
                min: 0,
                max: 450.00,
                axisLine: ("show": false),
                axisLabel: ("show": false),
              ),
        series: (data: (EquityMFAmcData.map((items)=> items.value)),
                type: "bar",
                color:primaryColors.at(0),
                stack:"a",
                name:"a",
                barWidth: 20,
                barGap: 15,
                label: (
                      "show": true,
                      position: "right",
                      color: "#000000",
                      fontSize:15,
                      "formatter": "{c}%",
                      fontWeight:"bold"
                    ),
              )
      )
      )]]
  ]
]
 //top right
#place(top+right,
dx: 0pt,dy:20pt)[
#place(dx: 20pt,dy:20pt)[#text("Market Capitalization Allocation(%)", size: 25pt,  fill: rgb("0e496e"), weight: "extrabold")]
  #box(width: 49%,height: 48.8%, stroke: rgb("#cecece"),radius: 20pt)[
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
        text(value)
      ),
      place(
        dx: 27pt, // Offset to align name under value (12pt for rect width + 15pt for spacing)
        text(name)
      )
    )
  })
)
]
]
]


 //bottom right
#place(bottom+right,
  dx: 0pt, dy: 5pt
)[

  #let EquityQuantsData = (

    (Metric: "P/E", Values: [24.75]),

    (Metric: "P/B", Values: [3.89]),

    (Metric: "Weighted Avg. Market Cap(Cr) ", Values: [0]),

    (Metric: "Sharpe Ratio", Values: [0]),

    (Metric: "Portfolio Beta", Values: [0]),

    (Metric: "Standard Deviation", Values: [0]),

  )

  // Create a bordered box containing the table
  #box(
    width: 49%,
    height: 48.5%,
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



// Debt Mutual Fund - Quants





















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
  #place()[== #text("Mutual Fund Analysis - Debt Mutual Fund Quants")]
]

#let DebtMFRatingData = (
  
  ( value: 44.32,
     name: "CRISIL AAA"
  ),

  ( value: 37.58,
     name: "SOV"
  ),

  ( value: 8.06,
     name: "ICRA AAA"
  ),

  ( value: 5.42,
     name: "CRISIL A1+"
  ),

  ( value: 1.33,
     name: "CARE AAA"
  ),

  ( value: 0.86,
     name: "FITCH AAA(CE)"
  ),

  ( value: 2.42,
     name: "Others"
  ),
 )

#place(top+left,
dx: 0pt,dy:10pt)[
#place(
dx: 10pt,dy:30pt)[#text(" Rating Allocation(%)", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")]
  #box(width: 32%,height: 48%,stroke: rgb("#cecece"),radius: 20pt,clip: true)[
  #place(dx: 130pt,dy: -190pt,
    grid(
      columns: (1fr, 1fr),
      align: (center),
      box(
        width: 130%, height: 150%, stroke: none)[
        #echarm.render(width: 100%, height: 100%, options: (
          series: (
            name: "Debt Rating Allocation",
            type: "pie",
            radius: ("40%", "50%"),
            avoidLabelOverlap: false,
            color: primaryColors,
            itemStyle: (
              borderColor: "#fff",
              borderWidth: 0,
            ),
            labelLine: (
              // "show": true,
            ),
            data: DebtMFRatingData
          ),
        )
      ),
    ]
  )
)

#place(
 dx: 50pt, dy: 290pt
)[
   #grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: -120pt,
  inset: 20pt,
  align: left,
  // Dynamically generate legend items
  ..DebtMFRatingData.enumerate().map(((i, item)) => {
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
)]]]


#let DbetMfInstrumentData = (
  
  ( value: 13.64,
     name: "GOI"
  ),

  ( value: 9.30,
     name: "Maharashtra State"
  ),

  ( value: 7.21,
     name: "National Bank Agr. Rur. Devp"
  ),

  ( value: 6.95,
     name: "Small Industries"
  ),

  ( value: 5.86,
     name: "Tamilnadu State"
  ),

  ( value: 5.66,
     name: "HDFC Bank"
  ),

  ( value: 51.37,
     name: "Others"
  ),

)
//  //top mid
#place(top+left,
dx: 550pt,dy:10pt)[
#place(
dx: 10pt,dy:30pt)[#text("Instrument Allocation(%)", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")]
  #box(width: 32%,height: 48%,stroke: rgb("#cecece"),radius: 20pt,clip: true)[
  #place(dx: 130pt,dy: -190pt,
    grid(
      columns: (1fr, 1fr),
      align: (center),
      box(
        width: 130%, height: 150%, stroke: none)[
        #echarm.render(width: 100%, height: 100%, options: (
          series: (
            name: "Debt Instrument Allocation",
            type: "pie",
            radius: ("40%", "50%"),
            avoidLabelOverlap: false,
            color: primaryColors,
            itemStyle: (
              borderColor: "#fff",
              borderWidth: 0,
            ),
            labelLine: (
              // "show": true,
            ),
            data: DbetMfInstrumentData
          ),
        )
      ),
    ]
  )
)

#place(
 dx: 30pt, dy: 290pt
)[
   #grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: -120pt,
  inset: 20pt,
  align: left,
  // Dynamically generate legend items
  ..DbetMfInstrumentData.enumerate().map(((i, item)) => {
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
]]
]

 //top right Sector Allocation(%)
#place(top+right,
  dx: 0pt, dy: 10pt
)[
  #box(
    width: 33.3%,
    height:48%,
   stroke: rgb("#cecece"),
    radius: 20pt,
    clip: true,
    inset: 20pt
  )[// Title
    #place(dx: 0pt,dy: 5pt)[
    #text("Sector Allocation(%)", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")
    ]
 #let EquityMFIndData =(
      
 (category :"Financial", value:51.94),
 
 (category :"Others", value:23.01),
 
 (category :"Sovereign", value:13.64),
 
 (category :"Construction", value:5.20),
 
 (category :"Energy", value:4.87),
 
 (category :"Communication", value:1.33),
 
)
#place(dx:-30pt,dy:20pt)[#echarm.render(width:                       fontSize:15,
, height: 400pt, options: (
          yAxis: (
          type: "category",
          inverse:true,
          data: EquityMFIndData.map((items)=> (items.category)),
          axisLine: ("show": false),
          axisTick: ("show": false),
          axisLabel: (align: right,
                    // padding: (0,12,0,0),
                      color: "#000000",fontSize:15,
                      fontWeight: "bold"),
          ),
        xAxis: (splitLine: ("show": false),
                type: "value",
                min: 0,
                max: 450.00,
                axisLine: ("show": false),
                axisLabel: ("show": false),
              ),
        series: (data: (EquityMFIndData.map((items)=> items.value)),
                type: "bar",
                color:primaryColors.at(0),
                stack:"a",
                name:"a",
                barWidth: 20,
                barGap: 15,
                label: (
                      "show": true,
                      position: "right",
                      color: "#000000",fontSize:15,
                      "formatter": "{c}%",
                      fontWeight:"bold"
                    ),
              )
      )
      )]
  ]
]

#let DebtMfAvgMatData = (
  
  (value: 100, name: "12+ months"),
  
 )

// Avg Maturity Allocation(%)
#place(bottom+left,
dx: 0pt,dy:0pt)[
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
            data: DebtMfAvgMatData
          ),
        )
      )
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
  ..DebtMfAvgMatData.enumerate().map(((i, item)) => {
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

// AMC Allocation(%)
#place(bottom+right,
  dx: 0pt, dy: 0pt
)[
  #box(
    width: 33.3%,
    height:48%,
   stroke: rgb("#cecece"),
    radius: 20pt,
    clip: true,
    inset: 20pt
  )[// Title
    #place(dx: 0pt,dy: 5pt)[
    #text("AMC Allocation(%)", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")
    ]
 #let EquityMFIndData =(
      
 (category :"ICICI Prudential Mutual Fund", value:37.61),
 
 (category :"HSBC Mutual Fund", value:36.98),
 
 (category :"Nippon India Mutual Fund", value:25.41),
 
)
#place(dx:10pt,dy:20pt)[#echarm.render(width: 2610pt, height: 400pt, options: (
          yAxis: (
          type: "category",
          inverse:true,
          data: EquityMFIndData.map((items)=> (items.category)),
          axisLine: ("show": false),
          axisTick: ("show": false),
          axisLabel: (align: right,
                    // padding: (0,12,0,0),
                      color: "#000000",fontSize:15,
                      fontWeight: "bold"),
          ),
        xAxis: (splitLine: ("show": false),
                type: "value",
                min: 0,
                max: 450.00,
                axisLine: ("show": false),
                axisLabel: ("show": false),
              ),
        series: (data: (EquityMFIndData.map((items)=> items.value)),
                type: "bar",
                color:primaryColors.at(0),
                stack:"a",
                name:"a",
                barWidth: 20,
                barGap: 15,
                label: (
                      "show": true,
                      position: "right",
                      color: "#000000",fontSize:15,
                      "formatter": "{c}%",
                      fontWeight:"bold"
                    ),
              )
      )
      )]
  ]
]




//  //bottom mid
#place(bottom+left,
  dx: 550pt, dy: 0pt
)[
  #let DebtQuantsData = (
    
    (Metric: "AverageMaturity", Values: [4.09]),
    
    (Metric: "Duration", Values: [0]),
    
    (Metric: "YTM", Values: [3.05]),
    


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
dx: 20pt,dy:30pt)[#text("Debt Quants", size: 30pt,  fill: rgb("0e496e"), weight: "extrabold")]

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
       
       table.cell( text("AverageMaturity")),
        table.cell(text("4.09")),
        
       table.cell( text("Duration")),
        table.cell(text("0")),
        
       table.cell( text("YTM")),
        table.cell(text("3.05")),
        
)
  ]
  ]
 


// Mutual Fund - Sector Wise Exposure

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
  
  
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Financial")]),
    table.cell(align(right)[#text("5,03,24,52,031.32")]),
    table.cell(align(right)[#text("31.59")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Others")]),
    table.cell(align(right)[#text("3,52,22,73,990.28")]),
    table.cell(align(right)[#text("22.11")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Services")]),
    table.cell(align(right)[#text("94,53,09,837.89")]),
    table.cell(align(right)[#text("5.93")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Healthcare")]),
    table.cell(align(right)[#text("71,03,35,678.27")]),
    table.cell(align(right)[#text("4.46")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Automobile")]),
    table.cell(align(right)[#text("70,59,39,777.75")]),
    table.cell(align(right)[#text("4.43")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Sovereign")]),
    table.cell(align(right)[#text("66,08,00,374.52")]),
    table.cell(align(right)[#text("4.15")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Energy")]),
    table.cell(align(right)[#text("62,57,03,873.59")]),
    table.cell(align(right)[#text("3.93")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Technology")]),
    table.cell(align(right)[#text("61,04,21,255.71")]),
    table.cell(align(right)[#text("3.83")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Construction")]),
    table.cell(align(right)[#text("45,40,15,771.32")]),
    table.cell(align(right)[#text("2.85")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Unclassified")]),
    table.cell(align(right)[#text("40,02,70,423.16")]),
    table.cell(align(right)[#text("2.51")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Materials")]),
    table.cell(align(right)[#text("39,22,22,620.43")]),
    table.cell(align(right)[#text("2.46")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Consumer Staples")]),
    table.cell(align(right)[#text("36,89,41,813.66")]),
    table.cell(align(right)[#text("2.32")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Capital Goods")]),
    table.cell(align(right)[#text("31,77,55,542.50")]),
    table.cell(align(right)[#text("1.99")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Communication")]),
    table.cell(align(right)[#text("29,51,48,385.92")]),
    table.cell(align(right)[#text("1.85")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Consumer Discretionary")]),
    table.cell(align(right)[#text("22,38,45,348.80")]),
    table.cell(align(right)[#text("1.41")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Chemicals")]),
    table.cell(align(right)[#text("20,54,61,372.34")]),
    table.cell(align(right)[#text("1.29")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Insurance")]),
    table.cell(align(right)[#text("19,03,11,907.40")]),
    table.cell(align(right)[#text("1.19")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Metals & Mining")]),
    table.cell(align(right)[#text("18,49,12,922.79")]),
    table.cell(align(right)[#text("1.16")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Textiles")]),
    table.cell(align(right)[#text("6,61,16,813.56")]),
    table.cell(align(right)[#text("0.42")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Diversified")]),
    table.cell(align(right)[#text("1,91,55,330.42")]),
    table.cell(align(right)[#text("0.12")]),
  


  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

)



// Transaction History - Mutual Funds

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
  #place()[== #text("Mutual Fund Analysis - Transaction History")]
]
#table(
    columns: (.7fr, 1.5fr, 1.5fr, .7fr, .9fr, .7fr, .7fr, .7fr, .7fr),

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


    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("26 Mar 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("17,081.4830")]),
    table.cell(align(right)[#text("29.2700")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("26 Mar 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("-17,081.4830")]),
    table.cell(align(right)[#text("29.2700")]),
    table.cell(align(right)[#text("-4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("Parag Parikh Flexi Cap Fund Regular-Growth")]),
    table.cell(align(left)[#text("12689762")]),
    table.cell(align(center)[#text("26 Mar 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("7,238.4720")]),
    table.cell(align(right)[#text("69.0719")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("HDFC Nifty 50 Index Fund -Growth")]),
    table.cell(align(left)[#text("20036786/57")]),
    table.cell(align(center)[#text("15 Apr 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("2,398.9830")]),
    table.cell(align(right)[#text("208.4112")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("Parag Parikh Flexi Cap Fund Regular-Growth")]),
    table.cell(align(left)[#text("12689762")]),
    table.cell(align(center)[#text("25 Apr 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("7,017.5970")]),
    table.cell(align(right)[#text("71.2459")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("15 May 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("16,522.6370")]),
    table.cell(align(right)[#text("30.2600")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("Parag Parikh Flexi Cap Fund Regular-Growth")]),
    table.cell(align(left)[#text("12689762")]),
    table.cell(align(center)[#text("27 May 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("6,849.2170")]),
    table.cell(align(right)[#text("72.9974")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("HDFC Nifty 50 Index Fund -Growth")]),
    table.cell(align(left)[#text("20036786/57")]),
    table.cell(align(center)[#text("05 Jun 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("2,353.8070")]),
    table.cell(align(right)[#text("212.4112")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("18 Jun 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("15,668.2860")]),
    table.cell(align(right)[#text("31.9100")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("Parag Parikh Flexi Cap Fund Regular-Growth")]),
    table.cell(align(left)[#text("12689762")]),
    table.cell(align(center)[#text("25 Jun 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("6,615.0100")]),
    table.cell(align(right)[#text("75.5819")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("15 Jul 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("14,991.7540")]),
    table.cell(align(right)[#text("33.3500")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("Parag Parikh Flexi Cap Fund Regular-Growth")]),
    table.cell(align(left)[#text("12689762")]),
    table.cell(align(center)[#text("16 Jul 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("32,094.6120")]),
    table.cell(align(right)[#text("77.8908")]),
    table.cell(align(right)[#text("24,99,875.01")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("HDFC Focused 30 Fund-Growth")]),
    table.cell(align(left)[#text("20036786/57")]),
    table.cell(align(center)[#text("16 Jul 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("11,724.7780")]),
    table.cell(align(right)[#text("213.2130")]),
    table.cell(align(right)[#text("24,99,875.01")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("16 Aug 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("14,705.1470")]),
    table.cell(align(right)[#text("34.0000")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("16 Sep 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("14,032.4170")]),
    table.cell(align(right)[#text("35.6300")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("HDFC Focused 30 Fund-Growth")]),
    table.cell(align(left)[#text("20036786/57")]),
    table.cell(align(center)[#text("10 Oct 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("22,624.8390")]),
    table.cell(align(right)[#text("220.9850")]),
    table.cell(align(right)[#text("49,99,750.01")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("Invesco India Flexi Cap Fund Regular - Growth")]),
    table.cell(align(left)[#text("31023974234")]),
    table.cell(align(center)[#text("11 Oct 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("2,63,839.0510")]),
    table.cell(align(right)[#text("18.9500")]),
    table.cell(align(right)[#text("49,99,750.02")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("15 Oct 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("14,280.9200")]),
    table.cell(align(right)[#text("35.0100")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("HDFC Focused 30 Fund-Growth")]),
    table.cell(align(left)[#text("20036786/57")]),
    table.cell(align(center)[#text("05 Nov 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("3,662.7030")]),
    table.cell(align(right)[#text("218.4070")]),
    table.cell(align(right)[#text("7,99,960.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("Invesco India Flexi Cap Fund Regular - Growth")]),
    table.cell(align(left)[#text("31023974234")]),
    table.cell(align(center)[#text("05 Nov 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("49,666.3910")]),
    table.cell(align(right)[#text("18.1200")]),
    table.cell(align(right)[#text("8,99,955.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("18 Nov 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("15,123.2610")]),
    table.cell(align(right)[#text("33.0600")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("16 Dec 2024")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("14,445.9690")]),
    table.cell(align(right)[#text("34.6100")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("15 Jan 2025")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("15,285.0810")]),
    table.cell(align(right)[#text("32.7100")]),
    table.cell(align(right)[#text("4,99,975.00")]),

    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Equities")]),
    table.cell(align(left)[#text("Equities: Mutual Funds/ETFs")]),
    table.cell(align(left)[#text("ICICI Prudential India Opportunities Fund - Growth")]),
    table.cell(align(left)[#text("22784851/86")]),
    table.cell(align(center)[#text("17 Feb 2025")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("15,412.3000")]),
    table.cell(align(right)[#text("32.4400")]),
    table.cell(align(right)[#text("4,99,975.00")]),

)

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
          [#image("./assets/images/Client_logo.png", width: 250pt,height: 40pt, fit: "contain")])
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
