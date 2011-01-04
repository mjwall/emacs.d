(add-to-list 'auto-mode-alist '("buildfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.autotest" . ruby-mode))
(add-hook 'ruby-mode-hook 'run-coding-hook)

(provide 'init-ruby)
