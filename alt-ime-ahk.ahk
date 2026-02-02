; 左右 Alt キーの空打ちで IME を ON/OFF する AutoHotkey スクリプト
;
; 左 Alt キーの空打ちで IME OFF
; 右 Alt キーの空打ちで IME ON
; Alt キーを押している間に他のキーを打つと通常の Alt キーとして動作
;
; Based on: ryobeam/alt-ime-ahk-v2f

#Requires AutoHotkey v2.0
#SingleInstance Force

#Include IME.ahk

A_MaxHotkeysPerInterval := 350

; キー監視（Alt+他キーの組み合わせ判定用）
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
{
    Return
}

; Alt押下時にメニューバーのアクティブ化を防止
*~LAlt:: {
    Send("{Blind}{vkFF}")
}

*~RAlt:: {
    Send("{Blind}{vkFF}")
}

; 左Alt空打ちでIME OFF
#HotIf !WinActive("ahk_exe mstsc.exe")
LAlt up:: {
    if (A_PriorHotkey == "*~LAlt") {
        IME_SET(0)
    }
    Return
}
#HotIf

; 右Alt空打ちでIME ON
#HotIf !WinActive("ahk_exe mstsc.exe")
RAlt up:: {
    if (A_PriorHotkey == "*~RAlt") {
        IME_SET(1)
    }
    Return
}
#HotIf

; Ctrl+Space でIMEトグル
^Space:: {
    if (IME_GET())
        IME_SET(0)
    else
        IME_SET(1)
}
