(leaf avy
  :ensure t
  :bind
  ("M-g c" . avy-goto-char)
  ("M-g f" . avy-goto-line)
  ("M-g w" . avy-goto-word-1)
  ("M-g e" . avy-goto-word-0)
  :config
  (avy-setup-default))

(leaf hydra
  :ensure t
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
    ("C-b" org-backward-heading-same-level "backward")))

(leaf multiple-cursors
  :ensure t
  :bind
  ("C-M-c" . mc/edit-lines)
  ("C-M-r" . mc/mark-all-in-region)
  :init
  (global-unset-key "\C-t")
  (defhydra hydra-multiple-cursors (global-map "C-t")
    "multiple-cursors"
    ("C-t" mc/mark-next-like-this "next")
    ("n"   mc/mark-next-like-this-word "word")
    ("p"   mc/mark-previous-like-this "prev")
    ("m"   mc/mark-more-like-this-extended "more")
    ("u"   mc/unmark-next-like-this "un next")
    ("U"   mc/unmark-previous-like-this "un prev")
    ("s"   mc/skip-to-next-like-this "skip")
    ("S"   mc/skip-to-previous-like-this "skip prev")
    ("*"   mc/mark-all-like-this "all")
    ("d"   mc/mark-all-like-this-dwim "dwim")
    ("i"   mc/insert-numbers "num")
    ("o"   mc/sort-regions "sort")
    ("O"   mc/reverse-regions "rev")))
