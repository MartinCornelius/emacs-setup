;; Disable UI clutter
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(prefer-coding-system 'utf-8)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Use spaces god dammit
(setq-default indent-tabs-mode nil) ;; No tabs in here
(setq-default tab-width 4)
(global-set-key (kbd "TAB") 'indent-for-tab-command)
(electric-pair-mode 1) ;; Auto brackets

;; Fido mode
(fido-vertical-mode t)

;; 80 column ruler
(setopt display-fill-column-indicator-column 80)
(global-display-fill-column-indicator-mode)

;; Font
(set-face-attribute 'default nil
		    :family "Hack"
		    :height 120)            ;; 140 = 14pt

;; Resize bug
(setq frame-resize-pixelwise t)
