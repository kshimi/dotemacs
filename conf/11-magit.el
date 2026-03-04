(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch))
  :custom
  ;; リモート操作時のパフォーマンス向上のための設定
  (magit-refresh-status-buffer nil) ; 自動更新を抑えても良い（重い場合）
  :config
  ;; 以前のように、特定の表示スタイルがあればここに追記
  (setq vc-handled-backends nil)
  )
