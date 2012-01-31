
(when *is-a-mac*
  ;; from http://stackoverflow.com/questions/1850292/emacs-23-1-and-mac-os-x-problem-with-files-drag-and-drop
  (define-key global-map [ns-drag-file] 'my-ns-open-files)
  (setq ns-pop-up-frames nil) ; make emacs open in existing frames
  (defun my-ns-open-files ()
    "Open files in the list `ns-input-file'."
    (interactive)
    (mapc 'find-file ns-input-file)
    (setq ns-input-file nil))

  ;; fonts
  ;; (setq mac-allow-anti-aliasing nil)
  (set-default-font "Monaco-15")
  ;; (set-default-font "Inconsolata-14")

  ;; make command key on mac the 'meta'
  (setq mac-command-modifier 'meta)
  
  (when (eq system-type 'darwin)
    ;; Work around a bug on OS X where system-name is FQDN
    (setq system-name (car (split-string system-name "\\."))))

  )


(provide 'init-platform-specific)
