library(shiny)
library(shinythemes)

ui <- fluidPage(theme = shinytheme("sandstone"),
                titlePanel("Hypergeometric Calculator"),
                sidebarLayout(
                  sidebarPanel(
                    numericInput("deck_size", "Deck Size:", value = 60),
                    numericInput("num_copies_interest", "Number of Copies of Card:", value = 4),
                    numericInput("cards_drawn", "Cards Drawn:", value = 7),
                    numericInput("successes_wanted", "Successes Wanted:", value = 1),
                    actionButton("calculate", "Calculate"),
                    br(),
                    br(),
                    textOutput("result")
                  ),
                  mainPanel(
                    br(),
                    tableOutput("history_table"),
                    plotOutput("prob_plot")
                  )
                )
)

server <- function(input, output) {
  history <- reactiveValues(data = data.frame(
    Deck_Size = numeric(),
    Num_Copies_Interest = numeric(),
    Cards_Drawn = numeric(),
    Successes_Wanted = numeric(),
    Probability = numeric()
  ))
  
  observeEvent(input$calculate, {
    prob <- dhyper(input$successes_wanted, input$num_copies_interest, 
                   input$deck_size - input$num_copies_interest, 
                   input$cards_drawn)
    
    new_row <- data.frame(
      Deck_Size = input$deck_size,
      Num_Copies_Interest = input$num_copies_interest,
      Cards_Drawn = input$cards_drawn,
      Successes_Wanted = input$successes_wanted,
      Probability = prob
    )
    
    history$data <- rbind(history$data, new_row)
  })
  
  output$history_table <- renderTable({
    history$data
  })
  
  output$result <- renderText({
    prob <- dhyper(input$successes_wanted, input$num_copies_interest, 
                   input$deck_size - input$num_copies_interest, 
                   input$cards_drawn)
    
    paste("Probability of getting exactly", input$successes_wanted, 
          "of the card:", prob)
  })
  
  output$prob_plot <- renderPlot({
    if (nrow(history$data) > 0) {
      barplot(height = history$data$Probability,
              names.arg = paste("Row", seq_len(nrow(history$data))),
              xlab = "Calculations",
              ylab = "Probability",
              main = "Probabilities of Calculations",
              col = "skyblue",
              border = "black")
    }
  })
}

shinyApp(ui = ui, server = server)
