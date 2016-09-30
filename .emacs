(line-number-mode 1)
(fringe-mode '(16 . 4))
(menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode t)
(tool-bar-mode -1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal)))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(customize-set-variable 'solarized-termcolors 256)
(load-theme 'solarized-dark t)

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))
(global-linum-mode t) ;; Display line number at left

(require 'evil)
(evil-mode 1)
(setq evil-want-fine-undo t)

(require 'helm)
(require 'auto-complete)
(require 'helm-config)
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(setq-default major-mode 'org-mode)
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms
  `((".*" "~/.saves/" t)))

(customize-set-variable 'solarized-termcolors 256)
(setq solarized-scale-org-headlines nil)
