;; open-junk-file
(when (package-installed-p 'open-junk-file)
  (require 'open-junk-file)
  (global-set-key (kbd "C-x C-z") 'open-junk-file)
  )

	    
