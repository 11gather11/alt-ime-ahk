# alt-ime-ahk

Alt空打ちでIME切り替えするAutoHotkey v2スクリプト

## 機能

| キー | 動作 |
|------|------|
| 左Alt 空打ち | IME OFF（英数） |
| 右Alt 空打ち | IME ON（かな） |
| Ctrl+Space | IMEトグル |

※ Alt+他のキー（Alt+Tab、Alt+F4など）は通常通り動作します

## インストール

### exe版（推奨）

1. [Releases](../../releases)から`alt-ime-ahk.exe`をダウンロード
2. 任意の場所に配置して実行
3. タスクトレイに常駐

### スクリプト版

1. [AutoHotkey v2](https://www.autohotkey.com/)をインストール
2. `alt-ime-ahk.ahk`をダブルクリックして実行

## スタートアップ登録

Windowsログイン時に自動起動させる場合:

1. `Win+R`で「ファイル名を指定して実行」を開く
2. `shell:startup`と入力してEnter
3. 開いたフォルダに`alt-ime-ahk.exe`のショートカットを作成

## アンインストール

1. タスクトレイのアイコンを右クリック→「Exit」
2. ファイルを削除

## ビルド

スクリプトからexeを作成する場合:

```powershell
& "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in "alt-ime-ahk.ahk"
```

## 参考

- [karakaram/alt-ime-ahk](https://github.com/karakaram/alt-ime-ahk) - オリジナル実装（AutoHotkey v1）

## ライセンス

MIT
