;;; init-frame.el --- frame configulations

;;; Commentary:
;;; Code:

(if (window-system)
    (setq initial-frame-alist
	  '((top . 22) (left . 1610)
	    (height . 99) (width . 130))))
(set-fontset-font nil 'japanese-jisx0208
 (font-spec :family "Hiragino Kaku Gothic ProN"))

(provide 'init-frame)
;;; init-frame.el ends here
