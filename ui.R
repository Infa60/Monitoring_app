###Library
library(shiny)
library(shinydashboard)
library(shinyjs)
library(DT)
library(plotly)

ui <- dashboardPage(
  #Couleur de la page
  skin = "red",
  
  #Gestion des paramètres pour la partie haute
  dashboardHeader(title = "Application de Monitoring",
                  titleWidth = 450),
  
  #Paramètres de sidebar
  dashboardSidebar(
    width = 350,
    sidebarMenu(
      menuItem("Analyse", tabName = "analyse", icon = icon("fa-sharp fa-solid fa-magnifying-glass-chart")),
      menuItem("Donnée", tabName = "donnee", icon = icon("fa-sharp fa-solid fa-database")),
      menuItem("Gestion donnée", tabName = "gestion", icon = icon("fa-sharp fa-solid fa-download"))
    ),
    # Correctement placer le bouton de téléchargement après la fermeture de sidebarMenu
    div(style = "display: flex; justify-content: center; padding-top: 20px;", 
        downloadButton("downloadPDF", "Télécharger le PDF", style = "margin: auto;"))
  ),
                     
  #Paramétres centraux
  dashboardBody(tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),
  tabItems(
    tabItem(
      "analyse",
      fluidRow(column(
        width = 12,
        box(title = "Analyse par athlètes",
            fluidRow(
              column(width = 6, uiOutput("selectAthlete")),
              column(width = 6, uiOutput("selectDate"))
            ))
      )),
      fluidRow(column(
        width = 12,
        box(width = 12, title = "Données anthropométriques",
            DTOutput("tableau_anth"))
      )),
      fluidRow(column(width = 12, titlePanel(
        h3("Performances", style = "color: #222d32; font-size: 40px; text-align: center;")
      ))),
      fluidRow(column(width = 12,
                      fluidRow(
                        box(
                          width = 3,
                          plotlyOutput("graph_CMJ", width = "100%", height = "400px")
                        ),
                        box(
                          width = 3,
                          plotlyOutput("graph_FC_recup", width = "100%", height = "400px")
                        ),
                        box(
                          width = 3,
                          plotlyOutput("graph_IFT30_15", width = "100%", height = "400px")
                        ),
                        box(
                          width = 3,
                          plotlyOutput("graph_SJ", width = "100%", height = "400px")
                        )
                      ))),
      fluidRow(column(width = 12, titlePanel(
        h3("Serum Sang", style = "color: #222d32; font-size: 40px; text-align: center;")
      ))),
      fluidRow(column(
        width = 12,
        fluidRow(
          box(
            width = 3,
            plotlyOutput("graph_Azote_ureique", width = "100%", height = "400px")
          ),
          box(
            width = 3,
            plotlyOutput("graph_Magnesium", width = "100%", height = "400px")
          ),
          box(
            width = 3,
            plotlyOutput("graph_Bilirubine", width = "100%", height = "400px")
          ),
          box(
            width = 3,
            plotlyOutput(
              "Lactate_deshydrogenase",
              width = "100%",
              height = "400px"
            )
          ),
          box(
            width = 3,
            plotlyOutput("Creatine_kinase", width = "100%", height = "400px")
          ),
          box(
            width = 3,
            plotlyOutput("Acide_Urique", width = "100%", height = "400px")
          ),
          box(
            width = 3,
            plotlyOutput("Proteine_C_reactive", width = "100%", height = "400px")
          ),
          box(width = 3,
              plotlyOutput(
                "Sodium", width = "100%", height = "400px"
              )),
          box(
            width = 3,
            plotlyOutput("Potassium", width = "100%", height = "400px")
          ),
          box(width = 3,
              plotlyOutput(
                "Calcium", width = "100%", height = "400px"
              )),
          box(
            width = 3,
            plotlyOutput("Myoglobine", width = "100%", height = "400px")
          ),
          box(
            width = 3,
            plotlyOutput("Cholesterol", width = "100%", height = "400px")
          ),
          box(width = 3,
              plotlyOutput(
                "HDL", width = "100%", height = "400px"
              )),
          box(width = 3,
              plotlyOutput(
                "LDL", width = "100%", height = "400px"
              )),
          box(
            width = 3,
            plotlyOutput("Triglicerides", width = "100%", height = "400px")
          ),
          box(width = 3,
              plotlyOutput(
                "Glucose", width = "100%", height = "400px"
              ))
        )
      )),
      fluidRow(column(width = 12, titlePanel(
        h3("Analyse Sang totale", style = "color: #222d32; font-size: 40px; text-align: center;")
      ))),
      fluidRow(column(
        width = 12,
        fluidRow(
          box(width = 3,
              plotlyOutput(
                "WBC", width = "100%", height = "400px"
              )),
          box(
            width = 3,
            plotlyOutput("Neutrophiles", width = "100%", height = "400px")
          ),
          box(
            width = 3,
            plotlyOutput("Lymphocytes", width = "100%", height = "400px")
          ),
          box(
            width = 3,
            plotlyOutput("Monocytes", width = "100%", height = "400px")
          ),
          box(
            width = 3,
            plotlyOutput("Eosinophile", width = "100%", height = "400px")
          ),
          box(
            width = 3,
            plotlyOutput("Basophile", width = "100%", height = "400px")
          ),
          box(
            width = 3,
            plotlyOutput("Plaquettes", width = "100%", height = "400px")
          ),
          box(width = 3,
              plotlyOutput(
                "RBC", width = "100%", height = "400px"
              )),
          box(
            width = 3,
            plotlyOutput("Hemoglobine", width = "100%", height = "400px")
          ),
          box(width = 3,
              plotlyOutput(
                "MCV", width = "100%", height = "400px"
              )),
          box(
            width = 3,
            plotlyOutput("Hematocrite", width = "100%", height = "400px")
          ),
          box(width = 3,
              plotlyOutput(
                "MCH", width = "100%", height = "400px"
              )),
          box(width = 3,
              plotlyOutput(
                "MCHC", width = "100%", height = "400px"
              ))
        )
      )),
      fluidRow(column(width = 12, titlePanel(
        h3("Indice hémato-fer", style = "color: #222d32; font-size: 40px; text-align: center;")
      ))),
      fluidRow(column(width = 12,
                      fluidRow(
                        box(width = 3,
                            plotlyOutput(
                              "Fer", width = "100%", height = "400px"
                            )),
                        box(
                          width = 3,
                          plotlyOutput("Transferrine", width = "100%", height = "400px")
                        ),
                        box(
                          width = 3,
                          plotlyOutput("Ferritine", width = "100%", height = "400px")
                        ),
                        box(
                          width = 3,
                          plotlyOutput("Sat_transferrine", width = "100%", height = "400px")
                        )
                      ))),
      fluidRow(column(width = 12, titlePanel(
        h3("Hormones", style = "color: #222d32; font-size: 40px; text-align: center;")
      ))),
      fluidRow(column(width = 12,
                      fluidRow(
                        box(
                          width = 4,
                          plotlyOutput("Testosterone", width = "100%", height = "400px")
                        ),
                        box(
                          width = 4,
                          plotlyOutput("Cortisol", width = "100%", height = "400px")
                        ),
                        box(width = 4,
                            plotlyOutput(
                              "IL_6", width = "100%", height = "400px"
                            ))
                      ))),
      fluidRow(column(width = 12, titlePanel(
        h3("Vitamines", style = "color: #222d32; font-size: 40px; text-align: center;")
      ))),
      fluidRow(column(
        width = 12,
        fluidRow(
          box(width = 3,
              plotlyOutput(
                "Retinol", width = "100%", height = "400px"
              )),
          box(
            width = 3,
            plotlyOutput("Beta_carotene", width = "100%", height = "400px")
          ),
          box(width = 3,
              plotlyOutput(
                "Vit_E", width = "100%", height = "400px"
              )),
          box(width = 3,
              plotlyOutput(
                "Vit_B6", width = "100%", height = "400px"
              )),
          box(width = 3,
              plotlyOutput(
                "Vit_B12", width = "100%", height = "400px"
              )),
          box(width = 3,
              plotlyOutput(
                "Vit_C", width = "100%", height = "400px"
              )),
          box(
            width = 3,
            plotlyOutput(
              "e1_25_dihydroxyvitamine_D",
              width = "100%",
              height = "400px"
            )
          )
        )
      ))
      
    ),
    
    tabItem("donnee",
            fluidPage(DTOutput("tableau_data"))),
    tabItem("gestion")
  ))
)