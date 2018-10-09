;;; Commentary: org
;;; Code:
(use-package org
  :bind (("C-c c" . org-capture)
	 ("C-c a" . org-agenda)
	 ("<f6>" . org-agenda-default)
	 ("C-c l" . org-store-link)
	 )
  :config
  (setq org-directory "~/org/")
  (setq org-capture-templates
	'(("m" "Memo" entry (file+headline "memo.org" "Memo")
	   "** %U %a %?\n%i\n")))
  ;; 時刻の記録をagendaに表示させる
  (setq org-agenda-start-with-log-mode t)
  ;; inbox.orgのサンプルにあわせ、今日から30日分の予定を表示させる
  (setq org-agenda-span 30)
  ;; org-agendaで扱うorgファイルたち
  (setq org-agenda-files '("~/org/inbox.org" "~/org/daily-projects.org"))
  ;; agendaには、習慣・スケジュール・TODOを表示させる
  (setq org-agenda-custom-commands
	'(("a" "Agenda and all TODO's"
	   ((tags "project-CLOCK=>\"<today>\"|repeatable") (agenda "") (alltodo)))))
  (defun org-agenda-default ()
    (interactive)
    (org-agenda nil "a"))
  (defun org-capture-fill-template--stringify-annotation (&rest ignore)
    (unless (stringp (org-capture-get :annotation))
      (plist-put org-capture-plist :annotation (format "%s" (org-capture-get :annotation)))))
  (advice-add 'org-capture-fill-template :before
	      'org-capture-fill-template--stringify-annotation)
  )
