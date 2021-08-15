(leaf selectrum
  :ensure t
  :config
  (selectrum-mode +1))

(leaf consult
  :ensure t
  :init
  (leaf orderless :ensure t)
  :config
  (setq completion-styles '(orderless))
  (defun consult-line-symbol-at-point ()
    (interactive)
    (consult-line (thing-at-point 'symbol)))
  (defun my-isearch-or-consult (use-consult)
    (interactive "p")
    (cond
     ((eq use-consult 4) (call-interactively 'consult-line-symbol-at-point))
     (t (call-interactively 'isearch-forward))))
  (global-set-key (kbd "C-s") 'my-isearch-or-consult))

(leaf marginalia
  :ensure t
  :init
  (marginalia-mode))

(leaf projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(leaf expand-region
  :ensure t
  :bind
  (("C-M-SPC" . er/expand-region)))

(leaf visual-regexp
  :ensure t
  :bind
  (("M-%" . vr/query-replace)))

(leaf easy-kill
  :ensure t
  :bind
  (([remap kill-ring-save] . easy-kill)
   ([remap mark-sexp] . easy-mark)))
