;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings for KBs ;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; bind some usual keys for code search
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

(provide 'init-keybindings)
