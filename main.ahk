#Requires AutoHotkey v2.0

#SingleInstance Force

#Include "store.ahk"
#Include "modes.ahk"
#Include "debug.ahk"

#HotIf

!n::Store.SetMode(Modes.Normal)
!i::Store.SetMode(Modes.Insert)
!v::Store.SetMode(Modes.Visual)
!l::Store.SetMode(Modes.Launcher)
!d::Store.SetMode(Modes.Debug)

