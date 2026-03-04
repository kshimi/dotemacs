(use-package tramp
  :ensure nil ; 標準機能なので ensure は不要
  :custom
  ;; 接続方法のデフォルトを ssh に
  (tramp-default-method "ssh")
  ;; 以前の接続情報を再利用して高速化 (ControlMaster)
  (tramp-use-ssh-controlmaster-options t)
  ;; リモートのパスも補完対象にする
  (tramp-completion-reread-directory-timeout 60)
  ;; 接続を維持する
  (tramp-persistency-file-name (expand-file-name "tramp" user-emacs-directory)))
