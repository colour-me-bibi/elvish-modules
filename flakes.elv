# nix.elv - Nix helper functions

fn -prefix-nixpkgs {|@args|
  for arg $args {
    if (str:has-prefix $arg 'nixpkgs#') {
      put $arg
    } else {
      put 'nixpkgs#' + $arg
    }
}

fn install {|@args| nix profile install 'nixpkgs#'{$@args} }

fn list { nix profile list }

fn fmt { nix fmt }

fn search {|@args| nix search nixpkgs {$@args} }

fn remove {|@args| nix profile remove {$@args} }

fn clean { nix profile remove '.*' }

fn shell {|@args &cmd=""|
  nix shell 'nixpkgs#'{$@args} --command $cmd
}

fn update { nix flake update }

fn check { nix flake check }

fn git {
  if (test -f ./flake.nix) {
    nix flake update
    nix flake check
    git add flake.nix
    git commit -m "Update flake.nix"
    git push
  }
}


