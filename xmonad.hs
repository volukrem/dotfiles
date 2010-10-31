import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import System.Posix.Env

import qualified XMonad.StackSet as W
import qualified Data.Map as M
import qualified System.IO.UTF8        as U
import qualified XMonad.Actions.Search as S
import qualified XMonad.Actions.Submap as SM
import qualified XMonad.Prompt         as P

myManageHook = composeAll
    [
      className =? "Emacs"            --> doF (W.shift "HOME"),
      className =? "Uzbl-core"        --> doF (W.shift "WWW"),
      className =? "Firefox"          --> doF (W.shift "WWW"),
      className =? "Chromium-browser" --> doF (W.shift "WWW"),
      className =? "Pidgin"           --> doF (W.shift "IRC"),
      className =? "Skype"            --> doF (W.shift "IRC"),
      className =? "Vlc"              --> doF (W.shift "5")
    ] 

myKeys = 
    [ 
      ((modMask, xK_s), search)
    ]
    where modMask     = mod4Mask
          modShft     = modMask .|. shiftMask
          modCtrl     = modMask .|. controlMask
          modShCr     = modMask .|. shiftMask .|. controlMask
          modMod2     = mod2Mask
          modM1Cr     = modMask .|. mod2Mask .|. controlMask
          search      = SM.submap $ searchMap $ S.promptSearch P.defaultXPConfig
          nilMask     = 0
          jstShft     = shiftMask
          searchMap m = M.fromList $
              [ ((nilMask, xK_g), m S.google),
                ((nilMask, xK_w), m S.wikipedia),
                ((nilMask, xK_i), m S.imdb)
              ]

main = do
    putEnv "BROWSER=w3"
    xmproc <- spawnPipe "xmobar $HOME/.xmonad/xmobar"
    xmonad $ defaultConfig { 
        -- basic conf
        modMask            = mod4Mask,
        terminal           = "rxvt-unicode",
        borderWidth        = 2,
        workspaces         = ["HOME","DEV","IRC","WWW"] ++ map show [5..9],
        -- colors
        normalBorderColor  = "#000000",
        focusedBorderColor = "#111111",
        -- hooks
        manageHook = myManageHook <+> manageDocks,
        layoutHook = avoidStruts  $  layoutHook defaultConfig, 
        logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        } 
        } `additionalKeys` myKeys
