Config { font = "xft:Monaco:style=regular:pixelsize=13:antialias=true,hinting=true"
       , bgColor = "#222"
       , fgColor = "#ccc"
       , position = Top
       , lowerOnStart = True
       , commands = [ 
                     Run Com ".xmonad/widgets/battery" ["-s","-r"] "battery" 10
                    , Run Com ".xmonad/widgets/time" ["-s","-r"] "time" 10
                    , Run Cpu ["-L","3","-H","50","--normal","#657b83","--high","#657b83"] 10
                    , Run Memory ["-t", "Memory: <usedratio>%"] 10
                    , Run Com ".xmonad/widgets/connection" ["-s","-r"] "connection" 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %StdinReader% }{ %cpu% | %memory% %connection% | <fc=#777>%battery%</fc> | <fc=#777>%time%</fc> "
       }
