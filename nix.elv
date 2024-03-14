# nix.elv - Nix helper functions

fn nx-install {|@args|
  nix profile install 'nixpkgs#'{$@args}
}

fn nx-list {
  nix profile list
}

fn nx-search {|@args|
  nix search nixpkgs {$@args}
}

fn nx-remove {|@args|
  nix profile remove {$@args}
}

fn nx-clean {
  nix profile remove '.*'
}

fn nx-shell {|@args|
  nix shell 'nixpkgs#'{$@args}
}

fn nx-update {
  nix flake update
}

fn nx-check {
  nix flake check
}

fn nx-git {
  if (test -f ./flake.nix) {
    nix flake update
    nix flake check
    git add flake.nix
    git commit -m "Update flake.nix"
    git push
  }
}
