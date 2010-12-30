(global-set-key (kbd "C-c C-s") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)
(setq org-completion-use-ido t)

(setq org-directory "~/org")
(setq org-agenda-files (file-expand-wildcards "~/org/*.org"))
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-inbox-for-pull "~/org/inbox.org")

(provide 'init-org-mode)
