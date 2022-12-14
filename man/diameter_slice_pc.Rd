% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/basic_metrics_pc.R
\name{diameter_slice_pc}
\alias{diameter_slice_pc}
\title{Diameter at certain height point cloud}
\usage{
diameter_slice_pc(pc, slice_height = 0.1, slice_thickness = 0.06, plot = FALSE)
}
\arguments{
\item{pc}{The tree point cloud as a data.frame with columns X,Y,Z. Output of
\code{\link{read_tree_pc}}.}

\item{slice_height}{Numeric value (default = 1.3) that determines the height
above the lowest point of the point cloud at which the diameter is
measured.}

\item{slice_thickness}{Numeric value (default = 0.6) that determines the
thickness of the slice which is used to measure the diameter.}

\item{plot}{Logical (default=FALSE), indicates if the optimized circle
fitting is plotted.}
}
\value{
A list with the diameter at a specified height (numeric value), the
residual between circle fit and the points, the center of the circle fit,
and the functional diameter calculated from the concave hull fitting. Also
optionally (plot=TRUE) plots the circle fitting on the horizontal slice.
}
\description{
Returns the diameter at a certain height of a tree measured from a tree point
cloud.
}
\details{
The diameter is measured of the optimal circle fitted through a horizontal
slice. A least squares circle fitting algorithm was applied to find the
optimal fit. The height and thickness of the slice can be specified using
slice_height and slice_thickness parameters. Additionally, the functional
diameter is calculated. For this the area of the concave hull with (concavity
4) is determined on the slice. From this area the diameter is determined as
the diameter of a circle with this area. This function is also a Support
function used to determine the DBH from a tree point cloud with
\code{\link{dbh_pc}}.
}
\examples{
\dontrun{
# Read tree point cloud and calculate the diameter
pc_tree <- read_tree_pc(PC_path = "path/to/point_cloud.txt")
diameter <- diameter_slice_pc(pc = pc_tree)
# and plot the circle fitting
output <- diameter_slice_pc(pc = pc_tree, plot = TRUE)
diameter <- output$diameter
residual <- output$R2
center <- out$center
}
}
