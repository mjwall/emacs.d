(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (menu-bar-mode 1))


;; make starting size larger, very specific for my mbp and font
;(set-frame-height (selected-frame) 80)
;(set-frame-width (selected-frame) 119)
;(set-frame-position (selected-frame) 0 0)

;; no fringe, wasted space
;;(set-fringe-mode 0) ;; interferes with ansi-term
;;(set-fringe-mode '(0 . 1))
;;(set-fringe-mode (quote (0 . 2)))

(provide 'init-window)
