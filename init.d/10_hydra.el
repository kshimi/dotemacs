;;; Commentary: hydra
;;; Code:
(use-package hydra
  :init
  (org-reload)
  :config
  (defhydra hydra-zoom (global-map "<f2>")
    "zoom"
    ("g" text-scale-increase "in")
    ("l" text-scale-decrease "out"))
  (defhydra hydra-window (global-map "C-x")
    "window"
    ("o" other-window "other")
    ("O" delete-window "del")
    ("1" delete-other-windows "del-other")
    ("2" split-window-below "spl-below")
    ("3" split-window-right "spl-right")
    ("{" shrink-window-horizontally "shr-hori")
    ("}" enlarge-window-horizontally "enl-hori")
    ("+" balance-windows "balance")
    ("^" enlarge-window "enlarge")
    ("-" shrink-window "shrink"))
  (defhydra hydra-org (org-mode-map "C-c")
    "heading"
    ("C-n" outline-next-visible-heading "next")
    ("C-p" outline-previous-visible-heading "prev")
    ("C-u" outline-up-heading "up")
    ("C-f" org-forward-heading-same-level "forward")
    ("C-b" org-backward-heading-same-level "backward"))
  :ensure t
  )
