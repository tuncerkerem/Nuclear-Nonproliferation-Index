library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("World Nuclear Non-Proliferation Index"),
  
  sidebarLayout( 
    sidebarPanel(selectInput("mapnames", 
                             label = "Choose a map to display",
                             choices = list("Nuclear Program Status",
                                            "Nuclear Weapons Count", 
                                            "Defense Spending Score",
                                            "Nuclear Weapons Treaty Score", 
                                            "Nuclear Energy Safety Treaty Score",
                                            "Nuclear Energy Score"),
                             selected = "Nuclear Program Status")),
    mainPanel(
      img(src = "k1proj.png", height = 1400, width = 400),
      uiOutput("map")
      
    )))

# Define server logic ----

addResourcePath("tmpuser", getwd())
server <- function(input, output) {
  getIncludeHTML<-reactive({if (input$mapnames=="Nuclear Program Status"){return(tags$iframe(seamless="seamless", src= "tmpuser/nuclearstatus.html", width=1400, height=800, frameBorder = 0))
  } else if(input$mapnames=="Nuclear Weapons Amount"){return(tags$iframe(seamless="seamless", src= "tmpuser/nuclearweaponamount.html", width=1400, height=800, frameBorder = 0))
  } else if(input$mapnames=="Defense Spending Score"){return(tags$iframe(seamless="seamless", src= "tmpuser/defenseratio.html", width=1400, height=800, frameBorder = 0))
  } else if(input$mapnames=="Nuclear Treaty Score"){return(tags$iframe(seamless="seamless", src= "tmpuser/treaty.html", width=1400, height=800, frameBorder = 0))
  } else if(input$mapnames=="Nuclear Safety Treaty Score"){return(tags$iframe(seamless="seamless", src= "tmpuser/safetytreaty.html", width=1400, height=800, frameBorder = 0))
  } else if(input$mapnames=="Nuclear Energy Score"){return(tags$iframe(seamless="seamless", src= "tmpuser/nuclearenergy.html", width=1400, height=800, frameBorder = 0))
  } else {return(tags$iframe(seamless="seamless", src= "tmpuser/include.html", width=800, height=800, frameBorder = 0))}})
  
  output$map<-renderUI({getIncludeHTML()})
  }
# Run the app ----
shinyApp(ui = ui, server = server)
