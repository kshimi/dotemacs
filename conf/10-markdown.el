(use-package markdown-mode
  :mode ("\\.md\\'" . gfm-mode)
  :init
  (setq markdown-command "multimarkdown") ; プレビューに必要（brew install multimarkdown で導入可能）
  :config
  ;; 長い行を画面端で折り返す（物理的な改行は入れない）
  (add-hook 'markdown-mode-hook 'visual-line-mode)
  
  ;; 見出しごとに編集しやすくなる設定
  (setq markdown-header-scaling t)
  
  ;; キーバインドの設定
  :bind (:map markdown-mode-map
              ;; C-c i で見出し一覧を表示してジャンプ（Consult連携）
              ("C-c i" . consult-imenu-multi)
	      )
  :custom-face
  ;; 表のコントラストを改善（icebergテーマに合わせた明るい文字色と控えめな背景色）
  (markdown-table-face ((t (:foreground "#cdd1e6" :background "#2e313f")))))

;; Markdown内での補完（リストのポチなど）を便利にするパッケージ
(use-package markdown-toc
  :after markdown-mode)
