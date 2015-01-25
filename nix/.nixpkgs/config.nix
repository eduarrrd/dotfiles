{
    allowUnfree = true;
    chromium = {
     enablePepperFlash = true; # Chromium's non-NSAPI alternative to Adobe Flash
     enablePepperPDF = true;
    };

    firefox = {
      enableAdobeFlash = true;
      enableGoogleTalkPlugin = true;
    };

    packageOverrides = pkgs : with pkgs; {
      sdlEnv = pkgs.myEnvFun {
          name = "sdl";
          buildInputs = [ stdenv SDL2 glew pkgconfig cmake ];
      };
      scienceEnv = pkgs.myEnvFun {
          name = "sci";
          buildInputs = with python27Packages;[ ipython pandas sympy scipy ];
      };
      haskellEnv = pkgs.myEnvFun {
          name = "haskell";
          buildInputs = with haskellPackages; [ ghc gtk2hsBuildtools openssl yesod cabalInstall ];
      };
      xmonadEnv = pkgs.myEnvFun {
          name = "xmonad";
          buildInputs = with haskellPackages; [ xmonad xmonadContrib xmonadExtras taffybar ];
      };
    };
  }
