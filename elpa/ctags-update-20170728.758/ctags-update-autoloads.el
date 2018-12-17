;;; ctags-update-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ctags-update" "ctags-update.el" (0 0 0 0))
;;; Generated autoloads from ctags-update.el

(autoload 'ctags-update "ctags-update" "\
ctags-update in parent directory using `exuberant-ctags'.\n1. you can call this function directly,\n2. enable `ctags-auto-update-mode',\n3. with prefix `C-u' then you can generate a new TAGS file in selected directory,\n4. with prefix `C-uC-u' save the command to kill-ring instead of execute it.\n\n(fn &optional ARGS)" t nil)

(autoload 'ctags-auto-update-mode "ctags-update" "\
auto update TAGS using `exuberant-ctags' in parent directory.\n\n(fn &optional ARG)" t nil)

(autoload 'turn-on-ctags-auto-update-mode "ctags-update" "\
turn on `ctags-auto-update-mode'.\n\n(fn)" t nil)

(defvar ctags-global-auto-update-mode nil "\
Non-nil if Ctags-Global-Auto-Update mode is enabled.\nSee the `ctags-global-auto-update-mode' command\nfor a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `ctags-global-auto-update-mode'.")

(custom-autoload 'ctags-global-auto-update-mode "ctags-update" nil)

(autoload 'ctags-global-auto-update-mode "ctags-update" "\
Toggle Ctags-Auto-Update mode in all buffers.\nWith prefix ARG, enable Ctags-Global-Auto-Update mode if ARG is positive;\notherwise, disable it.  If called from Lisp, enable the mode if\nARG is omitted or nil.\n\nCtags-Auto-Update mode is enabled in all buffers where\n`turn-on-ctags-auto-update-mode' would do it.\nSee `ctags-auto-update-mode' for more information on Ctags-Auto-Update mode.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ctags-update" '("ctags-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ctags-update-autoloads.el ends here
