# gh.elv - wrapper for gh command and library of utility functions

fn search {|@args|
    gh search $@args
}

fn clone {|@args|
    gh repo clone $@args
}

fn gist {|@args|
    gh gist $@args
}
