# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    # kicad-unstable =
    #   (prev.kicad-unstable.overrideAttrs (oldAttrs: {
    #     # buildInputs = (oldAttrs.buildInputs or [ ]) ++ [ prev.pkgs.protobuf3_20 ];
    #     nativeBuildInputs = (oldAttrs.nativeBuildInputs or [ ]) ++ [ prev.pkgs.protobuf3_20 ];
    #     # configureFlags = (oldAttrs.configureFlags or [ ]) ++ [ "-DPROTOBUF_DIR=${prev.pkgs.protobuf3_20}" ];
    #   })).override
    #     {
    #       srcs = {
    #         kicadVersion = "dev-zoom-fix";
    #         kicad = prev.fetchFromGitLab {
    #           owner = "ejverat";
    #           repo = "kicad";
    #           rev = "bd86a74bcf332b41875c3230f8ecfb32d5fcebfe";
    #           sha1 = "sha1-4i6btAkrBOwqyuikwaSfweqS/q4=";
    #         };
    #       };
    #       stable = false;
    #       # optionals.withI18n = false;
    #     };
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
