{
  description = "test description";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-23.05;
  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { nixpkgs, ... }: {
    packages.x86_64-linux.git = nixpkgs.legacyPackages.x86_64-linux.git;
    packages.x86_64-darwin.git = nixpkgs.legacyPackages.x86_64-darwin.git;
    packages.x86_64-linux.vim = nixpkgs.legacyPackages.x86_64-linux.vim;
   

    checks.x86_64-linux.git = nixpkgs.legacyPackages.x86_64-linux.git;

    apps.x86_64-linux.default = { type = "app"; program = "/nix/store/a"; };
    
    overlays."myoverlay" = final: prev: { };

    nixosModules."myhostname" = { config }: { options = {}; config = {}; };

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

    nixosConfigurations."myhostname" = {};
    
    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

    templates.default = { path = "<store-path>"; description = "template test"; };
  };
}
