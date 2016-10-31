#' @export
cluster.wild <- function(mod, dat, cluster, ...) {
    UseMethod("cluster.wild")
}

#' @export
cluster.im <- function(mod, dat, cluster, ...) {
    UseMethod("cluster.im")
}

#' @export
cluster.bs <- function(mod, dat, cluster, ...) {
    UseMethod("cluster.bs")
}
