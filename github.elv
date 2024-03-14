# gh.elv - wrapper for gh command and library of utility functions

fn repo-clone {|@args| gh repo clone $@args }
fn repo-delete {|@args| gh repo delete $@args }
fn repo-edit {|@args| gh repo edit $@args }
fn repo-list {|@args| gh repo list $@args }
fn repo-view {|@args| gh repo view $@args }

fn repo-create {|@args|
    var specs = [
        [private $false 'Make the repository private']
    ]
    var flags options = (flag:parse $args $specs)

    if (eq $flags[name] '') {
        echo 'Repository name is required.'
        return
    }

    gh repo create $flags[name] \
        $@options
}

fn gist-clone {|@args| gh gist clone $@args }
fn gist-delete {|@args| gh gist delete $@args }
fn gist-edit {|@args| gh gist edit $@args }
fn gist-list {|@args| gh gist list $@args }
fn gist-view {|@args| gh gist view $@args }

fn auth-login {|@args| gh auth login $@args }
fn auth-logout {|@args| gh auth logout $@args }
fn auth-status {|@args| gh auth status $@args }
fn auth-token {|@args| gh auth refresh $@args }
fn auth-refresh {|@args| gh auth refresh $@args }
