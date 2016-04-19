(when (eq (window-system) 'w32)

  (if (equal system-name "PCS40513")
      (setq initial-frame-alist
	    '((top . 0) (left . 0)
	      (height . 53) (width . 88)))
    (setq initial-frame-alist
	  '((top . 0) (left . 835)
	    (height . 83) (width . 88))))

  (if (functionp 'w32-ime-initialize)
      (progn
	(w32-ime-initialize)
	(setq default-input-method "W32-IME")
	(setq w32-ime-show-mode-line t))
    (progn
      (setq default-input-method "japanese-skk")
      (setq skk-isearch-start-node 'latin)))
  )

(custom-set-faces
 '(default ((t (:family "MyricaM M" :foundry "outline" :slant normal :weight normal :height 98 :width normal))))
 '(cursor ((t (:background "tomato")))))

(prefer-coding-system 'utf-8)
;;(setq default-process-coding-system '(japanese-cp932-dos . japanese-cp932-dos))
;;(add-to-list 'process-coding-system-alist '("git" utf-8-dos . utf-8-unix))
(setq default-process-coding-system '(utf-8-dos . utf-8-dos))
(setq default-file-name-coding-system 'japanese-cp932-dos)

(setq w32-rwindow-modifier (quote meta))
