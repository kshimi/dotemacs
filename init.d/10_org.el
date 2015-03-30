;; org
(when (package-installed-p 'org)
  (require 'org)
  (setq org-directory "~/org/")
  (setq org-capture-templates
	'(("m" "Memo" entry (file+headline "memo.org" "Memo")
	   "** %U%?\n%i\n")))
  (global-set-key (kbd "C-c c") 'org-capture)
  ;; 時刻の記録をagendaに表示させる
  (setq org-agenda-start-with-log-mode t)
  ;; inbox.orgのサンプルにあわせ、今日から30日分の予定を表示させる
  (setq org-agenda-span 30)
  ;; org-agendaで扱うorgファイルたち
  (setq org-agenda-files '("~/org/inbox.org" "~/org/daily-projects.org"))
  ;; C-c a aでagendaのメニューを表示する
  ;; agendaには、習慣・スケジュール・TODOを表示させる
  (global-set-key (kbd "C-c a") 'org-agenda)
  (setq org-agenda-custom-commands
	'(("a" "Agenda and all TODO's"
	   ((tags "project-CLOCK=>\"<today>\"|repeatable") (agenda "") (alltodo)))))
  ;; <f6>で直接org習慣仕事術用agendaを起動させる
  (defun org-agenda-default ()
    (interactive)
    (org-agenda nil "a"))
  (global-set-key (kbd "<f6>") 'org-agenda-default)
  )
