# nix.elv - Nix helper functions

fn install {|@args| nix profile install {$@args} }

fn search {|@args| nix search nixpkgs {$@args} }

fn remove {|@args| nix profile remove {$@args} }

fn shell {|@args &cmd=""| nix shell {$@args} --command {$cmd} }

fn clean { nix profile remove '.*' }

fn list { nix profile list }

fn fmt { nix fmt }

fn update { nix flake update --show-trace }

fn check { nix flake check --show-trace }
