(ansi-color-for-comint-mode-on)

(setq multi-term-program "/bin/bash")
(global-set-key "\C-x\C-z" 'multi-term)
(global-set-key (kbd "C-c t") 'multi-term-next)
(setq multi-term-scroll-show-maximum-output t)

(setq term-default-bg-color nil)
(setq term-default-fg-color nil)

(defun my-term-yank ()
  (interactive)
  (if (term-in-line-mode)
      (yank)
    (term-paste)))

(setq term-bind-key-alist
      '(
        ("C-y" . my-term-yank)
        ("s-v" . my-term-yank)
        ("C-c C-c" . term-interrupt-subjob)))

(provide 'init-shell)
