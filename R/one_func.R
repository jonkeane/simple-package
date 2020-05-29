#' Get random airline(s)
#'
#' @param n the number of airlines to get (defaults to 1)
#'
#' @return a dataframe with airlines from the DB
#' @export
get_an_airline <- function(n = 1) {
    con <- DBI::dbConnect(RPostgres::Postgres(), dbname = "nycflights")
    on.exit(DBI::dbDisconnect(con))

    query <- paste0(
        "SELECT carrier, name FROM rpostgres.airlines ",
        " ORDER BY random() LIMIT ",
        n
    )

    out <- dbGetQuery(con, query)

    if (out$name == "Testy McAirline") {
        stop("This is the test airline \U1F643")
  }

  return(out)
}