
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; enhance package system
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )
(require 'cl)
;; add whatever packages you want here
(defvar hida/packages '(
			company
			monokai-theme
			)
  "Default packages"
  )
(defun hida/packages-installed-p()
  (loop for pkg in hida/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)
	)
  )
(unless (hida/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg hida/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg)
      )
    )
  )


;; open with full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; show match parenthesis
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; turn off splash screen
(setq inhibit-splash-screen t)

;; set F2 to quickly open init file
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; turn off tool bar
(tool-bar-mode -1)
;; turn off scroll bar
(scroll-bar-mode -1)

;; turn off electric indent mode
;;(electric-indent-mode -1)

;; turn on global linum mode
(global-linum-mode t)
;; highlight current line
(global-hl-line-mode t)

;; open recent files
()

;; cancel backup files save 
(setq make-backup-files nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Org mode settings ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; highlight syntax
(require 'org)
(setq org-src-fontify-natively t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Packages settings ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; global company mode
(global-company-mode t)
