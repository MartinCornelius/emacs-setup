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
(setq-default tab-width-4)
(global-set-key (kbd "TAB") 'indent-for-tab-command)
(electric-pair-mode 1) ;; Auto brackets

;; Font
(set-face-attribute 'default nil
		    :family "Consolas"
		    :height 140)            ;; 140 = 14pt

;; Package setup
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Install use-package (if not present)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Evil mode :-)
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; Git
(use-package magit :ensure t)

;; Open project and do project-wide searches
(use-package projectile
  :ensure t
  :init (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map))

;; Fuzzy finding + better M-x
(use-package vertico
    :ensure t
    :init
    (vertico-mode))
(use-package orderless
    :ensure t
    :custom
    (completion-styles '(orderless)))
(use-package consult
  :ensure t)

;; ========= MAYBE PILE =========

;; Colorscheme
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (setq doom-themes-treemacs-theme "doom-atom"))
