#----------------------------------------------------------------------#
#------------ R   S H I N Y   A P P L I C A T I O N     ---------------#
#----------------------------------------------------------------------#

#define ui
webpage <- page_sidebar(
  title = "Nation Stock Exchange Index",
  sidebar = sidebar("Select time range to view the Index Trend",
                    position = "right",
                    selectInput(
                      "index",
                      "Index Name",
                      choices = list("NIFTY 50", "NIFTY LARGEMIDCAP 250"),
                      selected = "NIFTY 50"
                    ),
                    selectInput(
                      "select",
                      "Range",
                      choices = list("1 Week" = 1, "1 Month" = 2, "3 Months" = 3,"6 Months"=4,"1 Year"=5,"2 Year"=6,"3 Year"=7,"5 Year"=8,"Max"=9),
                      selected = 1
                    )),
  value_box(
    title = "Stock Market Trend",
    value = paste("NIFTY 50","&", "NIFTY LARGEMIDCAP 250","INDEX"),
    showcase = bs_icon("graph-up"),
    theme = "teal"
  ),
  card(
    card_header("Index Trend"),
    plotOutput("display"),
    textOutput("inference"),
    card_footer(foot1),
    card_footer(foot2)
  )
)

# Define server logic
server <- function(input, output) {
  output$display <- renderPlot({
    dataplot<-filter(indexdata,(range<=input$select & param==input$index))
    plot(dataplot$date, 
         dataplot$close, 
         type = "l",
         xlab="Time --->", 
         ylab="Price --->")
  })
  output$inference <-renderText("Displying data of Indian stock exchange")
}

# Run the app
shinyApp(ui = webpage, server = server)
