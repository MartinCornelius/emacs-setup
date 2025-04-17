;; Disable UI clutter
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Use spaces god dammit
(setq-default indent-tabs-mode nil) ;; No tabs in here
(setq-default tab-width-4)
(global-set-key (kbd "TAB") 'indent-for-tab-command)

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

;; LSP & autocompletion
(use-package lsp-mode :ensure t :hook ((prog-mode . lsp)))
;; Provides all the goodies ;)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable t
	lsp-ui-doc-enable t))
(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-auto-configure-mode))
;; Inline suggestions
(use-package company :ensure t :hook (prog-mode . company-mode))
(use-package flycheck :ensure t :init (global-flycheck-mode))

;; ========= MAYBE PILE =========
;; Git
(use-package magit :ensure t)
;; Open project and do project-wide searches
(use-package projectile
  :ensure t
  :init (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map))
;; File tree sidebar
(use-package treemacs
  :ensure t
  :bind
  ("C-x t t" . treemacs))
;; Fuzzy finding + better M-x
(use-package vertico
    :ensure t
    :init
    (vertico-mode))
(use-package orderless
    :ensure t
    :custom
    (completion-styles '(orderless)))

;; Colorscheme
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (setq doom-themes-treemacs-theme "doom-atom"))

;; For python environments
(use-package pyvenv
  :ensure t
  :config
  (setq pyvenv-mode 1))
