;; set frame size
(setq initial-frame-alist
      '((top . 22) (left . 1040)
	(height . 99) (width . 211)))

;; set input method for mac
(setq default-input-method "MacOSX"))

(when (package-installed-p 'exec-path-from-shell)
  (exec-path-from-shell-initialize))
