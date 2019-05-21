;;; auto-complete-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "auto-complete" "auto-complete.el" (0 0 0 0))
;;; Generated autoloads from auto-complete.el

(autoload 'auto-complete "auto-complete" "\
Start auto-completion at current point.\n\n(fn &optional SOURCES)" t nil)

(autoload 'auto-complete-mode "auto-complete" "\
AutoComplete mode\n\n(fn &optional ARG)" t nil)

(defvar global-auto-complete-mode nil "\
Non-nil if Global Auto-Complete mode is enabled.\nSee the `global-auto-complete-mode' command\nfor a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `global-auto-complete-mode'.")

(custom-autoload 'global-auto-complete-mode "auto-complete" nil)

(autoload 'global-auto-complete-mode "auto-complete" "\
Toggle Auto-Complete mode in all buffers.\nWith prefix ARG, enable Global Auto-Complete mode if ARG is positive;\notherwise, disable it.  If called from Lisp, enable the mode if\nARG is omitted or nil.\n\nAuto-Complete mode is enabled in all buffers where\n`auto-complete-mode-maybe' would do it.\nSee `auto-complete-mode' for more information on Auto-Complete mode.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "auto-complete" '("auto-complete-mode" "ac-")))

;;;***

;;;### (autoloads nil "auto-complete-config" "auto-complete-config.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from auto-complete-config.el

(autoload 'ac-config-default "auto-complete-config" "\
\n\n(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "auto-complete-config" '("ac-")))

;;;***

;;;### (autoloads nil nil ("auto-complete-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; auto-complete-autoloads.el ends here
