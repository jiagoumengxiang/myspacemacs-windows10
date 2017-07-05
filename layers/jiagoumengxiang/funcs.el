
;;shell here
(defun hr-open-powershell ()
  "Multiply NUMBER by seven."
  (interactive)
  (call-process-shell-command  "C:/Users/kingcc/program/cmder_mini/Cmder.exe %HOME%" nil nil))

;;shell here
(defun hr-open-powershell-here ()
  "Multiply NUMBER by seven."
  (interactive)
  (cond ((stringp (buffer-file-name))
         (call-process-shell-command (format "C:/Users/kingcc/program/cmder_mini/Cmder.exe %s" (substring (buffer-file-name) 0 (string-match (buffer-name) (buffer-file-name)))) nil nil))))

(defun hr-open-powershel-dire ()
  "some ..."
  (interactive)
  (call-process-shell-command  (format "C:/Users/kingcc/program/cmder_mini/Cmder.exe %s" (dired-default-directory)) nil nil))

;;shell here
(defun hr-open-wsl-here ()
  "Multiply NUMBER by seven."
  (interactive)
  (cond ((stringp (buffer-file-name))
         (call-process-shell-command (format "C:/Users/kingcc/program/wsl-terminal/open-wsl.exe %s" (substring (buffer-file-name) 0 (string-match (buffer-name) (buffer-file-name)))) nil nil))))

;;explorer here
(defun hr-open-explorer()
  "Multiply NUMBER by seven."
  (interactive)
  (cond ((stringp (buffer-file-name))
         (call-process-shell-command (format "start %s" (substring (buffer-file-name) 0 (string-match (buffer-name) (buffer-file-name)))) nil nil))))

;;shell here
(defun hr-open-chrome()
  "Multiply NUMBER by seven."
  (interactive)
  (call-process-shell-command  "start %HOME%/.spacemacs.d/chrome" nil nil))



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




(defun hr-request()
  ""
  (interactive)
  (request
   "http://httpbin.org/get"
   :params '(("key" . "value") ("key2" . "value2"))
   :parser 'json-read
   :success (cl-function
             (lambda (&key data &allow-other-keys)
               (message "I sent: %S" (assoc-default 'args data))))))



