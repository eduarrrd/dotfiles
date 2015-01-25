import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
-- import XMonad.Hooks.FadeInactive

import XMonad.Util.EZConfig
import XMonad.Util.Run

import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.ResizableTile
import XMonad.Layout.ThreeColumns
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances

import XMonad.Actions.GridSelect
import XMonad.Actions.CycleWS

import System.Taffybar.Hooks.PagerHints

main = do
    safeSpawn "taffybar" []
    xmonad myConfig

myConfig = ewmh $ pagerHints $ defaultConfig 
    { modMask = mod4Mask
    , terminal = "konsole"
    , manageHook = manageDocks <+> composeAll [ isFullscreen --> doFullFloat ]
    , layoutHook = myLayout
    , startupHook = setWMName "LG3D"
    -- , logHook =  fadeInactiveLogHook 0.85
    }
    `additionalKeys`
    [ ((mod4Mask, xK_f), sendMessage (Toggle FULL) >> sendMessage ToggleStruts) -- toggle fullscreen
    , ((mod4Mask, xK_g), goToSelected defaultGSConfig) -- GridSelect
    , ((mod4Mask, xK_Escape), spawn "slock")
    , ((mod4Mask, xK_z), toggleWS) -- go to most recently viewed workspace
    , ((mod4Mask, xK_Right), nextWS) -- go one workspace right
    , ((mod4Mask, xK_Left), prevWS) -- go one workspace left
    ]

myLayout = avoidStruts ( smartBorders ( -- tiledSpace |||
                                        tiled |||
                                        bigMonitor |||
                                        Grid |||
                                        simpleTabbed
                                      ) ) |||
                         noBorders (fullscreenFull Full)
    where
        tiled           = spacing 1 $ ResizableTall nmaster delta ratio []
        tiledSpace      = spacing 50 $ ResizableTall nmaster delta ratio []
        bigMonitor      = spacing 5 $ ThreeColMid nmaster delta ratio
        -- Default number of windows in master pane
        nmaster         = 1
        -- Percent of the screen to increment when resizing
        delta           = 5/100
        -- Default proportion of the screen taken up by main pane
        ratio           = toRational (2/(1 + sqrt 5 :: Double))
