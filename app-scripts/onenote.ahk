#Include "../store.ahk"
#Include "../drivers"

#HotIf WinActive('ahk_exe ONENOTE.exe')
#HotIf Store.mode == Modes.Normal

::h1::{
    Send("^!1")
}

::h2::{
    Send("^!2")
}

::h3::{
    Send("^!3")
}
::h4::{
    Send("^!4")
}

::h5::{
    Send("^!5")
}

::h6::{
    Send("^!6")
}
