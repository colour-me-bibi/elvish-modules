# nix.elv - Nix helper functions

fn install {|@args| nix profile install 'nixpkgs#'{$@args} }

fn list { nix profile list }

fn fmt { nix fmt }

fn search {|@args| nix search nixpkgs {$@args} }

fn remove {|@args| nix profile remove {$@args} }

fn clean { nix profile remove '.*' }

fn shell {|@args| nix shell 'nixpkgs#'{$@args} }

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
