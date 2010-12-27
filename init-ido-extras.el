(require 'ido-hacks)

;;----------------------------------------------------------------------------
;; ido completion in M-x
;;----------------------------------------------------------------------------
(require 'smex)
(smex-initialize)
(global-set-key "\M-x" 'smex)

(provide 'init-ido-extras)
