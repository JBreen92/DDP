library(shiny)
library(ggplot2)


shinyUI(fluidPage(
    titlePanel("Maine Towns Plot"),
    sidebarLayout(
        sidebarPanel(
            checkboxInput("color_county", "Color/Uncolor by County", value = FALSE),
            checkboxInput("order_pop", "Order/Unorder by Population", value = FALSE)
        ),
        mainPanel(
            plotOutput("plot1")
        )
    )
))