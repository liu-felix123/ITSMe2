% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metrics_Terryn_2020.R
\name{tree_height}
\alias{tree_height}
\title{Tree height}
\usage{
tree_height(treedata, pc = NA)
}
\arguments{
\item{treedata}{Treedata field of a TreeQSM that is returned by
\code{\link{read_tree_qsm}}.}

\item{pc}{The tree point cloud as a data.frame with columns X,Y,Z. Output of
\code{\link{read_tree_pc}}. If the point cloud is not available NA is used
as input (default=NA).}
}
\value{
The tree height in meters.
}
\description{
Returns the tree height.
}
\details{
If the tree point cloud is available the tree_height calculation is based on
the point cloud (most accurate) with \code{\link{tree_height_pc}}. If the
tree point cloud is not available the tree height is based on the treeQSM
with \code{\link{tree_height_qsm}}.
}
\examples{
\dontrun{
qsm <- read_tree_qsm(QSM_path = "path/to/qsm.mat")
h <- tree_height(treedata = qsm$treedata)
pc_tree <- read_tree_pc(PC_path = "path/to/point_cloud.txt")
h <- tree_height(treedata = qsm$treedata, pc = pc_tree)
}
}
