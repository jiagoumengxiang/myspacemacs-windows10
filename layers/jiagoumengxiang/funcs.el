
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
