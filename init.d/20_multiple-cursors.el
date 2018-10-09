;;; Commentary: multiple-cursors
;;; Code:
(use-package multiple-cursors
  :ensure t
  :bind (("C-M-c" . mc/edit-lines)
         ("C-M-r" . mc/mark-all-in-region))
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
    ("O"   mc/reverse-regions "rev"))  
  )
