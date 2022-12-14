% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/basic_metrics_qsm.R
\name{dbh_qsm}
\alias{dbh_qsm}
\title{Diameter at breast height TreeQSM}
\usage{
dbh_qsm(treedata)
}
\arguments{
\item{treedata}{Treedata field of a TreeQSM that is returned by
\code{\link{read_tree_qsm}}.}
}
\value{
The DBH of the TreeQSM in meters.
}
\description{
Extracts the DBH from the treedata of a TreeQSM.
}
\details{
The DBH is calculated as the diameter of the cylinder in the QSM at the right
height (cylinder at 1.3 m). If the trunk was modeled with triangulation the
DBH is calculated as mean length of the diagonals in the triangulation.
}
\examples{
\dontrun{
# Read tree qsm and extract DBH
qsm <- read_tree_qsm(QSM_path = "path/to/qsm.mat")
dbh <- dbh_qsm(treedata = qsm$treedata)
}
}
