;;; init-global-configs.el --- global configulations

;;; Commentary:
;;; Code:
(show-paren-mode t)

(add-hook 'after-init-hook
	  (lambda ()

	    ;; Mac OS X specific settings
	    (when (memq window-system '(mac ns))
	      (lambda ()
		(when (package-installed-p 'exec-path-from-shell)
		  (exec-path-from-shell-initialize))
		(setq (default-input-method "MacOSX"))))

	    ;; Linux specific settings
	    (when (memq window-system '(x))
	      (lambda ()
		(require 'mozc)
		(setq default-input-method "japanese-mozc")))

	    ;; helm
	    (when (package-installed-p 'helm)
	      (setq helm-command-prefix-key "C-c h")

	      (require 'helm-config)
	      (require 'helm-eshell)
	      (require 'helm-files)
	      (require 'helm-grep)
	      ;;(require 'helm-migemo)
;	      (require 'helm-rb)
;	      (require 'helm-rails)
;	      (global-set-key (kbd "C-c h") 'helm-mini)
	      (global-set-key (kbd "M-y") 'helm-show-kill-ring)
	      (global-set-key (kbd "C-x b") 'helm-mini)
	      (helm-mode 1)
	      )

	    (when (package-installed-p 'projectile)
	      (projectile-global-mode)
	      )

	    ;; google-this
	    (when (package-installed-p 'google-this)
	      (google-this-mode t))

	    ;; auto-complete
;	    (ac-config-default)

	    ;; key binding
	    (load-library "term/bobcat")
	    (when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

	    ;; exec-path
	    (when (memq window-system '(mac ns))
	      (exec-path-from-shell-initialize))

	    ;; org-mode
	    (require 'org)
	    (setq org-directory "~/org/")
	    (setq org-capture-templates
		  '(("m" "Memo" entry (file+headline "memo.org" "Memo")
		     "** %U%?\n%i\n")))
	    (global-set-key (kbd "C-c c") 'org-capture)
	    ;; 時刻の記録をagendaに表示させる
	    (setq org-agenda-start-with-log-mode t)
	    ;; inbox.orgのサンプルにあわせ、今日から30日分の予定を表示させる
	    (setq org-agenda-span 30)
	    ;; org-agendaで扱うorgファイルたち
	    (setq org-agenda-files '("~/org/inbox.org" "~/org/daily-projects.org"))
	    ;; C-c a aでagendaのメニューを表示する
	    ;; agendaには、習慣・スケジュール・TODOを表示させる
	    (global-set-key (kbd "C-c a") 'org-agenda)
	    (setq org-agenda-custom-commands
		  '(("a" "Agenda and all TODO's"
		     ((tags "project-CLOCK=>\"<today>\"|repeatable") (agenda "") (alltodo)))))
	    ;; <f6>で直接org習慣仕事術用agendaを起動させる
	    (defun org-agenda-default ()
	      (interactive)
	      (org-agenda nil "a"))
	    (global-set-key (kbd "<f6>") 'org-agenda-default)

	    ;; C-x C-zで試行錯誤ファイルを開く
	    (require 'open-junk-file)
	    (global-set-key (kbd "C-x C-z") 'open-junk-file) 

	    ;;式の評価結果を注釈するための設定
	    (require 'lispxmp) 
	    ;; emacs-lisp-modeでC-c C-dを押すと注釈される
	    (define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)
	    
	    ;;括弧の対応を保持して編集する設定
	    ;; (require 'paredit) 
	    ;; (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode) 
	    ;; (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode) 
	    ;; (add-hook 'lisp-mode-hook 'enable-paredit-mode) 
	    ;; (add-hook 'ielm-mode-hook 'enable-paredit-mode)

	    ;;自動バイトコンパイル
	    (require 'auto-async-byte-compile) 
	    ;;自動バイトコンパイルを無効にするファイル名の正規表現
	    (setq auto-async-byte-compile-exclude-files-regexp "/junk/") 
	    (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode) 
	    (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode) 
	    (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode) 
	    (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode) 
	    (setq eldoc-idle-delay 0.2) ;すぐに表示したい
	    (setq eldoc-minor-mode-string "") ;モードラインにElDocと表示しない

	    ;;釣り合いのとれる括弧をハイライトする
	    (show-paren-mode 1) 

	    ;;改行と同時にインデントも行う
;	    (global-set-key "\C-j" 'newline-and-indent) 

	    ;; find-functionをキー割り当てする
	    (find-function-setup-keys)

	    ))

(provide 'init-global-configs)
;;; init-global-configs.el ends here
