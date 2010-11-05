;; malabar mode
(add-to-list 'load-path (concat dotfiles-dir "vendor/malabar-1.4.0/lisp"))
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)
(require 'malabar-mode)
(setq malabar-groovy-lib-dir (concat dotfiles-dir "vendor/malabar-1.4.0/lib"))
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(add-hook 'malabar-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'malabar-compile-file-silently
                      nil t)))
(add-hook 'malabar-mode-hook 'run-coding-hook)
