;; auto install packages
(require 'cl)

(defvar installing-package-list
  '(
    exec-path-from-shell
    auto-install
    init-loader
    migemo
    helm
    helm-package
    helm-swoop
    helm-migemo
    magit
    ace-jump-mode
    undohist
    switch-window
    persp-mode
    psession
    smart-cursor-color
    mew
    open-junk-file
    visual-regexp
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
