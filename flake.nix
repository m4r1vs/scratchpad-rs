{
  description = "Simple Rust dev shell with cargo from nixos-unstable";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = ["aarch64-darwin" "x86_64-linux" "aarch64-linux"];
    forAllSystems = f:
      builtins.listToAttrs (map (system: {
          name = system;
          value = f system;
        })
        systems);
  in {
    devShells = forAllSystems (system: let
      pkgs = import nixpkgs {inherit system;};
    in
      with pkgs; {
        default = mkShell {
          buildInputs = [cargo];
        };
      });
  };
}
