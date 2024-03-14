# nix.elv - Nix helper functions

fn install {|@args| nix profile install {$@args} }

fn list {|@args| nix profile list {$@args} }

fn fmt {|@args| nix fmt {$@args} }

fn search {|@args| nix search nixpkgs {$@args} }

fn remove {|@args| nix profile remove {$@args} }

fn clean {|@args| nix profile remove '.*' {$@args} }

fn shell {|@args &cmd=""|
  nix shell 'nixpkgs#'{$@args} --command $cmd
}

fn update {|@args| nix flake update {$@args} }

fn check {|@args| nix flake check {$@args} }

fn git {|@args|
  if (test -f ./flake.nix) {
    nix flake update
    nix flake check
    git add flake.nix
    git commit -m "Update flake.nix"
    git push
  }
  $args
}


