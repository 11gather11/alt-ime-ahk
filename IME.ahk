; IME制御用関数 (AutoHotkey v2)
; 参考: https://github.com/ryobeam/alt-ime-ahk-v2f

IME_GET(WinTitle := "A") {
    hwnd := WinExist(WinTitle)
    if (WinActive(WinTitle)) {
        ptrSize := !A_PtrSize ? 4 : A_PtrSize
        cbSize := 4 + 4 + (ptrSize * 6) + 16
        stGTI := Buffer(cbSize, 0)
        NumPut("UInt", cbSize, stGTI.Ptr, 0)
        hwnd := DllCall("GetGUIThreadInfo", "UInt", 0, "Ptr", stGTI.Ptr)
            ? NumGet(stGTI.Ptr, 8 + ptrSize, "UInt") : hwnd
    }
    return DllCall("SendMessage"
        , "UInt", DllCall("imm32\ImmGetDefaultIMEWnd", "UInt", hwnd)
        , "UInt", 0x0283
        , "Int", 0x0005
        , "Int", 0)
}

IME_SET(SetSts, WinTitle := "A") {
    hwnd := WinExist(WinTitle)
    if (WinActive(WinTitle)) {
        ptrSize := !A_PtrSize ? 4 : A_PtrSize
        cbSize := 4 + 4 + (ptrSize * 6) + 16
        stGTI := Buffer(cbSize, 0)
        NumPut("UInt", cbSize, stGTI.Ptr, 0)
        hwnd := DllCall("GetGUIThreadInfo", "UInt", 0, "Ptr", stGTI.Ptr)
            ? NumGet(stGTI.Ptr, 8 + ptrSize, "UInt") : hwnd
    }
    return DllCall("SendMessage"
        , "UInt", DllCall("imm32\ImmGetDefaultIMEWnd", "UInt", hwnd)
        , "UInt", 0x0283
        , "Int", 0x0006
        , "Int", SetSts)
}
