; IME制御用関数 (AutoHotkey v2)
; 参考: https://github.com/karakaram/alt-ime-ahk

/**
 * IMEの状態を取得
 * @param hWnd ウィンドウハンドル（省略時はアクティブウィンドウ）
 * @returns IMEの状態 (1=ON, 0=OFF)
 */
IME_GET(hWnd := "") {
    if (hWnd = "")
        hWnd := WinGetID("A")

    return SendMessage(
        0x0283,  ; WM_IME_CONTROL
        0x0005,  ; IMC_GETOPENSTATUS
        0,
        0,
        "ahk_id " . DllCall("imm32\ImmGetDefaultIMEWnd", "Ptr", hWnd, "Ptr")
    )
}

/**
 * IMEの状態を設定
 * @param SetSts 設定する状態 (1=ON, 0=OFF)
 * @param hWnd ウィンドウハンドル（省略時はアクティブウィンドウ）
 * @returns 設定後のIMEの状態
 */
IME_SET(SetSts, hWnd := "") {
    if (hWnd = "")
        hWnd := WinGetID("A")

    SendMessage(
        0x0283,  ; WM_IME_CONTROL
        0x0006,  ; IMC_SETOPENSTATUS
        SetSts,
        0,
        "ahk_id " . DllCall("imm32\ImmGetDefaultIMEWnd", "Ptr", hWnd, "Ptr")
    )

    return IME_GET(hWnd)
}
