;; expand-region
(when (package-installed-p 'expand-region)
  (require expand-region)
  (global-set-key (kdb "C-M-SPC") 'er/expand-region))
