import System.Taffybar

import System.Taffybar.Systray
import System.Taffybar.Pager
import System.Taffybar.TaffyPager
import System.Taffybar.SimpleClock
-- import System.Taffybar.FreedesktopNotifications
import System.Taffybar.Battery
import System.Taffybar.NetMonitor
import System.Taffybar.Weather
import System.Taffybar.MPRIS

import System.Taffybar.Widgets.PollingBar
import System.Taffybar.Widgets.PollingGraph

import System.Information.Memory
import System.Information.CPU

memCallback = do
  mi <- parseMeminfo
  return [memoryUsedRatio mi]

cpuCallback = do
  (userLoad, systemLoad, totalLoad) <- cpuLoad
  return [totalLoad, systemLoad]

myPagerConfig = defaultPagerConfig { activeWorkspace = wrap (colorize "red" "" "\x2308") (colorize "green" "" "\x230B") . escape
                                   , visibleWorkspace = wrap (colorize "blue" "" "\x2308") (colorize "orange" "" "\x230B") . escape
                                   , emptyWorkspace = (\y -> "")
                                   , activeWindow = escape . shorten 100
                                   , activeLayout = (\ x -> case x of
                                            "Spacing 50 ResizableTall" -> "\x22A2"
                                            "Spacing 1 ResizableTall"  -> "\x22A2"
                                            "Spacing 5 ThreeCol"       -> "\x2AF4"
                                            "Grid"                     -> "\x2A69"
                                            "Tabbed Simplest"          -> "\x2AE7"
                                            "Full"                     -> "\x25FB"
                                            _                          -> x
                                            )
                                   , widgetSep = " "
                                   }

main = do
  let memCfg = defaultGraphConfig { graphDataColors = [(1, 0, 0, 1)] }
      cpuCfg = defaultGraphConfig { graphDataColors = [ (0, 1, 0, 1)
                                                      , (1, 0, 1, 0.5)
                                                      ]
                                  }
      clock = textClockNew Nothing "<span fgcolor='orange'>%a %b %d %H:%M</span>" 1
      pager = taffyPagerNew myPagerConfig
--      note = notifyAreaNew defaultNotificationConfig
      mpris = mprisNew
      mem = pollingGraphNew memCfg 1 memCallback
      cpu = pollingGraphNew cpuCfg 1 cpuCallback
      net = netMonitorNew 1 "wlp2s0"
      bat = textBatteryNew "$percentage$% $time$" 1
      tray = systrayNew

  defaultTaffybar defaultTaffybarConfig { startWidgets = [ pager ]
                                        , endWidgets = [ tray, clock, mem, cpu, net, bat, mpris ]
                                        }
