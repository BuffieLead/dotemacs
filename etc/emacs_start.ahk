/*
------------------emacsclientw起動用スクリプト------------------
emacsclientw.exeをまともに使えるようにする。
emacsが起動してないときには起動、起動してる時はアクティブ化、ファイルを送ると読み込む。
gnupack版emacsで使うときはrunemacs.exeの代わりにINST_DIRのemacs.exeを指定する。
AutoHotKey_Lw / Ahk2Exe_Lで動作。
[1] コンパイルして適当な場所に置く
とりあえずemacs.exeと同じ場所おすすめ。
[2]  emacsでサーバーを有効にする
以下をInit.elにコピー。
;; Emacs Server Start
(require 'server)
(unless (eq t (server-running-p))
  (server-start))
[3] iniファイルを作成する
実行ファイルと同じ場所にStartEmacs.iniを作成。内容は以下。
[path]
emacs="C:\\usr\\share\\emacs\\bin\\runemacs.exe"
emacsclientw="C:\\usr\\share\\emacs\\bin\\emacsclientw.exe"
server="C:\\Users\\e09485\\Documents\\Program\\emacs\\.emacs.d\\server\\server"
[4] 起動する
ファイルを送ればちゃんと開いてくれる。
ショートカット作成や関連付けに使う。
----------------------------------------------------------------
*/


;; =============================================================
;; 初期設定

;; 起動モードを指定
#SingleInstance ignore

;; 環境変数を無視する
#NoEnv

;; タスクトレイアイコンを表示しない
#NoTrayIcon

;; SendModeをInputに指定
SendMode Input

;; 作業ディレクトリ指定
SetWorkingDir %A_ScriptDir%

;; ファイルエンコードをUTF-8に指定
FileEncoding, CP65001

;; iniファイル名を指定
ini_file = StartEmacs.ini


;; =============================================================
;; メイン実行部

;; 引数を取得する
arg_string := get_read_argument_string()

;; iniファイルから各ファイルのパスを取得する
read_ini_file_paths()

;; emacsの起動状態をチェックして起動する
start_emacs()


;; =============================================================
;; 関数

;; 引数を取得し、文字列に整形して出力する
;; 引数が存在しないならNULLを返す
get_read_argument_string()
{
	local arg_string
	;; 引数の個数までループ
	Loop, %0%
	{
		;; 取得した引数文字列を二重引用符で囲んで連結する
		arg_string .= " """ . %A_Index% . """"
	}
	return arg_string
}

;; iniファイルの内容を読み込む
read_ini_file_paths()
{
	;; グローバル変数を使う
	global
	IniRead, path_emacs, %ini_file%, path, emacs
	IniRead, path_emacsclientw, %ini_file%, path, emacsclientw
	IniRead, path_server, %ini_file%, path, server
}

;; emacsが起動中かどうか調べて起動操作を行う
start_emacs()
{
	;; emacsのPIDを取得
	emacs_pid := get_emacs_pid()
	if (emacs_pid)
	{
		;; すでに起動中なのでクライアントを使う、またはアクティブ化する
		activate_emacs(emacs_pid)
	}
	else
	{
		;; 起動していないので起動する
		run_emacs()
	}
}

;; 引数がある場合はクライアントを起動する
;; 引数がない場合はemacsをアクティブにする
activate_emacs(emacs_pid)
{
	;; クライアントのパスとサーバーファイルのパス、引数を使用
	global path_emacsclientw, path_server, arg_string
	if(arg_string)
	{
		;; 引数が存在するならクライアントにファイルを送る
		Run, "%path_emacsclientw%" -n "%arg_string%"
	}
	else
	{
		;; 引数が存在しないならプロセスのウィンドウをアクティブ化する
		WinActivate, ahk_pid %emacs_pid%
	}
}

;; emacsを起動する
run_emacs()
{
	;; emacs本体のパスと引数を使用
	global path_emacs, arg_string
	;; emacsを起動する
	Run, "%path_emacs%" "%arg_string%"
}

;; emacsのPIDを取得する
get_emacs_pid()
{
	;; emacs.exeプロセスの存在を確認
	Process, Exist, emacs.exe
	;; プロセスが存在しているならプロセスID,存在しないなら0を返す
	return ErrorLevel
}


;; =============================================================
;; End
