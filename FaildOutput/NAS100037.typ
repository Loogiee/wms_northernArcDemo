#import "@preview/echarm:0.2.0"
// Define colors and data

#let primaryColors = (
  "#1e90ff",-
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
    #text("ADITI  SHARMA", size: 20pt, weight: "medium", fill: black)
  ]
  #place(dx: 65%)[
    #text("RM Name : ", size: 20pt, weight: "medium", fill: blue)
    #text("Chanchal Beriwala", size: 20pt, weight: "medium", fill: black)
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

#let ReportDate = "03 Jul 2025"
#let ReportBeginDate = "06 Mar 2025"
#let ReportEndDate = "03 Jul 2025"
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
    #text(fill: rgb("#0B1A24"), weight: "bold",  size: 25pt, "ADITI  SHARMA / ")
    #text(fill: rgb("#D4567B"), weight: "bold",  size: 25pt, "NAS100037")
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
          #text("Chanchal Beriwala", fill: black, weight: "bold", size: 20pt)
        ])
      ],
    )
  ])

#set table(
  stroke: none,
inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
)

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
            #text("Chanchal.Beriwala@NorthernArc.com".replace(".", ".").replace("@", "@"), fill: black, weight: "bold", size: 20pt)
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
          #text("", fill: black, weight: "bold", size: 20pt)
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
    Value: "₹ 10,000",
    Date: "As on 03 Jul 2025",
    Colors :"#000",
    Image: "./assets/images/two.png"
  ),
  
  (
    description: "CURRENT VALUE",
    Value: "₹ 10,000",
    Date: "As on 03 Jul 2025",
    Colors :"#000",
    Image: "/assets/images/three.png"
  ),
  
  (
    description: "INFLOW MINUS OUTFLOW",
    Value: "₹ 10,000",
    Date: "Since Inception",
    Colors :"#000",
    Image: "./assets/images/one.png"
  ),
  
  (
    description: "PORTFOLIO RETURN(IRR)",
    Value: "0.00%",
    Date: "Since Inception",
    Colors :"#15ff00de",
    Image: "./assets/images/four.png"
  ),
  
  (
    description: "BENCHMARK RETURN(IRR)",
    Value: "0.00%",
    Date: "Since Inception",
    Colors :"#15ff00de",
    Image: "./assets/images/six.png"
  ),
  
  (
    description: "BenchmarkInfo_NIFTY 500",
    Value: "0.00%",
    Date: "",
    Colors :"#15ff00de",
    Image: "./assets/images/six.png"
  ),
  
  (
    description: "BenchmarkInfo_CRISIL Comp IDX",
    Value: "0.00%",
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
 
 
    
    ( value: 100,
      name: "Equities",
    ),
    
  

 

)

