(when (eq (window-system) 'w32)
  (if (equal system-name "PCS70830")
      (setq initial-frame-alist
	    '((top . 0) (left . 0)
	      (height . 60) (width . 95)))
    (setq initial-frame-alist
	  '((top . 0) (left . 835)
	    (height . 82) (width . 88)))))

(custom-set-faces
 '(default ((t (:family "Myrica M" :foundry "outline" :slant normal :weight normal :height 98 :width normal))))
 '(cursor ((t (:background "tomato")))))

(set-default 'buffer-file-coding-system 'utf-8)
(add-to-list 'process-coding-system-alist '("git" utf-8-dos . utf-8-unix))
(add-to-list 'process-coding-system-alist '("Git.Exe" utf-8-dos . utf-8-unix))
(add-to-list 'process-coding-system-alist '("git.EXE" utf-8-dos . utf-8-unix))
(add-to-list 'process-coding-system-alist '("rubocop" utf-8-dos . utf-8-unix))

(setq w32-rwindow-modifier (quote meta))

