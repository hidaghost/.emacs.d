;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; Settings for UI ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; open with full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; turn off splash screen
(setq inhibit-splash-screen t)

;; turn off tool bar
(tool-bar-mode -1)
;; turn off scroll bar
(scroll-bar-mode -1)

;; turn on global linum mode
(global-linum-mode t)
;; highlight current line
(global-hl-line-mode t)

;; load theme
(load-theme 'solarized-light t)

(provide 'init-ui)
