;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; used in init-themes
(defmacro preserving-default-font-size (&rest body))


(provide 'init-font)
