#' TreeQSM position
#'
#' Returns the (X,Y)-position of a treeQSM based on the start position of the
#' first cylinder that is higher than 1.3 m above ground.
#'
#' @param cylinder Cylinder field of a TreeQSM that is returned by
#'   \code{\link{read_tree_qsm}}.
#'
#' @return Numeric with the XY coordinates (location) of the tree stem.
#' @export
#'
#' @examples
#' \dontrun{
#' # Read tree qsm and calculate tree position
#' qsm <- read_tree_qsm(QSM_path = "path/to/qsm.mat")
#' pos <- tree_position_qsm(cylinder = qsm$cylinder)
#' }
tree_position_qsm <- function(cylinder) {
  j <- 0
  while (sum(cylinder$length[1:(j + 1)]) < 1.3) {
    j <- j + 1
  }
  x_location <- cylinder$start[j + 1, 1]
  y_location <- cylinder$start[j + 1, 2]
  return(c(x_location, y_location))
}

#' Total cylinder length TreeQSM
#'
#' Extracts the total cylinder length from the treedata of a TreeQSM.
#'
#' @param treedata Treedata field of a TreeQSM that is returned by
#'   \code{\link{read_tree_qsm}}.
#'
#' @return The total length of all the cylinders (branch and trunk) of
#'   a TreeQSM in meters.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Read tree qsm and extract total cylinder length
#' qsm <- read_tree_qsm(QSM_path = "path/to/qsm.mat")
#' tot_len <- total_cyl_length_qsm(treedata = qsm$treedata)
#' }
total_cyl_length_qsm <- function(treedata) {
  return(treedata$TotalLength[1])
}

#' Total tree volume TreeQSM
#'
#' Extracts the total tree volume from the treedata of a TreeQSM.
#'
#' @param treedata Treedata field of a TreeQSM that is returned by
#'   \code{\link{read_tree_qsm}}.
#'
#' @return The total volume of the TreeQSM in liters. If the trunk was modeled
#'   with triangulation the total volume is the sum of the triangulated volume
#'   of the stem (bottom), the volume of the stem cylinder (top) and the volume
#'   of the branch cylinders.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Read tree qsm and extract tree volume
#' qsm <- read_tree_qsm(QSM_path = "path/to/qsm.mat")
#' tot_vol <- tree_volume_qsm(treedata = qsm$treedata)
#' }
tree_volume_qsm <- function(treedata) {
  if (length(treedata) > 83) {
    volume <- treedata$MixTotalVolume[1]
  } else {
    volume <- treedata$TotalVolume[1]
  }
  return(volume)
}

#' Total trunk volume TreeQSM
#'
#' Extracts the total trunk volume from the treedata of a TreeQSM.
#'
#' @param treedata Treedata field of a TreeQSM that is returned by
#'   \code{\link{read_tree_qsm}}.
#'
#' @return The total trunk volume of the TreeQSM in liters. If the trunk was
#'   modelled with triangulation the total volume is the sum of the triangulated
#'   volume of the stem (bottom) and the volume of the stem cylinder (top).
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Read tree qsm and extract trunk volume
#' qsm <- read_tree_qsm(QSM_path = "path/to/qsm.mat")
#' trunkvol <- trunk_volume_qsm(treedata = qsm$treedata)
#' }
trunk_volume_qsm <- function(treedata) {
  if (length(treedata) > 83) {
    volume <- treedata$MixTrunkVolume[1]
  } else {
    volume <- treedata$TrunkVolume[1]
  }
  return(volume)
}

#' Total branch volume TreeQSM
#'
#' Extracts the total branch volume from the treedata of a TreeQSM.
#'
#' @param treedata Treedata field of a TreeQSM that is returned by
#'   \code{\link{read_tree_qsm}}.
#'
#' @return The total branch volume of the TreeQSM in liters.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Read tree qsm and extract total branch volume
#' qsm <- read_tree_qsm(QSM_path = "path/to/qsm.mat")
#' branchvol <- total_branch_volume_qsm(treedata = qsm$treedata)
#' }
total_branch_volume_qsm <- function(treedata) {
  return(treedata$BranchVolume[1])
}

#' Total branch length TreeQSM
#'
#' Extracts the total branch length from the treedata of a TreeQSM.
#'
#' @param treedata Treedata field of a TreeQSM that is returned by
#'   \code{\link{read_tree_qsm}}.
#'
#' @return The total branch length of the TreeQSM in liters.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Read tree qsm and extract total branch length
#' qsm <- read_tree_qsm(QSM_path = "path/to/qsm.mat")
#' branchlen <- total_branch_length_qsm(treedata = qsm$treedata)
#' }
total_branch_length_qsm <- function(treedata) {
  return(treedata$BranchLength[1])
}

#' Tree height TreeQSM
#'
#' Extracts the tree height from the treedata of a TreeQSM.
#'
#' @param treedata Treedata field of a TreeQSM that is returned by
#'   \code{\link{read_tree_qsm}}.
#'
#' @return The tree height of the TreeQSM in meters.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Read tree qsm and extract tree height
#' qsm <- read_tree_qsm(QSM_path = "path/to/qsm.mat")
#' height <- tree_height_qsm(treedata = qsm$treedata)
#' }
tree_height_qsm <- function(treedata) {
  return(treedata$TreeHeight[1])
}

#' Diameter at breast height TreeQSM
#'
#' Extracts the DBH from the treedata of a TreeQSM.
#'
#' The DBH is calculated as the diameter of the cylinder in the QSM at the right
#' height (cylinder at 1.3 m). If the trunk was modeled with triangulation the
#' DBH is calculated as mean length of the diagonals in the triangulation.
#'
#' @param treedata Treedata field of a TreeQSM that is returned by
#'   \code{\link{read_tree_qsm}}.
#'
#' @return The DBH of the TreeQSM in meters.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Read tree qsm and extract DBH
#' qsm <- read_tree_qsm(QSM_path = "path/to/qsm.mat")
#' dbh <- dbh_qsm(treedata = qsm$treedata)
#' }
dbh_qsm <- function(treedata) {
  if (length(treedata) > 83) {
    dbh <- treedata$DBHtri[1]
  } else {
    dbh <- treedata$DBHqsm[1]
  }
  return(dbh)
}
