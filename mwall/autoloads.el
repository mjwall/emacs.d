;; paredit mode - added to list in mwall.el
(autoload 'paredit-mode "paredit"
     "Minor mode for pseudo-structurally editing Lisp code."
     t)
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))


;; Elisp
(add-hook 'emacs-lisp-mode-hook 'run-coding-hook)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)
(define-key lisp-mode-shared-map (kbd "C-c l") "lambda")
(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

;; Slime
(add-to-list 'load-path (concat dotfiles-dir "/vendor/slime-20100404"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/slime-repl-20100404"))
(require 'slime)
