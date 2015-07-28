;;; -*- Mode: Emacs-Lisp ; Coding: utf-8-dos -*-
;;; last updated : 2011/08/13.22:53:22

;;=========================================================================
;; C, C++, Java Misc Mode  Extension & Connection                               
;;=========================================================================



;;-------------------------------------------------------------------------
;; C/C++ keyword Extension                                                      
;;-------------------------------------------------------------------------



;;-------------------------------------------------------------------------
;; Function <---> File  autoload & connection                         
;;-------------------------------------------------------------------------

;; c-mode
(autoload 'c-mode "cc-mode" "C Edit Mode" t)
;; c++-mode
(autoload 'c++-mode "cc-mode" "C++ Edit Mode" t)
;; java-mode
(autoload 'java-mode "cc-mode" "Java Edit Mode" t)

;; user-cpp-mode
;;(autoload 'user-cpp-library-face-keyword-extension "user-cpp-library-keyword-ext" "USER C library keywords Extension Mode" t)



;;-------------------------------------------------------------------------
;; C-Mode Extension                                                        
;;-------------------------------------------------------------------------

(defun cc-mode-setup ()
  (interactive)
										; キーバインド
  (define-key c-mode-map "\177" 'backward-delete-char) 
  (define-key c++-mode-map "\177" 'backward-delete-char)
  (local-set-key (kbd "<backtab>") '(lambda() (interactive)(insert "\t")))
										; 動的略語展開では大文字小文字を区別(t:しない,nil:する)
  (make-variable-buffer-local 'dabbrev-case-fold-search)
  (setq dabbrev-case-fold-search nil)
										; 略語の大文字小文字のパターンを保存(t:する,nil:しない)
  (make-variable-buffer-local 'dabbrev-case-replace)
  (setq dabbrev-case-replace nil)


										; mode behavior setting
  (setq tab-width 4)
  (setq c-basic-offset 4)             ;字下げ

										; インデントは3つのモードがあります
										; 1. 自動インデントなし
										;    インデント量はすべてユーザが明示的に空白やTABコードを入れて行います。
										; 2. 半自動インデント
										;    [TAB]キーを押した場合にはその行が、[C-j]による改行を実施した場合には次の行がインデントされます。
										; 3. 全自動インデント     
										;    中括弧、セミコロン、コロン、改行などを入力した時点でその行がインデントされ、さらに自動的に改行が挿入され、次の行のインデント位置にキャレットが移動します。
  (setq c-auto-newline nil)           ;全自動インデント設定(t:enable, nil:disable)
  (setq c-tab-always-indent t)      ;半自動インデント設定 [TAB]or[C-i] キーで(t:インデント実施, nil:TABコードを入力)

										; 字下げスタイルの変更 
  (setq c-offsets-alist
		'(
		  (string . -1000)                ;-- inside multi-line string
		  (c . c-lineup-C-comments)       ;-- inside a multi-line C style block comment
		  (defun-open . 0)                ;関数の頭の中カッコのインデント
		  (defun-close . 0)               ;関数の閉じカッコのインデント
		  (defun-block-intro . +)         ;関数の始めの１行のインデント
		  (class-open . 0)                ;-- brace that opens a class definition
		  (class-close . 0)               ;-- brace that closes a class definition
		  (inline-open . 0)               ;-- brace that opens an in-class inline method
		  (inline-close . 0)              ;-- brace that closes an in-class inline method
		  (func-decl-cont . +)            ;-- the region between a function definition's
                                        ;argument list and the function opening brace
                                        ;(excluding K&R argument declarations). In C, you
                                        ;cannot put anything but whitespace and comments
                                        ;between them; in C++ and Java, throws declarations
                                        ;and other things can appear in this context.
		  (knr-argdecl-intro . 5)         ;-- first line of a K&R C argument declaration
		  (knr-argdecl . 0)               ;-- subsequent lines in a K&R C argument declaration
		  (topmost-intro . 0)             ;関数の頭のインデント
		  (topmost-intro-cont . 0)        ;-- topmost definition continuation lines
		  (member-init-intro . +)         ;-- first line in a member initialization list
		  (member-init-cont . 0)          ;-- subsequent member initialization list lines
		  (inher-intro . +)               ;-- first line of a multiple inheritance list
		  (inher-cont . c-lineup-multi-inher)      ;-- subsequent multiple inheritance lines
										;       (inher-cont . +)
		  (block-open . 0)                ; -- statement block open brace
		  (block-close . 0)               ;閉じカッコのインデント
		  (brace-list-open . 0)           ;-- open brace of an enum or static array list
		  (brace-list-close . 0)          ;-- close brace of an enum or static array list
		  (brace-list-intro . +)          ;-- first line in an enum or static array list
		  (brace-list-entry . 0)          ;-- subsequent lines in an enum or static array list
		  (brace-entry-open . nil)        ;-- subsequent lines in an enum or static array
                                        ;list that start with an open brace.
		  (statement . 0)                 ;中カッコの中のインデント
		  (statement-cont . +)            ;-- a continuation of a C (or like) statement
		  (statement-block-intro . +)     ;中カッコの中の始めの１行
		  (statement-case-intro . +)      ;case の次の行のインデント
		  (statement-case-open . +)       ;-- the first line in a case block starting with brace
		  (substatement . +)              ;-- the first line after an if/while/for/do/else
		  (substatement-open . 0)         ;-- the brace that opens a substatement block
		  (case-label . 0)                ;case のインデント
		  (access-label . -)              ;-- C++ private/protected/public access label
		  (label . 0)                     ;-- any ordinary label
		  (do-while-closure . 0)          ;-- the `while' that ends a do/while construct
		  (else-clause . 0)               ;-- the `else' of an if/else construct
		  (catch-clause . nil)            ;-- the `catch' or `finally' of a try/catch construct
										;       (comment-intro . -1000)         ;コメントのインデント
		  (comment-intro . c-lineup-comment)   ;コメントのインデント
		  (arglist-intro . c-lineup-arglist-intro-after-paren)          ;-- the first line in an argument list
		  (arglist-cont . 0)              ;-- subsequent argument list lines when no
                                        ;arguments follow on the same line as the
                                        ;arglist opening paren
										;       (arglist-cont-nonempty . +)
		  (arglist-cont-nonempty . c-lineup-arglist)  ;-- subsequent argument list lines when at
										;least one argument follows on the same
										;line as the arglist opening paren
		  (arglist-close . c-lineup-arglist)          ;-- the solo close paren of an argument list
		  (stream-op . c-lineup-streamop) ;-- lines continuing a stream operator construct
		  (inclass . +)                   ;-- the construct is nested inside a class definition
		  (cpp-macro . -1000)             ;-- the start of a C preprocessor macro definition
		  (cpp-macro-cont . nil)          ;-- the second and subsequent lines in a
                                        ;multi-line C preprocessor macro definition
		  (friend . 0)                    ;-- a C++ friend declaration
		  (objc-method-intro . -1000)     ;-- the first line of an Objective-C method definition
		  (objc-method-args-cont . c-lineup-ObjC-method-args)  ;-- lines continuing an Objective-C method definition
		  (objc-method-call-cont . c-lineup-ObjC-method-call)  ;-- lines continuing an Objective-C method call
		  (extern-lang-open . 0)          ;-- brace that opens an external language block
		  (extern-lang-close . 0)         ;-- brace that closes an external language block
		  (inextern-lang . +)             ;-- analogous to `inclass' syntactic symbol,
                                        ;but used inside, e.g. extern "C" constructs
		  (namespace-open . nil)          ;-- brace that opens a C++ namespace block
		  (namespace-close . nil)         ;-- brace that closes a C++ namespace block
		  (innamespace . nil)             ;-- analogous to `inextern-lang' syntactic
                                        ;symbol, but used inside C++ namespace constructs
		  (template-args-cont . +)        ;-- C++ template argument list continuations
		  (inlambda . nil)                ;-- in the header or body of a lambda function
		  (lambda-intro-cont . nil)       ;-- continuation of the header of a lambda function
		  (inexpr-statement . nil)        ;-- the statement is inside an expression
		  (inexpr-class . nil)            ;-- the class is inside an expression
		  )
		)

  )



;;------------------------------------------------------------------------------
;; C++Mode Extension                                                            
;;------------------------------------------------------------------------------

(defun cc-mode-hook-functions ()
  (cc-mode-setup)
										;    (c++-mode-extension)
										;    (c-face-keyword-extension)
										;    (user-cpp-library-face-keyword-extension)
  (setq font-lock-maximum-decoration t)
  (turn-on-font-lock)
  )


;;------------------------------------------------------------------------------
;; Suffixes <---> Mode  Connection                                              
;;------------------------------------------------------------------------------

(setq auto-mode-alist
	  (append '(
				;; c-mode
				("\\.c$" . c++-mode)
				("\\.h$" . c++-mode)
				;; c++-mode
				("\\.cpp$" . c++-mode)
				("\\.hpp$" . c++-mode)
				("\\.inl$" . c++-mode)
				;; java-mode
				("\\.java$" . java-mode)
				;; shader-mode
				("\\.sch$" . c++-mode)
				("\\.vs$"  . c++-mode)
				("\\.vsh$" . c++-mode)
				("\\.fs$"  . c++-mode)
				("\\.fsh$" . c++-mode)
				) auto-mode-alist)
	  )


;;------------------------------------------------------------------------------
;; add hook                                                                     
;;------------------------------------------------------------------------------

(add-hook 'c-mode-common-hook 'cc-mode-hook-functions)


;;; c++-mode.el ends here
