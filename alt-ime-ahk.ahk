#Requires AutoHotkey v2.0
#SingleInstance Force

; キーカスタマイズツール併用時のエラー対策
A_MaxHotkeysPerInterval := 350

#Include IME.ahk

; CapsLock を Ctrl にリマップ
CapsLock::Ctrl

; Ctrl+Space でIMEトグル
^Space:: {
    if (IME_GET())
        IME_SET(0)
    else
        IME_SET(1)
}

; 左Alt空打ちでIME OFF（Prefix key方式）
LAlt & F20::return
LAlt::IME_SET(0)

; 右Alt空打ちでIME ON（Prefix key方式）
RAlt & F20::return
RAlt::IME_SET(1)
