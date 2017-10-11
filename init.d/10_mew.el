;;; Commentary: mew
;;; Code:
(use-package mew
  :if (not (memq window-system '(w32)))
  :commands (mew)
  :init
  (setq mew-mail-path "~/Mail")
  (if (boundp 'mail-user-agent)
      (setq mail-user-agent 'mew-user-agent))
  (if (fboundp 'define-mail-user-agent)
      (define-mail-user-agent
	'mew-user-agent
	'mew-user-agent-compose
	'mew-draft-send-message
	'mew-draft-kill
	'mew-send-hook))
  :ensure t
  )
