% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metrics_Terryn_2020.R
\name{relative_volume_ratio_qsm}
\alias{relative_volume_ratio_qsm}
\title{Relative volume ratio TreeQSM}
\usage{
relative_volume_ratio_qsm(cylinder, treedata)
}
\arguments{
\item{cylinder}{Cylinder field of a TreeQSM that is returned by
\code{\link{read_tree_qsm}}.}

\item{treedata}{Treedata field of a TreeQSM that is returned by
\code{\link{read_tree_qsm}}.}
}
\value{
The relative volume ratio.
}
\description{
Calculates the relative volume ratio from a TreeQSM.
}
\details{
The relative volume ratio is defined as "Ratio of the percentage volume
within 80 to 90\% of the tree height and the percentage volume within 0 to 10\%
of the tree height" (Terryn et al., 2020).
}
\examples{
\dontrun{
# Read tree qsm and calculate the relative volume ratio
qsm <- read_tree_qsm(QSM_path = "path/to/qsm.mat")
rvr <- relative_volume_ratio_qsm(
  cylinder = qsm$cylinder,
  treedata = qsm$treedata
)
}
}
\references{
Terryn, L., Calders, K., Disney, M., Origo, N., Malhi, Y.,
Newnham, G., ... & Verbeeck, H. (2020). Tree species classification using
structural features derived from terrestrial laser scanning. ISPRS Journal
of Photogrammetry and Remote Sensing, 168, 170-181.
}
