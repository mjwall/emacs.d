(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(defvar coding-hook nil
  "Hook that gets run on activation of any programming mode.")

(provide 'init-util)
