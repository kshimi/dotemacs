(when (or (eq system-type 'darwin)
          (eq system-type 'gnu/linux))
  (use-package vterm
    :commands vterm
    :custom
    (vterm-max-scrollback 10000)
    ;; 描写の遅延を短くして、ガタつきを抑える
    (vterm-timer-delay 0.01))

  ;; Claude Codeなど、特定のツールを快適に使うための
  ;; ターミナル内でのキーバインド競合回避
  (add-hook 'vterm-mode-hook
            (lambda ()
	      (display-line-numbers-mode -1)
	      (visual-line-mode -1)
              ;; スクロールマージンを0にして、Emacs側のスクロール計算が
              ;; vtermの描写を邪魔しないようにする
              (setq-local scroll-margin 0)
              ;; 画面が急に飛ばないように設定
              (setq-local scroll-conservatively 101)
              (setq-local confirm-kill-processes nil)
              ;; Emacsのキーバインドを優先させたい場合はここで設定
              (define-key vterm-mode-map (kbd "C-y") 'vterm-yank))))
