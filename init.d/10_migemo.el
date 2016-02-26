;; migemo
(when (package-installed-p 'migemo)
  (when (memq window-system '(ns))
    (setq migemo-command "/usr/local/bin/cmigemo")
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
    )

  (when (memq system-type '(gnu/linux))
    (setq migemo-command "/usr/bin/cmigemo")
    (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
    )
  (when (memq window-system '(w32))
    (if (equal system-name "PCS40513")
	(progn
	  (setq migemo-command "d:/software/cmigemo-default-win32/cmigemo.exe")
	  (setq migemo-dictionary "D:/software/cmigemo-default-win32/dict/utf-8/migemo-dict"))
      (progn
	(setq migemo-command "c:/Apps/cmigemo-default-win32/cmigemo.exe")
	(setq migemo-dictionary "c:/Apps/cmigemo-default-win32/dict/utf-8/migemo-dict")
	)))

  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
  )
