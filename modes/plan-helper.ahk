#Include "../store.ahk"
#Include "../modes/modes.ahk"
#Include "../drivers/app-data.ahk"

#HotIf Store.mode == Modes.PlanHelper

^a::{
    IB := InputBox("Enter your daily todo:", "Add daily todo:")

    if(IB.Result == "Cancel"){
        MsgBox("Action canceled")
    }else{
        todo := IB.Value

        AppData.AddDailyTodo(todo)
    }

}

^l::{

    newLine := "`n"

    dailyTodos := AppData.GetDailyTodos()

    message := "Daily Todos: " . newLine

    for todo in dailyTodos{
        message .= todo . newLine
    }

    MsgBox(message, "Daily Todos")
}
