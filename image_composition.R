# combines image sets into a single image and saves it as a file.

library(magick)

total_clusters <- c(0:4)
total_images <- 2


# Create composite image --------------------------------------------------

mk_composite_image <- function(cluster, total_images) {
  for (i in 1:total_images) {
    img_n <- image_read(paste0("img/raw/C", cluster, "_", i, "_1.jpg"))
    img_e <- image_read(paste0("img/raw/C", cluster, "_", i, "_2.jpg"))
    img_s <- image_read(paste0("img/raw/C", cluster, "_", i, "_4.jpg"))
    img_w <- image_read(paste0("img/raw/C", cluster, "_", i, "_3.jpg"))

    img_composite <- image_blank(1940, 1300, color = "white") %>%
      image_composite(img_n, gravity = "north")  %>%
      image_composite(img_e,  gravity = "east")  %>%
      image_composite(img_s, gravity = "south")  %>%
      image_composite(img_w, gravity = "west") %>%
      # Scale image proportionally to width: 900px
      image_scale("900")

    image_write(img_composite,
                path = paste0("img/tmp/C", cluster, "_", i, "_composite.jpg"),
                format = "jpg")
  }
}

# Cluster 0
mk_composite_image(0, 10)
mk_composite_image



# Create smaller copies ---------------------------------------------------

image_names <- list.files("img/tmp/", pattern = ".jpg")

for (i in image_names) {
  print(i)
}

for (i in image_names) {
  big_img <- image_read(paste0("img/tmp/", i))

  small_img <- image_scale(big_img, "200")

  image_write(small_img, path = paste0("img/", i),
              format = "jpg")
}
