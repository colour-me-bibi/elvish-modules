use str

# Get mime type of a file
fn type {|path| file --mime-type -b $path }

# Check if mime-type matches with provided paths
fn is-type {|mime-type @paths| str:has-prefix $mime-type $@paths }

# Utility to check if given path(s) are videos
fn is-video {|@paths| is-type "video/" $@paths }

# Utility to check if given path(s) are audios
fn is-audio {|@paths| is-type "audio/" $@paths }

# Utility to check if given path(s) are images
fn is-image {|@paths| is-type "image/" $@paths }

# Utility to check if given path(s) are applications
fn is-application {|@paths| is-type "application/" $@paths }

# Utility to check if given path(s) are texts
fn is-text {|@paths| is-type "text/" $@paths }
