;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings for packages ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (>= emacs-major-version 24)
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

;; global company mode
(global-company-mode t)

;; smex settings
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)

;; smart parens
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

(provide 'init-packages)
