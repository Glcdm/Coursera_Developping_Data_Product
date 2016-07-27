

library(shiny)

shinyServer(function(input, output) {
#We create 3 text we have in input as outputs
  output$in_am <-renderText({input$am})
  output$in_wt <-renderText({input$wt})
  output$in_qsec <-renderText({input$qsec})
  
#We create our regression model based on the three inputs am, wt and qsec then we create 
#an output with the result
    output$Regression_Model <-renderText({
      data(mtcars)
      #We transform am variable to put it as a factor variable
      mtcars$am2<-factor(mtcars$am, labels=c("Automatic","Manual"))
      #We create our model
      fit2<-lm(mpg~am+wt+qsec-1, data=mtcars)
      #We create the data set we will predict on
      fit2.new <- data.frame(am=numeric(),
                             wt=numeric(),
                             qsec=numeric())
      if(input$am=="Manual"){
        fit2.new[1,1]<-1
      } else {
        fit2.new[1,1]<-0
      }
      fit2.new[1,2]<-input$wt
      fit2.new[1,3]<-input$qsec
      names(fit2.new)=c("am", "wt", "qsec")
      #This is the out put :
      as.character(predict(fit2, newdata=fit2.new))
    
  })
  
})
