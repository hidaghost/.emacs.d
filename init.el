
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; enhance package system
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("melpa" . "http://elpa.emacs-china.org/gnu/")
			   ("gnu" . "http://elpa.emacs-china.org/melpa/")))
  )
(require 'cl)
;; add whatever packages you want here
(defvar hida/packages '(
			;; auto complete
			company

			;; smex (enhance M-x)
			;;smex

			;; smart parens (smart insertion for parens)
			hungry-delete
			smartparens

			;; swiper counsel (enhanced search & minibuffer complete tools)
			swiper
			counsel

			;; popwin (enhanced window pop)
			popwin
			
			;; js2-mode (for javascript coding)
			js2-mode
			
			;; theme
			monokai-theme
			solarized-theme
			)
  "Default packages"
  )
(setq package-selected-packages hida/packages)

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

;; auto show changes in outer files
(global-auto-revert-mode t)

;; bind some usual keys for code search
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; open with full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; show match parenthesis(emacs lisp mode)
;;(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; turn off splash screen
(setq inhibit-splash-screen t)

;; set F2 to quickly open init file
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
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
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; disable auto save & backup files 
(setq make-backup-files nil)
(setq auto-save-default nil)

;; load theme
(load-theme 'solarized-light t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; mode settings ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;; org mode ;;;;;;;;;;;;;;;;
;; highlight syntax
(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
;;;;;;;;;;;;;;;; org mode ;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;; js2 mode ;;;;;;;;;;;;;;;;
;; js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
;;;;;;;;;;;;;;;; js2 mode ;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Packages settings ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; global company mode
(global-company-mode t)

;; smex settings
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)

;; smart parens
(require 'smartparens-config)
(smartparens-global-mode t)

;; swiper councel ivy settings
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

;; popwin
(require 'popwin)
(popwin-mode t)
