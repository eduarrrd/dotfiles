{
    allowUnfree = true;
    packageOverrides = pkgs : with pkgs; {
      sdlEnv = pkgs.myEnvFun {
          name = "sdl";
          buildInputs = [ stdenv SDL2 glew pkgconfig cmake ];
      };
      scienceEnv = pkgs.myEnvFun {
          name = "sci";
          buildInputs = with python27Packages;[ ipython pandas sympy scipy ];
      };
      xmonadEnv = pkgs.myEnvFun {
          name = "xmonad";
          buildInputs = with haskellPackages; [ xmonad xmonadContrib xmonadExtras taffybar ];
      };
    };
  }
