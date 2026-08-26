
replicator <- function(df, column, replication){
  df |> dplyr::slice(rep(1:dplyr::n(), each = replication)) |> 
    dplyr::group_by({{column}}) |> #group the df based on "column"
    dplyr::mutate(rep = rep(1:replication)) #adding column 'rep' to df and replicating each "column" "replication" amount of times
}
replicator(table, line, 5) #testing if the replicator function works