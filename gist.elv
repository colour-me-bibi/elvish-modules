# gist.elv - Gist-related utilities

fn create {|@args &is-public=$true|
    gh gist create --public=$is-public $@args
}

fn list {|@args|
    gh gist list $@args
}

fn view {|$id|
    gh gist view $id
}

fn edit {|$id|
    gh gist edit $id
}
