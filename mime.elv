use str

fn get-type {|path| file --mime-type -b $path }

fn is-type {|mime-type @paths| str:has-prefix $mime-type $@paths }

fn is-video {|@paths| is-type "video/" $@paths }

fn is-audio {|@paths| is-type "audio/" $@paths }

fn is-image {|@paths| is-type "image/" $@paths }

fn is-application {|@paths| is-type "application/" $@paths }

fn is-text {|@paths| is-type "text/" $@paths }
