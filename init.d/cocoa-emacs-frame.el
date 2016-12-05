;; set frame size
(setq initial-frame-alist
      '((top . 22) (left . 840)
	(height . 99) (width . 240)))

;; set input method for mac
;;(setq default-input-method "MacOSX")
(require 'mozc)
(setq default-input-method "japanese-mozc")


;; set Command key for Meta
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))
