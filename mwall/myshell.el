;; shell stuff from defunkt
;; had to rename to myshell, getting "autoloading failed to define function shell" error.
;(global-set-key "\C-x\C-z" 'shell) ; shortcut for shell
;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;(eval-after-load 'shell
;  '(progn
;     (define-key shell-mode-map [up] 'comint-previous-input)
;     (define-key shell-mode-map [down] 'comint-next-input)
;     (define-key shell-mode-map "\C-p" 'comint-previous-input)
;     (define-key shell-mode-map "\C-n" 'comint-next-input)
;     ))


(require 'multi-term)
(setq multi-term-program "/bin/bash")
(global-set-key "\C-x\C-z" 'multi-term)
(global-set-key (kbd "C-c t") 'multi-term-next)
