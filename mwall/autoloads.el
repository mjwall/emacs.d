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
(add-to-list 'load-path (concat dotfiles-dir "vendor/boinkor-slime"))
(require 'slime-autoloads)
(add-to-list 'load-path (concat dotfiles-dir "vendor/boinkor-slime/contrib"))
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(slime-setup '(slime-repl))
(setq slime-net-coding-system 'utf-8-unix)
;; add paredit to slime
(defun slimeify ()
  (paredit-mode 1)
  (define-key slime-repl-mode-map ;; stop slime from grabbing del
    (read-kbd-macro paredit-backward-delete-key)
    nil))

(add-hook 'slime-repl-mode-hook 'slimeify)

;; Clojure mode
(add-to-list 'load-path (concat dotfiles-dir "vendor/clj-mode"))
(require 'clojure-mode)
(add-hook 'clojure-mode-hook 'run-coding-hook)
(add-hook 'clojure-mode-hook (lambda () (paredit-mode +1)))
