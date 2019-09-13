;;; Commentary: migemo
;;; Code:
(use-package migemo :ensure t
  :init
  (when (memq window-system '(ns))
    (setq migemo-command "/usr/local/bin/cmigemo")
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
    )

  (when (memq system-type '(gnu/linux))
    (setq migemo-command "/usr/bin/cmigemo")
    (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
    )
  (when (memq window-system '(w32))
    (progn
      (setq migemo-command "c:/Apps/cmigemo-default-win64/cmigemo.exe")
      (setq migemo-dictionary "c:/Apps/cmigemo-default-win64/dict/utf-8/migemo-dict")
      ))
  :custom
  (migemo-options '("-q" "--emacs"))
  (migemo-user-dictionary nil)
  (migemo-regex-dictionary nil)
  (migemo-coding-system 'utf-8-unix)
  :config (migemo-init))
