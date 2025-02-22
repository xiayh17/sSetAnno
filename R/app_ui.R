#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
# dark_theme <- fresh::create_theme(
#   fresh::bs4dash_vars(
#     navbar_light_color = "#bec5cb",
#     navbar_light_active_color = "#FFF",
#     navbar_light_hover_color = "#FFF"
#   ),
#   fresh::bs4dash_yiq(contrasted_threshold = 255, text_dark = "#FFF", text_light = "#272c30"),
#   fresh::bs4dash_layout(main_bg = "#353c42"),
#   fresh::bs4dash_sidebar_dark(
#     bg = "#272c30", color = "#bec5cb", hover_color = "#FFF",
#     submenu_bg = "#272c30", submenu_color = "#FFF", submenu_hover_color = "#FFF"
#   ),
#   fresh::bs4dash_status(dark = "#272c30"),
#   fresh::bs4dash_color(gray_900 = "#FFF", white = "#272c30")
# )
thematic::thematic_shiny()
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    bs4Dash::dashboardPage(
      dark = TRUE,
      #freshTheme = dark_theme,
      title = "eSetAnno",
      header = bs4Dash::dashboardHeader(
        title = bs4Dash::dashboardBrand(
          title = "eSetAnno",
          color = "primary",
          href = "http://www.biotrainee.com/",
          image = "https://cdn.jsdelivr.net/gh/xiayh17/Figs@main/uPic/Snipaste_2021-03-02_20-02-43.png",
        )
      ),
      sidebar = bs4Dash::dashboardSidebar(
        bs4Dash::sidebarMenu(
          bs4Dash::menuItem("Files Upload", tabName = "upload",icon = icon('file-upload')),
          bs4Dash::menuItem("Quality Control", tabName = "qc",icon = icon('hand-spock')),
          bs4Dash::menuItem("Differentially Expressed Genes", tabName = "deg",icon = icon('dna')),
          bs4Dash::menuItem("Gene Set Annotation", tabName = "gsaanno",icon = icon('random')),
          bs4Dash::menuItem("Gene Set Enrichment Analysis", tabName = "gsea",icon = icon('globe-americas')),
          bs4Dash::menuItem("Analysis Report", tabName = "report",icon = icon('file-contract'))
          )
      ),
      #controlbar = bs4Dash::dashboardControlbar(),
      #footer = bs4Dash::dashboardFooter(),
      body = bs4Dash::dashboardBody(
        bs4Dash::tabItems(
          bs4Dash::tabItem(tabName = "upload",mod_upload_ui("upload_ui_1")),
          bs4Dash::tabItem(tabName = "qc",mod_qc_ui("qc_ui_1")),
          bs4Dash::tabItem(tabName = "deg",mod_deg_ui("deg_ui_1")),
          bs4Dash::tabItem(tabName = "gsaanno",mod_gsaanno_ui("gsaanno_ui_1")),
          bs4Dash::tabItem(tabName = "gsea",mod_gsea_ui("gsea_ui_1")),
          bs4Dash::tabItem(tabName = "report",mod_report_ui("report_ui_1"))
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'eSetAnno'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

