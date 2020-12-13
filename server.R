library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    places <- data.frame(names = c("Norway", "Paris", "DenMark", "Naples", "Sweden", "Poland", "Mexico", "Peru", 
                                   "China"), 
                         lat = c(44.2140, 44.2598, 43.9703, 43.9853, 44.1333, 44.0606, 44.5571, 44.5065, 44.4787), 
                         lng = c(-70.5448, -70.5006, -70.8034, -70.6180, -70.8229, -70.3937, -70.5434, -70.4063, 
                                 -69.5173), 
                         county = c("Oxford", "Oxford", "Oxford", "Cumberland", "Oxford", "Androscoggin", "Oxford", 
                                    "Oxford", "Kennebec"), 
                         pop = c(4959, 5187, 1146, 3954, 391, 5612, 2681, 1541, 4328))
    
    places$county <- as.factor(places$county)
    
    plot1 <- ggplot(places, aes(names, pop)) + geom_bar(stat = "identity")
    
    plot2 <- ggplot(places, aes(names, pop, fill = county)) + geom_bar(stat = "identity")
    
    plot3 <- ggplot(places, aes(x = reorder(names, -pop), pop)) + geom_bar(stat = "identity") + labs(x = "names")
    
    plot4 <- ggplot(places, aes(x = reorder(names, -pop), pop, fill = county)) + geom_bar(stat = "identity") + labs(x = "names")
                
    output$plot1 <- renderPlot({
        if(input$color_county == FALSE & input$order_pop == FALSE){plot1}
        else if(input$color_county == TRUE & input$order_pop == FALSE){plot2}
        else if(input$color_county == FALSE & input$order_pop == TRUE){plot3}
        else{plot4}
    })
})