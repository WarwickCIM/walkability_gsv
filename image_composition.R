# combines image sets into a single image and saves it as a file.

library(magick)

total_clusters <- c(0:4)
total_images <- 2


# Create composite image --------------------------------------------------

mk_composite_image <- function(cluster, first_img = 1, last_img) {

  n_iter <- last_img - first_img

  # Defining progress bar
  progress_bar <- txtProgressBar(min = first_img,
                                 max = last_img,
                                 style = 3,
                                 width = n_iter, # Needed to avoid multiple printings
                                 char = "=")

  init <- numeric(n_iter)
  end <- numeric(n_iter)

  # Code to be executed
  for (i in first_img:last_img) {

    init[i] <- Sys.time() # Set timer

    location <- paste0("img/raw/C", cluster, "_", i)

    # print(paste0("Reading ", location))

    img_n <- image_read(paste0(location, "_1.jpg"))
    img_e <- image_read(paste0(location, "_2.jpg"))
    img_s <- image_read(paste0(location, "_4.jpg"))
    img_w <- image_read(paste0(location, "_3.jpg"))

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

    # Update progress bar.
    end[i] <- Sys.time()

    setTxtProgressBar(progress_bar, i)

    time <- round(lubridate::seconds_to_period(sum(end - init)), 0)

    # Estimated remaining time based on the
    # mean time that took to run the previous iterations
    est <- n_iter * (mean(end[end != 0] - init[init != 0])) - time
    remainining <- round(lubridate::seconds_to_period(est), 0)

    cat(paste(" // Execution time:", time,
              " // Estimated time remaining:", remainining), "")
  }

  close(progress_bar) # Close the connection
}

# Creates composite images per cluster.
mk_composite_image(0, last_img = 795)
mk_composite_image(1, last_img = 704)
mk_composite_image(2, last_img = 853)
mk_composite_image(3, last_img = 357)
mk_composite_image(4, last_img = 735)


# Create smaller copies ---------------------------------------------------

image_names <- list.files("img/tmp/", pattern = ".jpg")

for (i in image_names) {
  big_img <- image_read(paste0("img/tmp/", i))

  small_img <- image_scale(big_img, "200")

  image_write(small_img, path = paste0("img/", i),
              format = "jpg")
}
