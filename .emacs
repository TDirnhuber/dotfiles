(line-number-mode 1)
(fringe-mode '(16 . 4))
(menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode t)
(tool-bar-mode -1)
(ido-mode t)
(setq ido-enable-flex-matching t)
(global-linum-mode t) ;; Display line number at left
(setq column-number-mode t)
(setq linum-relative-current-symbol "")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 102 :width normal)))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(customize-set-variable 'solarized-termcolors 256)
(load-theme 'solarized-dark t)

;;(set-frame-parameter (selected-frame) 'alpha '(90 90))
;;(add-to-list 'default-frame-alist '(alpha 90 90))

(require 'evil)
(require 'evil-surround)
(evil-mode 1)
(global-evil-surround-mode 1)
(setq evil-want-fine-undo t)

(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

(setq initial-minor-mode 'ido-mode)
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)

;; ORG mode
(setq-default major-mode 'org-mode)
(setq initial-major-mode 'org-mode)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(add-hook 'org-mode-hook 'org-indent-mode)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" "~/.saves/" t)))

(setq-default ac-sources (push 'ac-source-yasnippet ac-sources))

(setq solarized-scale-org-headlines nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list (quote (("Zathura" "zathura %o"))))
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Zathura")
     (output-html "xdg-open"))))
 '(package-selected-packages
   (quote
    (ace-window ## avy linum-relative flyspell-correct wc-goal-mode wc-mode yasnippet solarized-theme magit evil-tutor cdlatex auctex ac-helm)))
 '(solarized-termcolors 256 t))

(setq org-agenda-files (quote ("~/todo")))
(yas-global-mode t)
(customize-set-variable 'solarized-termcolors 256)

(require 'tex)
(TeX-global-PDF-mode t)

(require 'popup)
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)
(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     :isearch t
     )))

(setq yas-prompt-functions '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))

(require 'ispell)
(setq ispell-local-dictionary-alist
      '(("en_GB" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil nil nil utf-8)))
(setq ispell-program-name "hunspell"          ; Use hunspell to correct mistakes
      ispell-dictionary   "en_GB") ; Default dictionary to use
(wc-mode t)
(linum-relative-toggle)

;evil mode stuff
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(define-key evil-motion-state-map (kbd "p") #'avy-goto-word-0)
(define-key evil-motion-state-map (kbd "P") #'avy-goto-line)
(define-key evil-normal-state-map (kbd "gp") #'avy-goto-word-0)
(define-key evil-normal-state-map (kbd "gl") #'avy-goto-line)
(define-key evil-normal-state-map (kbd "gf") #'ido-find-file)
(define-key evil-normal-state-map (kbd "gs") #'save-buffer)
(define-key evil-normal-state-map (kbd "gb") #'ido-switch-buffer)
(define-key evil-normal-state-map (kbd "go") #'kill-this-buffer)
(define-key evil-normal-state-map (kbd "gw") #'ace-window)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)

(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
