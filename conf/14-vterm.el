(when (or (eq system-type 'darwin)
          (eq system-type 'gnu/linux))
  (use-package vterm
    :commands vterm
    :custom
    (vterm-max-scrollback 10000)
    ;; 描写の遅延をさらに調整（環境に合わせて0.01〜0.05の間で調整）
    (vterm-timer-delay 0.01))

  ;; 描写パフォーマンス向上のためのグローバル設定
  (setq fast-but-imprecise-scrolling t)
  (setq jit-lock-defer-time 0.05)

  ;; Claude Codeなど、特定のツールを快適に使うための
  ;; ターミナル内でのキーバインド競合回避
  (add-hook 'vterm-mode-hook
            (lambda ()
	      (display-line-numbers-mode -1)
	      (visual-line-mode -1)
              ;; 行間（line-spacing）をゼロにする
              (setq-local line-spacing 0)
              ;; 括弧の強調表示をオフ（ターミナル内での計算負荷軽減）
              (setq-local show-paren-mode nil)
              ;; スクロールマージンを0にして、Emacs側のスクロール計算が
              ;; vtermの描写を邪魔しないようにする
              (setq-local scroll-margin 0)
              ;; 画面が急に飛ばないように設定
              (setq-local scroll-conservatively 101)
              (setq-local confirm-kill-processes nil)
              ;; Emacsのキーバインドを優先させたい場合はここで設定
              (define-key vterm-mode-map (kbd "C-y") 'vterm-yank))))
