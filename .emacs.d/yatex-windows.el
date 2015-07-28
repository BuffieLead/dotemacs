;;
;; YaTeX
;;
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvipdf-command "tasklist /fi \"IMAGENAME eq AcroRd32.exe\" /nh | findstr \"AcroRd32.exe\" > nul && echo exit | pdfdde --rxi & dvipdfmx")
(setq YaTeX-dvi2-command-ext-alist
      '(("dviout\\|yap" . ".dvi")
        ("psv" . ".ps")
        ("TeXworks\\|SumatraPDF\\|evince\\|okular\\|firefox\\|chrome\\|AcroRd32\\|pdfopen" . ".pdf")))
;(setq tex-command "latexmk")
;(setq tex-command "latexmk -e \"$latex=q/platex -kanji=utf8 -guess-input-enc -synctex=1/\" -e \"$bibtex=q/pbibtex -kanji=utf8/\" -e \"$makeindex=q/mendex -U/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
;(setq tex-command "latexmk -e \"$latex=q/platex -kanji=utf8 -guess-input-enc -synctex=1/\" -e \"$bibtex=q/pbibtex -kanji=utf8/\" -e \"$makeindex=q/mendex -U/\" -e \"$dvips=q/dvips %O -z -f %S | convbkmk -g > %D/\" -e \"$ps2pdf=q/ps2pdf.bat %O %S %D/\" -norc -gg -pdfps")
;(setq tex-command "latexmk -e \"$latex=q/uplatex -kanji=utf8 -no-guess-input-enc -synctex=1/\" -e \"$bibtex=q/upbibtex/\" -e \"$makeindex=q/mendex -U/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
;(setq tex-command "latexmk -e \"$latex=q/uplatex -kanji=utf8 -no-guess-input-enc -synctex=1/\" -e \"$bibtex=q/upbibtex/\" -e \"$makeindex=q/mendex -U/\" -e \"$dvips=q/dvips %O -z -f %S | convbkmk -u > %D/\" -e \"$ps2pdf=q/ps2pdf.bat %O %S %D/\" -norc -gg -pdfps")
;(setq tex-command "latexmk -e \"$pdflatex=q/pdflatex -synctex=1/\" -e \"$bibtex=q/bibtex/\" -e \"$makeindex=q/makeindex/\" -norc -gg -pdf")
;(setq tex-command "latexmk -e \"$pdflatex=q/lualatex -synctex=1/\" -e \"$bibtex=q/bibtexu/\" -e \"$makeindex=q/texindy/\" -norc -gg -pdf")
;(setq tex-command "latexmk -e \"$pdflatex=q/luajitlatex -synctex=1/\" -e \"$bibtex=q/bibtexu/\" -e \"$makeindex=q/texindy/\" -norc -gg -pdf")
;(setq tex-command "latexmk -e \"$pdflatex=q/xelatex -synctex=1/\" -e \"$bibtex=q/bibtexu/\" -e \"$makeindex=q/texindy/\" -norc -gg -xelatex")
;(setq tex-command "platex -kanji=utf8 -guess-input-enc -synctex=1")
(setq tex-command "pdfplatex.bat")
;(setq tex-command "pdfplatex1.bat")
;(setq tex-command "pdfplatex2.bat")
;(setq tex-command "uplatex -kanji=utf8 -no-guess-input-enc -synctex=1")
;(setq tex-command "pdfuplatex.bat")
;(setq tex-command "pdfuplatex1.bat")
;(setq tex-command "pdfuplatex2.bat")
;(setq tex-command "pdflatex -synctex=1")
;(setq tex-command "lualatex -synctex=1")
;(setq tex-command "luajitlatex -synctex=1")
;(setq tex-command "xelatex -synctex=1")
(setq bibtex-command (cond ((string-match "uplatex" tex-command) "upbibtex")
                           ((string-match "platex" tex-command) "pbibtex -kanji=utf8")
                           ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "bibtexu")
                           (t "bibtex")))
(setq makeindex-command (cond ((string-match "uplatex" tex-command) "mendex -U")
                              ((string-match "platex" tex-command) "mendex -U")
                              ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "texindy")
                              (t "makeindex")))
(setq dvi2-command (cond ((string-match "pdf\\|lua\\|xe" tex-command) "texworks")
                         (t "c:/usr/share/tex/dviout/dviout.exe -1")))
(setq dviprint-command-format (cond ((string-match "pdf\\|lua\\|xe" tex-command) "pdfopen --rxi --file %s")
                                    (t "echo open %s | sed -e \"s/\\.[^.]*$/\\.pdf/\" | pdfdde --rxi")))

;(defun sumatrapdf-forward-search ()
;  (interactive)
;  (let* ((ctf (buffer-name))
;         (mtf)
;         (pf)
;         (ln (format "%d" (line-number-at-pos)))
;         (cmd (if (file-exists-p "C:/Program Files/SumatraPDF/SumatraPDF.exe")
;                  "\"C:/Program Files/SumatraPDF/SumatraPDF\""
;                "\"C:/Program Files (x86)/SumatraPDF/SumatraPDF\""))
;         (args))
;    (if (YaTeX-main-file-p)
;        (setq mtf (buffer-name))
;      (progn
;        (if (equal YaTeX-parent-file nil)
;            (save-excursion
;              (YaTeX-visit-main t)))
;        (setq mtf YaTeX-parent-file)))
;    (setq pf (concat (car (split-string mtf "\\.")) ".pdf"))
;    (setq args (concat "-reuse-instance \"" pf "\" -forward-search \"" ctf "\" " ln))
;    (message (concat cmd " " args))
;    (process-kill-without-query
;     (start-process-shell-command "sumatrapdf" nil cmd args))))

;(add-hook 'yatex-mode-hook
;          '(lambda ()
;             (define-key YaTeX-mode-map (kbd "C-c s") 'sumatrapdf-forward-search)))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))

;;
;; RefTeX with YaTeX
;;
;(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))
