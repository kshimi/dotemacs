;; auto install packages
(require 'cl)

(defvar installing-package-list
  '(
    exec-path-from-shell
    helm
    migemo
    magit
    ace-jumk-mode
    undohist
    mew
    smart-cursor-color
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
