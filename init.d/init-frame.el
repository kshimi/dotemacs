;;; init-frame.el --- frame configulations

;;; Commentary:
;;; Code:

(when (memq window-system '(mac ns))
  (setq initial-frame-alist
	'((top . 22) (left . 1610)
	  (height . 99) (width . 130)))
  (set-fontset-font nil 'japanese-jisx0208
		    (font-spec :family "Hiragino Kaku Gothic ProN"))
  )

(when (memq window-system '(x))
  (setq initial-frame-alist
	'((height . 50) (width . 99)))
  (set-face-attribute 'default nil
		      :family "Ricty"
		      :height 100)
  (set-fontset-font (frame-parameter nil 'font)
		    'japanese-jisx0208
		    (cons "Ricty" "iso10646-1"))
  (set-fontset-font (frame-parameter nil 'font)
		    'japanese-jisx0212
		    (cons "Ricty" "iso10646-1"))
  (set-fontset-font (frame-parameter nil 'font)
		    'katakana-jisx0201
		    (cons "Ricty" "iso10646-1"))
					;  (set-fontset-font nil 'japanese-jisx0208
					;		    (font-spec :family "Takao Pゴシック"))
					;  (set-face-attribute 'default (selected-frame) :height 90)
  )

(tool-bar-mode -1)

(provide 'init-frame)
;;; init-frame.el ends here
