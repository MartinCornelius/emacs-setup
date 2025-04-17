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
(setq use-package-always-ensure t)

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

;; Colorscheme
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-peacock t))

;; ========= MAYBE PILE =========

;; Syntax highlighting
(use-package typescript-mode :mode "\\.ts\\'")

;; Use devdocs-install to install documenation for std packages
(use-package devdocs
  :bind (("C-c d" . devdocs-lookup)))

;; Good for activating python environments
(use-package pyvenv
  :ensure t
  :config
  (setq pyvenv-mode 1))

;; LSP
(use-package eglot
  :hook ((c++-mode python-mode typescript-mode js-mode web-mode csharp-mode) . eglot-ensure)
  :config
  (setq eglot-autoshutdown t))

;; Autocompletion
(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 1)
  (corfu-popupinfo-mode t)
  :init
  (global-corfu-mode))
(use-package eldoc-box
  :after corfu
  :hook (eglot-managed-mode . eldoc-box-hover-mode))
(setq eldoc-echo-area-use-multiline-p t)
(global-set-key (kbd "C-c h") #'eldoc-box-help-at-point)

;; Errors diagnostics
(use-package flymake
  :hook (eglot-managed-mode . flymake-mode))
(global-set-key (kbd "C-c e") #'flymake-show-buffer-diagnostics)
