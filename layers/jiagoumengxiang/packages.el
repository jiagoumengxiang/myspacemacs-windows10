;;; packages.el --- jiagoumengxiang layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <kingcc@DESKTOP-L9KJI1G>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `jiagoumengxiang-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `jiagoumengxiang/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `jiagoumengxiang/pre-init-PACKAGE' and/or
;;   `jiagoumengxiang/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst jiagoumengxiang-packages
  '(
;;    request
;;    org-gcal
;;    alert
    org-brain
    )
  "The list of Lisp packages required by the jiagoumengxiang layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

;; (defun jiagoumengxiang/init-request()
;;   "Initialize calfw and add key-bindings"
;;   (use-package request)
;;   )

;; (defun jiagoumengxiang/init-org-gcal ()
;;   "Initialize org-gcal"
;;   (use-package org-gcal)
;;   )



;; (defun jiagoumengxiang/init-alert ()
;;   "Initialize alert"
;;   (use-package alert)
;;  )

(defun jiagoumengxiang/init-org-brain()
  (use-package org-brain
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys
        ;; org-brain
        "aob" 'org-brain-open
        "aoB" 'org-brain-visualize)
      (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
    ;;org-brain
    (setq org-brain-path "~/Documents/jianguocloud/brain")
    ;; For Evil users
    (with-eval-after-load 'evil
      (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
    :config
    ;; Save/load org-brain caches to/from disk
    (org-brain-activate-cache-saving)
    ))


;;packages.el ends here
