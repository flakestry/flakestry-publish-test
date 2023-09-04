{
  description = "test description";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-23.05;

  outputs = { git, ... }: {
    packages.x86_64-linux.git = nixpkgs.legacyPackages.git;
  };
}