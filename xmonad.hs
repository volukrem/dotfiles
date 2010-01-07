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

import XMonad.Layout.WindowNavigation
import XMonad.Layout.Tabbed
import XMonad.Layout.TwoPane
import XMonad.Layout.MosaicAlt
import XMonad.Layout.Combo
import XMonad.Layout.WindowNavigation

import XMonad.Layout.PerWorkspace

import XMonad.Layout.NoBorders

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
       -- multimedia keys
       -- XF86AudioLowerVolume
       , ((0            , 0x1008ff11), spawn "ossmix -- vmix0-outvol -2")
       -- XF86AudioRaiseVolume
       , ((0            , 0x1008ff13), spawn "ossmix vmix0-outvol +2")
       -- XF86AudioMute
       , ((0            , 0x1008ff12), spawn "amixer -q set PCM toggle")
       -- XF86AudioNext
       , ((0            , 0x1008ff17), spawn "mocp -f")
       -- XF86AudioPrev
       , ((0            , 0x1008ff16), spawn "mocp -r")
       -- XF86AudioPlay
       , ((0            , 0x1008ff14), spawn "mocp -G")
    ]
    where modMask     = mod1Mask
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

myTabConfig = defaultTheme { inactiveColor = "#050505", activeColor = "#050505",  inactiveBorderColor = "#050505", inactiveTextColor = "#666666", activeBorderColor = "#050505", activeTextColor = "#eeeeee"}

main = do
    putEnv "BROWSER=w3"
    xmproc <- spawnPipe "xmobar $HOME/.xmonad/xmobar"
    xmonad $ defaultConfig { 
        -- basic conf
        modMask            = mod4Mask,
        terminal           = "urxvt",
        borderWidth        = 2,
        workspaces         = ["HOME","DEV","IRC","WWW"] ++ map show [5..9],
        -- colors
        normalBorderColor  = "#000000",
        focusedBorderColor = "#000000",
        -- hooks
        manageHook = myManageHook <+> manageDocks,
        -- layoutHook = avoidStruts $ layoutHook defaultConfig,
        layoutHook      = windowNavigation $ (avoidStruts (tall ||| Mirror tall ||| noBorders (tabbed shrinkText myTabConfig) ||| noBorders Full ||| onWorkspace "WWW" (tabbed shrinkText myTabConfig) tall)),
        logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        } 
        } `additionalKeys` myKeys
        where 
          tall  = Tall 1 (3/100) (488/792)
          -- mosaic  = MosaicAlt M.empty
          -- combo   = combineTwo (TwoPane 0.03 (3/10)) (mosaic) (Full)
