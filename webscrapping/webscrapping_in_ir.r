main_dir   <- '~/dev/r/webscrapping'
target_dir <- file.path(main_dir, 'downloads') 
d_file     <- file.path(target_dir, 'test.htm') 

# target url
target_url <- "https://www.nps.gov/aboutus/national-park-system.htm"

# create directory for download. ignore if path already exists
dir.create(target_dir, showWarnings = FALSE)

# download file
download.file(url      = target_url,
              destfile = d_file)

