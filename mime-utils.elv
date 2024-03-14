# mime-utils.elv
use str

# Function to get the MIME type of a file
fn get-type {|path|
  var mime-type = (file --mime-type -b $path)
  put $mime-type
}

# Function to check if file(s) have a specific MIME type
fn is {|mime-type @paths|
  for path $paths {
    var actual-type = (get-type $path)
    if (not (str:has-prefix $mime-type $actual-type)) {
      put $false
      return
    }
  }
  put $true
}

# Function to check if file(s) are of video type
fn is-video {|@paths|
  is "video/" $@paths
}

# Function to check if file(s) are of audio type
fn is-audio {|@paths|
  is "audio/" $@paths
}

# Function to check if file(s) are of image type
fn is-image {|@paths|
  is "image/" $@paths
}

# Function to check if file(s) are of application type
fn is-application {|@paths|
  is "application/" $@paths
}

# Function to check if file(s) are of text type
fn is-text {|@paths|
  is "text/" $@paths
}

# Function to get the file extension based on MIME type
fn to-ext {|mime-type|
  # Define a dictionary of MIME types and their corresponding extensions
  var mime-ext-map = [
    &"text/plain"= "txt"
    &"image/jpeg"= "jpg"
    &"image/png"= "png"
    &"application/pdf"= "pdf"
    # Add more MIME types and extensions as needed
  ]

  if (has-key $mime-ext-map $mime-type) {
    put $mime-ext-map[$mime-type]
  } else {
    put ""
  }
}

# Function to get the MIME type based on file extension
fn from-ext {|ext|
  # Define a dictionary of file extensions and their corresponding MIME types
  var ext-mime-map = [
    &"txt"= "text/plain"
    &"jpg"= "image/jpeg"
    &"png"= "image/png"
    &"pdf"= "application/pdf"
    # Add more extensions and MIME types as needed
  ]

  if (has-key $ext-mime-map $ext) {
    put $ext-mime-map[$ext]
  } else {
    put ""
  }
}