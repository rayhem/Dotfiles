import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing

-- Whether focus follows the mouse pointer
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Width of the spacing between windows in pixels
mySpacingWidth = 4

-- Border colors for unfocused and focused windows, respectively
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#0066ff"

myLayout = avoidStruts $ tiled ||| Mirror tiled ||| Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = spacing mySpacingWidth $ Tall nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio   = 1/2

    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

xfce = xfceConfig 
  {
  layoutHook = myLayout
  }

main = xmonad xfce 
