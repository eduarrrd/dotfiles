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
          buildInputs = with python27Packages; [ ipython pandas sympy scipy ];
      };
      haskellEnv = pkgs.myEnvFun {
          name = "haskell";
          buildInputs = with haskellPackages; [ ghc ];
      };
      hakyllEnv = pkgs.myEnvFun {
          name = "hakyll";
          buildInputs = with haskellPackages; [ ghc hakyll ];
      };
      yesodEnv = pkgs.myEnvFun {
          name = "yesod";
          buildInputs = with haskellPackages; [ ghc gtk2hsBuildtools openssl yesod cabalInstall ];
      };
      osEnv = pkgs.myEnvFun {
          name = "os";
          buildInputs = with pkgs; [ gcc nasm qemu bochs ];
      };
      xmonadEnv = pkgs.myEnvFun {
          name = "xmonad";
          buildInputs = with haskellPackages; [ xmonad xmonad-contrib xmonad-extras taffybar ];
      };
    };
  }
