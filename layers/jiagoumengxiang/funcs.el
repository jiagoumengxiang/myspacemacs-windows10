
;;shell here
(defun hr-open-powershell ()
  "Multiply NUMBER by seven."
  (interactive)
  (call-process-shell-command  "start powershell -NoExit cd %HOME%" nil nil))

;;shell here
(defun hr-open-powershell-here ()
  "Multiply NUMBER by seven."
  (interactive)
  (cond ((stringp (buffer-file-name))
         (call-process-shell-command (format "start powershell -NoExit cd %s" (substring (buffer-file-name) 0 (string-match (buffer-name) (buffer-file-name)))) nil nil))))

;;explorer here
(defun hr-open-explorer()
  "Multiply NUMBER by seven."
  (interactive)
  (cond ((stringp (buffer-file-name))
         (call-process-shell-command (format "start explorer  %s" (substring (buffer-file-name) 0 (string-match (buffer-name) (buffer-file-name)))) nil nil))))


(defun hr-notify (title message)
	(call-process "notify"
                nil 0 nil
                "-t" title
                "-m" message
                ))

(add-hook 'org-pomodoro-finished-hook
          (lambda ()
            (hr-notify "Pomodoro completed!" "Time for a break.")))
(add-hook 'org-pomodoro-break-finished-hook
          (lambda ()
            (hr-notify "Pomodoro Short Break Finished" "Ready for Another?")))
(add-hook 'org-pomodoro-long-break-finished-hook
          (lambda ()
            (hr-notify "Pomodoro Long Break Finished" "Ready for Another?")))
(add-hook 'org-pomodoro-killed-hook
          (lambda ()
            (hr-notify "Pomodoro Killed" "One does not simply kill a pomodoro!")))