#let targetData = (
 
 

 
    
    ( value: 24,
      name: "Mutual Funds",
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
        
        table.cell(align(center)[#text("Sep 2024")]),
        table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("0"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("0"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("0"+"%")]),
        
        table.cell(align(center)[#text("Dec 2024")]),
        table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("0"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("0"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("0"+"%")]),
        
        table.cell(align(center)[#text("Mar 2025")]),
        table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("0"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("0"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("0"+"%")]),
        
        table.cell(align(center)[#text("Jun 2025")]),
        table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("39.99"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("0"+"%")]),
                table.hline(stroke: stroke(thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
        table.cell(align(right)[#text("39.99"+"%")]),
        
      ),
    )
    // Grid for the two chart
    // Legend for the charts
  ]
]
#place(bottom + right)[
  #let jsonData = (

  (
    Date: "Mar 2025",
    allocations: (
      
      (asset_group_name: "Equities", value: 100),
      
    )
  ),
 
  (
    Date: "Jun 2025",
    allocations: (
      
      (asset_group_name: "Equities", value: 100),
      
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

  ( value: 100,
     name: "Equities",
     total: 9999.5
  ),

)

#let currentData2 = (

  ( value: 100,
     name: "Equities",
     total: 9999.5
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
    table.cell(align(right)[#text(size: 18pt, "10,000")]),
    table.cell(align(right)[#text(size: 18pt, "100"+"%")]),
    table.cell(align(right)[#text(size: 18pt, "10,000")]),
    table.cell(align(right)[#text(size: 18pt, "100"+"%")]),
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
                (SecurityCategory: "Mutual Funds/ETFs", StartExposure: 9999.5/1000000, EndExposure: 9999.5/1000000),
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
  
    table.cell(align(left)[#text(size: 18pt, "Mutual Funds/ETFs")]),
    table.cell(align(right)[#text(size: 18pt, "10,000")]),
    table.cell(align(right)[#text(size: 18pt, "100"+"%")]),
    table.cell(align(right)[#text(size: 18pt, "10,000")]),
    table.cell(align(right)[#text(size: 18pt, "100"+"%")]),
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
    table.cell(align(right)[#text("9,999.50")]),
    table.cell(align(right)[#text("100")]),
    table.cell(align(right)[#text("9,999.50")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(left)[#text("Nifty 50 TRI")]),
    
  
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Sub Total",fill: heading0)],),
    table.cell(align(right)[#text("9,999.50",fill:heading0)]),
    table.cell(align(right)[#text("100",fill:heading0)]),
    table.cell(align(right)[#text("9,999.50",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(left)[#text("-",fill:heading0)]),
    
  
    
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Grand Total",fill: heading0)],),
    table.cell(align(right)[#text("9,999.50",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("9,999.50",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
    table.cell(align(right)[#text("0",fill:heading0)]),
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
      table.cell(colspan: 9, align(left)[#text("Mutual Funds/ETFs" )],fill: highlightBlue ),
      
      
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      table.cell(align(left)[#text("Equities: Factor" )] ),
      table.cell(align(right)[#text("9,999.50" )],),
      table.cell(align(right)[#text("9,999.50" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("0" )],),
      table.cell(align(right)[#text("100" )],),
    
  
    
       
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      
      
      table.cell(align(left)[#text("Sub Total" ,fill: heading0)],),
      table.cell(align(right)[#text("9,999.50" ,fill: heading0)],),
      table.cell(align(right)[#text("9,999.50" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("100" ,fill: heading0)],),
    
  
    
       
      table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
      
      
      table.cell(align(left)[#text("Grand Total" ,fill: heading0)],),
      table.cell(align(right)[#text("9,999.50" ,fill: heading0)],),
      table.cell(align(right)[#text("9,999.50" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
      table.cell(align(right)[#text("0" ,fill: heading0)],),
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
      table.cell(colspan: 10, align(left)[#text("Equities: Factor" )],fill: highlightBlue ),
      
      
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell([#text("HDFC NIFTY100 Low Volatility 30 Index Fund Regular-Growth")]),
    table.cell(align(left)[#text("2497783/95")]),
    table.cell(align(right)[#text("1,077.5800")]),
    table.cell(align(right)[#text("9,999.50")]),
    table.cell(align(right)[#text("9,999.50")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(center)[#text("06 Mar 2025")]),
    table.cell(align(right)[#text("120")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
      
    table.cell([#text("Sub Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("1,077.5800",fill :heading0)]),
    table.cell(align(right)[#text("9,999.50",fill :heading0)]),
    table.cell(align(right)[#text("9,999.50",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
    table.cell(align(center)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
      
    table.cell([#text("Grand Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("1,077.5800",fill :heading0)]),
    table.cell(align(right)[#text("9,999.50",fill :heading0)]),
    table.cell(align(right)[#text("9,999.50",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
    table.cell(align(center)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
  

)








#set page(paper: "a2", flipped: true,
margin: (top:80pt,left:15pt,right:15pt),
header: none
)
#set table(
  stroke: none,
inset: (top: 20pt, left: 10pt, right: 10pt, bottom: 20pt),
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
    table.cell(align(right)[#text("9,999.50")]),
    table.cell(align(right)[#text("9,999.50")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("0")]),
    table.cell(align(right)[#text("100")]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Sub Total",fill :heading0)]),
    table.cell(align(right)[#text("9,999.50",fill :heading0)]),
    table.cell(align(right)[#text("9,999.50",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
    table.cell(align(right)[#text("100",fill :heading0)]),
  

   
    
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    
    
    table.cell(align(left)[#text("Grand Total",fill :heading0)]),
    table.cell(align(right)[#text("9,999.50",fill :heading0)]),
    table.cell(align(right)[#text("9,999.50",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
    table.cell(align(right)[#text("0",fill :heading0)]),
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
    table.cell(align(left)[#text("Arun Agarwal")]),
    table.cell(align(left)[#text("HDFC Mutual Fund")]),
    table.cell(align(right)[#text("4,999.75")]),
    table.cell(align(right)[#text("50.00")]),
  


  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Nirman S. Morakhia")]),
    table.cell(align(left)[#text("HDFC Mutual Fund")]),
    table.cell(align(right)[#text("4,999.75")]),
    table.cell(align(right)[#text("50.00")]),
  



  
    table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Total",fill :heading0)]),
    table.cell(align(left)[#text("-",fill :heading0)]),
    table.cell(align(right)[#text("9,999.50",fill :heading0)]),
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
 
  ( value: 100,
     name: "Factor"
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
      
 (category :"Others", value:30.79),
 
 (category :"Drugs & Pharma", value:12.96),
 
 (category :"Software", value:11.90),
 
 (category :"Banking", value:10.94),
 
 (category :"Household & Personal Products", value:7.04),
 
 (category :"Cars & Multi Utility Vehicles", value:6.55),
 
 (category :"Misc. Fin.services", value:4.47),
 
 (category :"Dairy products", value:4.24),
 
 (category :"Paints & Varnishes", value:3.81),
 
 (category :"Bakery & Milling Prod.", value:3.68),
 
 (category :"Oil Refineries & Marketing", value:3.62),
 
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
                      fontSize:16,
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
                      fontSize:16,
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
      
 (category :"HDFC Mutual Fund", value:100),
 
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
                      fontSize:16,
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
                      fontSize:16,
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

    (Metric: "P/E", Values: [27.56]),

    (Metric: "P/B", Values: [4.53]),

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
    table.cell(align(left)[#text("Consumer Staples")]),
    table.cell(align(right)[#text("1,84,490.78")]),
    table.cell(align(right)[#text("18.45")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Healthcare")]),
    table.cell(align(right)[#text("1,60,591.97")]),
    table.cell(align(right)[#text("16.06")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Financial")]),
    table.cell(align(right)[#text("1,54,092.29")]),
    table.cell(align(right)[#text("15.41")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Technology")]),
    table.cell(align(right)[#text("1,18,994.05")]),
    table.cell(align(right)[#text("11.90")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Automobile")]),
    table.cell(align(right)[#text("1,18,194.09")]),
    table.cell(align(right)[#text("11.82")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Materials")]),
    table.cell(align(right)[#text("69,496.52")]),
    table.cell(align(right)[#text("6.95")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Energy")]),
    table.cell(align(right)[#text("36,198.19")]),
    table.cell(align(right)[#text("3.62")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Communication")]),
    table.cell(align(right)[#text("35,798.21")]),
    table.cell(align(right)[#text("3.58")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Insurance")]),
    table.cell(align(right)[#text("34,298.29")]),
    table.cell(align(right)[#text("3.43")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Consumer Discretionary")]),
    table.cell(align(right)[#text("33,198.34")]),
    table.cell(align(right)[#text("3.32")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Chemicals")]),
    table.cell(align(right)[#text("29,298.54")]),
    table.cell(align(right)[#text("2.93")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Construction")]),
    table.cell(align(right)[#text("25,098.74")]),
    table.cell(align(right)[#text("2.51")]),
  

  
  
     table.hline(stroke: (thickness: 0.1pt,  paint:rgb("#cdcdcd"))),
    table.cell(align(left)[#text("Others")]),
    table.cell(align(right)[#text("199.99")]),
    table.cell(align(right)[#text("0.02")]),
  


  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

  
  

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
    table.cell(align(left)[#text("HDFC NIFTY100 Low Volatility 30 Index Fund Regular-Growth")]),
    table.cell(align(left)[#text("2497783/95")]),
    table.cell(align(center)[#text("06 Mar 2025")]),
    table.cell(align(left)[#text("MFSUB")]),
    table.cell(align(right)[#text("1,077.5790")]),
    table.cell(align(right)[#text("9.2796")]),
    table.cell(align(right)[#text("9,999.50")]),

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
