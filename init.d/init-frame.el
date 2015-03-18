;;; init-frame.el --- frame configulations

;;; Commentary:
;;; Code:

(when (eq (window-system) 'mac)   
  (setq initial-frame-alist
	'((top . 22) (left . 1610)
	  (height . 99) (width . 130)))
  (set-fontset-font nil 'japanese-jisx0208
		    (font-spec :family "Hiragino Kaku Gothic ProN"))
  )

(when (eq (window-system) 'x)
  (setq initial-frame-alist
	'((height . 50) (width . 99)))
  (set-fontset-font nil 'japanese-jisx0208
		    (font-spec :family "Takao Pゴシック"))
  (set-face-attribute 'default (selected-frame) :height 90)
  )

(tool-bar-mode -1)

(provide 'init-frame)
;;; init-frame.el ends here
