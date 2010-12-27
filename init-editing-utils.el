;;----------------------------------------------------------------------------
;; Autopair quotes and parentheses
;;----------------------------------------------------------------------------
(require 'autopair)
(setq autopair-autowrap t)


;;----------------------------------------------------------------------------
;; Supercharge undo/redo
;;----------------------------------------------------------------------------
(require 'undo-tree)
(global-undo-tree-mode)

(require 'diminish)
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))

(provide 'init-editing-utils)
