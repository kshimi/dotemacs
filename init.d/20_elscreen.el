;;; Commentary: elscreen
;;; Code:
(leaf elscreen :ensure t
  :custom
  ((elscreen-tab-display-kill-screen . nil)
   (elscreen-tab-display-control . nil))
  :config (elscreen-start))
