;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings for defaults ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; open recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; auto show changes in outer files
(global-auto-revert-mode t)

;; show match parenthesis(emacs lisp mode)
;;(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; disable auto save & backup files 
(setq make-backup-files nil)
(setq auto-save-default nil)

;;;;;;;;;;;;;;;; js2 mode ;;;;;;;;;;;;;;;;
;; js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(provide 'init-better-defaults)
