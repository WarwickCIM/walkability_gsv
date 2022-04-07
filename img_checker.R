# Checks if images are publicly accessible and stores result in a dataframe.

library(RCurl)

base_url <- "https://agnor.lnx.warwick.ac.uk/walkability/images/"
n_clusters <- 5
n_imgs <- 99


# Create a list of image names --------------------------------------------

img_names <- list()

for (c in 1:n_clusters-1 ) {
  for (i in 1:n_imgs) {
    name <- paste0("C", c, "_", i, "_composite.jpg")
    img_names <- c(img_names, name)
  }
}


# Check links and store them in variable ----------------------------------

img_check <- list()

for (i in 1:length(img_names)) {
  check <- url.exists(paste0(base_url, img_names[i]))
  print(paste0(img_names[i], " returned ", check))
  img_check <- c(img_check, check)
}


# Store everything in a dataframe. ----------------------------------------

df_imgs <- data.frame(
  name = unlist(img_names),
  accessible = unlist(img_check)
)
