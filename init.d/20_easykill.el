;;; Commentary: easy-kill
;;; Code:
(use-package easy-kill :ensure t
  :bind
  ([remap kill-ring-save] . easy-kill)
  ([remap mark-sexp] . easy-mark))
