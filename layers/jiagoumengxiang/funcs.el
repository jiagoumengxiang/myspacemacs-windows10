
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

;;shell here
(defun hr-open-chrome()
  "Multiply NUMBER by seven."
  (interactive)
  (call-process-shell-command  "start %HOME%/.spacemacs.d/chrome" nil nil))

(defun hr-notify (title message)
  (interactive)
	(call-process-shell-command  (format "powershell c:/Users/kingd/.spacemacs.d/notify.ps1 %s %s" title message) nil nil))

(defun test-hr-notify()
  (interactive)
  (hr-notify "test" "tttt"))

(defun hr-test()
  "test agenda"
  (interactive)
  (org-agenda-redo))

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

