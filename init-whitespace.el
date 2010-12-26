;; whitespace mode, turned on by run-coding-hook
(setq whitespace-style '(trailing space-before-tab indentation
                             space-after-tab tabs tab-mark)
      c-basic-indent 2
      tab-width 4
      indent-tabs-mode nil)
;(setq whitespace-style '(trailing space-before-tab indentation
;                             space-after-tab tabs newline tab-mark newline-mark)
;      c-basic-indent 2
;      tab-width 4
;      indent-tabs-mode nil)

;;allow one space at the end, mostly for ruby-electric.el
;(setq whitespace-trailing-regexp
;      "\\(\\(\t\\| \\|\xA0\\|\x8A0\\|\x920\\|\xE20\\|\xF20\\)\\{2,\\}\\)$")

(provide 'init-whitespace)
