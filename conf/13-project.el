(use-package projectile
  :init
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :custom
  (projectile-project-search-path '("~/projects" "~/work")) ; よく使うディレクトリがあれば
  )

(use-package consult
  ;; ... 以前の consult 設定に以下を追加 ...
  :bind (;; プロジェクト内 / ディレクトリ内を rg で検索
         ("M-s r" . consult-ripgrep)
	 ))
