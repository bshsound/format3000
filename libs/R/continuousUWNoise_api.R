## Set the user

user <- "lalander"

## Gets javascript web token
jwt <- token(user)

## Uploads a (test) file

data <- read.csv("X:\Resultat\hdf5_files_ices\hdf5\Hon1\ICES_SE_13076_210801_210816.h5")
UploadFile(data, jwt)

## Loops through a list of files and uploads them using the API

# files <- dir(X:\Resultat\hdf5_files_ices\hdf5\Hon1\)
# lapply(files, UploadFile, jwt = jwt)


## Gets the list of file screenings 

screenings <- getListFileScreenings(jwt)
