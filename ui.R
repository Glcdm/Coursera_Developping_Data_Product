

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting Miles/(US) gallon"),
  
  # Sidebar with 3 sliders for the three input of our regression model 
  sidebarLayout(
    sidebarPanel(
      p("Make your selections and the app will give you the expected miles per gallon based on your inputs :"),
      #input am
      selectInput("am", 
                   label = "Transmission :",
                   choices = c("Automatic", "Manual"),
                   selected = "Percent White"),
      #input wt 
       sliderInput("wt",
                   "Weight (1000 lbs) :",
                   min = 1,
                   max = 5,
                   value = 2.5, step=0.05),
      #input qsec
       sliderInput("qsec",
                   "1/4 mile time :",
                   min = 10,
                   max = 25,
                   value = 18, step=0.1)
       
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
#Show the input given by the user
       strong(p("You selected as Transmission :")),
       em(textOutput("in_am")),
       
       strong(p("You selected as Weight (1000 lbs) :")),
       em(textOutput("in_wt")),
       
       strong(p("You selected as 1/4 mile time :")),
       em(textOutput("in_qsec")),
#Show the result of the prediction       
       strong(p("Here is the expected value for Miles/(US) per gallon based on your inputs :")),
       em(textOutput("Regression_Model"))
      
    )
  )
))
