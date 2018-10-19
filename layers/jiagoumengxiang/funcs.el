

(defun hr-markdown-image ()
  "Multiply NUMBER by seven."
  (interactive)
  ;;(start-process "plantuml" "*plantuml*" "" "--detach" "README.mdl"))
  (start-process-shell-command (format "java -jar C:/Users/kingd/plantuml.jar -charset UTF-8 %s -o %s" (buffer-file-name) (substring (buffer-file-name) 0 (string-match (buffer-name) (buffer-file-name)))) nil nil))


(defun hr-markdown-preview ()
  "Multiply NUMBER by seven."
  (interactive)
  (start-process "shiba" "*shiba*" "shiba" "--detach" "README.mdl"))
  ;;(start-process-shell-command "shiba README.md" nil nil))


;;shell here
(defun hr-open-powershell ()
  "Multiply NUMBER by seven."
  (interactive)
  (call-process-shell-command  " start c:/Users/kingd/.spacemacs.d/ConEmu.lnk -Dir %HOME% -run powershell" nil nil))



;;shell here
(defun hr-open-bash ()
  "Multiply NUMBER by seven."
  (interactive)
  (call-process-shell-command  " start c:/Users/kingd/.spacemacs.d/ConEmu.lnk -Dir %HOME% -run bash" nil nil))


;;shell here
(defun hr-open-powershell-here ()
  "Multiply NUMBER by seven."
  (interactive)
  (cond ((stringp (buffer-file-name))
         (call-process-shell-command (format "start c:/Users/kingd/.spacemacs.d/ConEmu.lnk -Dir %s -run powershell" (substring (buffer-file-name) 0 (string-match (buffer-name) (buffer-file-name)))) nil nil))))

(defun hr-open-powershel-dire ()
  "some ..."
  (interactive)
  (call-process-shell-command  (format "start c:/Users/kingd/.spacemacs.d/ConEmu.lnk -Dir %s -run powershell" (dired-default-directory)) nil nil))

;;bash here
(defun hr-open-bash-here ()
  "Multiply NUMBER by seven."
  (interactive)
  (cond ((stringp (buffer-file-name))
         (call-process-shell-command (format "start c:/Users/kingd/.spacemacs.d/ConEmu.lnk -Dir %s -run bash" (substring (buffer-file-name) 0 (string-match (buffer-name) (buffer-file-name)))) nil nil))))

;;bash dir
(defun hr-open-bash-dire ()
  "some ..."
  (interactive)
  (call-process-shell-command  (format "start c:/Users/kingd/.spacemacs.d/ConEmu.lnk -Dir %s -run bash" (dired-default-directory)) nil nil))



;;explorer here
(defun hr-open-explorer()
  "Multiply NUMBER by seven."
  (interactive)
  (cond ((stringp (buffer-file-name))
         (call-process-shell-command (format "start %s" (substring (buffer-file-name) 0 (string-match (buffer-name) (buffer-file-name)))) nil nil))))


(defun hr-notify (title message)
  (interactive)
	(call-process-shell-command  (format "powershell c:/Users/kingd/.spacemacs.d/notify.ps1 %s %s" title message) nil nil))

(defun test-hr-notify()
  (interactive)
  (hr-notify "test" "tttt"))

(defun hr-test()
  "test agenda"
  (interactive)
  (message (buffer-file-name)))
