(use-package helm-gtags
  :config
  (add-hook 'ruby-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-common-hook 'helm-gtags-mode)
  (add-hook 'emacs-lisp-mode-hook 'helm-gtags-mode)
  (with-eval-after-load 'helm-gtags
    (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
    (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
    (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
    (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
    (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
    (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
    (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack))
  :ensure t
  )
