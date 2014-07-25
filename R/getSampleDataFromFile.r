#' Import Sample Data for WRTDS
#'
#' Imports data from a user-supplied file, and converts it to a Sample data frame (including summing multiple constituents), appropriate for WRTDS calculations. See
#' section 3.4 of the vignette for more details.
#'
#' @param filePath string specifying the path to the file
#' @param fileName string name of file to open
#' @param hasHeader logical true if the first row of data is the column headers
#' @param separator string character that separates data cells
#' @param interactive logical Option for interactive mode.  If true, there is user interaction for error handling and data checks.
#' @keywords data import file
#' @keywords data import USGS WRTDS
#' @export
#' @return Sample dataframe
#' @examples
#' filePath <- system.file("extdata", package="dataRetrieval")
#' filePath <- paste(filePath,"/",sep="")
#' fileName <- 'ChoptankRiverNitrate.csv'
#' Sample <- getSampleDataFromFile(filePath,fileName, separator=";",interactive=FALSE)
getSampleDataFromFile <- function (filePath,fileName,hasHeader=TRUE,separator=",", interactive=TRUE){
  data <- getQWDataFromFile(filePath,fileName,hasHeader=hasHeader,separator=separator)
  compressedData <- compressData(data, interactive=interactive)
  Sample <- populateSampleColumns(compressedData)
  return(Sample)
}