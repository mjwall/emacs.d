(add-hook 'sh-mode-hook 'run-coding-hook)

(require 'init-flymake-shell)
(add-hook 'sh-mode-hook 'flymake-shell-load)

(provide 'init-sh)
