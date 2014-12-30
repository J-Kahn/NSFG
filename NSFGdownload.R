
# Address for FTP server for NSFG data
ftpfolder <- "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NSFG/"
library(downloader, RCurl)

# Data file names for NSFG 1995 on
datafiles <- c("1995FemRespData.dat",
			   "1995PregData.dat",
			   "2002FemResp.dat",
			   #"2002HHvars.dat",
			   "2002Male.dat",
			   "2006_2010_FemResp.dat",
			   "2006_2010_FemPreg.dat",
			   "2006_2010_Male.dat")

# SAS import file names
importfile <- c("1995FemRespSetup.sas",
				"1995FemPregFile.sas",
				"2002FemPregInput.sas",
				#"2002RespInput.sas",
				"2002MaleInput.sas",
				"2006_2010_FemRespSetup.sas",
				"2006_2010_FemPregSetup.sas",
				"2006_2010_MaleSetup.sas")

for(i in 1:length(datafiles)){
	file <- getBinaryURL(paste(ftpfolder, datafiles[i],sep=""))
	writeBin(file, datafiles[i])

	cat("downloaded ",datafiles[i],"...\n",sep="")

	file <- getBinaryURL(paste(ftpfolder, "sas/", importfile[i],sep=""))
	writeBin(file, importfile[i])
}

