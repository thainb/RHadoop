library(utils)
.hdfsEnv <- new.env()
.onLoad <- function(libname,pkgname){
  vrs <- packageDescription(pkgname, lib.loc = libname, fields = "Version",
                            drop = TRUE)
  if (Sys.getenv("HADOOP_HOME") == "") stop(sprintf("Environment variable HADOOP_HOME must be set before loading package %s", pkgname))
  if (Sys.getenv("HADOOP_CONF") == "") stop(sprintf("Environment variable HADOOP_CONF must be set before loading package %s", pkgname))
  packageStartupMessage("This is ", pkgname, " ", vrs, ". ",
                        "For overview type ", sQuote(paste("?", pkgname, sep="")), ".",  
                        "\nHADOOP_HOME=", Sys.getenv("HADOOP_HOME"),
                        "\nHADOOP_CONF=", Sys.getenv("HADOOP_CONF"))
  hdfs.init()
}