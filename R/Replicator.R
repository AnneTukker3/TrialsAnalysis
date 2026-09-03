#' replicating accessions in a list n times
#' 
#' @param df A dataframe containing a list of accessions.
#' @param column the column header for the accession list.
#' @param replication The number of replications per accession.
#' 
#' @return A dataframe containing the original accession list and a replication column.
#' 
#' @example
#' \dontrun{
#' replicated_dataframe <- replicator(
#'  df = mydata,
#'  column = line, # column name, 
#'  replication = 5 # number of replications
#'  ) }
#'  @export
replicator <- function(df, column, replication){
  df |> dplyr::slice(rep(1:dplyr::n(), each = replication)) |> 
    dplyr::group_by({{column}}) |> #group the df based on "column"
    dplyr::mutate(rep = rep(1:replication)) #adding column 'rep' to df and replicating each "column" "replication" amount of times
}