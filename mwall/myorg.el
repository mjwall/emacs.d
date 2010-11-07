(add-to-list 'load-path (concat dotfiles-dir "vendor/org-mode/lisp"))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(global-set-key (kbd "C-c C-s") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-log-done t)

(setq org-directory "~/org")
(setq org-agenda-files (file-expand-wildcards "~/org/*.org"))
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-inbox-for-pull "~/org/inbox.org")
