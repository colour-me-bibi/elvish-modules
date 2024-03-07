# mime.elv - MIME type utility functions

use str


fn is-type {|mime-type @paths|
    var result = (str:has-prefix $mime-type "text/")
}