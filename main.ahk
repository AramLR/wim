#Requires AutoHotkey v2.0

#Include "store.ahk"
#Include "modes.ahk"

+n::Store.SetMode(Modes.Normal)
+i::Store.SetMode(Modes.Insert)
+v::Store.SetMode(Modes.Visual)
+l::Store.SetMode(Modes.Launcher)
+d::Store.SetMode(Modes.Debug)
+s::Store.SetMode(Modes.SpecialChars)
