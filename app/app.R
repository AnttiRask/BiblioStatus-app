cat("Starting app...\n")
tryCatch(
  {
    source("ui.R")
    cat("Loaded ui.R\n")
    source("server.R")
    cat("Loaded server.R\n")
    shinyApp(ui = ui, server = server)
  },
  error = function(e) {
    cat("CRASH DURING INIT:\n")
    cat(conditionMessage(e), "\n")
    traceback()
    stop("App failed to start")
  }
)
