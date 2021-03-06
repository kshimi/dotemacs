;; apply ansi color escape on compilation buffer
(add-hook 'compilation-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'compilation-filter-hook
	  '(lambda ()
	     (let ((start-marker (make-marker))
		   (end-marker (process-mark (get-buffer-process (current-buffer)))))
	       (set-marker start-marker (point-min))
	       (ansi-color-apply-on-region start-marker end-marker))))
