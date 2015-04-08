;; add local library path recursivery to load-path
(let ((default-directory "~/.emacs.d/lib"))
  (setq load-path
	(append
	 (let ((load-path (copy-sequence load-path)))
	   (normal-top-level-add-subdirs-to-load-path))
	 load-path)))
