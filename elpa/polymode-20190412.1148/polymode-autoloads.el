;;; polymode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "poly-lock" "poly-lock.el" (0 0 0 0))
;;; Generated autoloads from poly-lock.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "poly-lock" '("poly-lock-")))

;;;***

;;;### (autoloads nil "polymode" "polymode.el" (0 0 0 0))
;;; Generated autoloads from polymode.el

(autoload 'define-polymode "polymode" "\
Define a new polymode MODE.\nThis macro defines command MODE and an indicator variable MODE\nwhich becomes t when MODE is active and nil otherwise.\n\nMODE command can be used as both major and minor mode. Using\npolymodes as minor modes makes sense when :hostmode (see below)\nis not specified, in which case polymode installs only inner\nmodes and doesn't touch current major mode.\n\nStandard hook MODE-hook is run at the end of the initialization\nof each polymode buffer (both indirect and base buffers).\n\nThis macro also defines the MODE-map keymap from the :keymap\nargument and PARENT-map (see below) and poly-[MODE-NAME]-polymode\nvariable which holds an object of class `pm-polymode' which holds\nthe entire configuration for this polymode.\n\nPARENT is either the polymode configuration object or a polymode\nmode (there is 1-to-1 correspondence between config\nobjects (`pm-polymode') and mode functions). The new polymode\nMODE inherits alll the behavior from PARENT except for the\noverwrites specified by the keywords (see below). The new MODE\nruns all the hooks from the PARENT-mode and inherits its MODE-map\nfrom PARENT-map.\n\nDOC is an optional documentation string. If present PARENT must\nbe provided, but can be nil.\n\nBODY is executed after the complete initialization of the\npolymode but before MODE-hook. It is executed once for each\npolymode buffer - host buffer on initialization and every inner\nbuffer subsequently created.\n\nBefore the BODY code keyword arguments (i.e. alternating keywords\nand values) are allowed. The following special keywords\ncontrolling the behavior of the new MODE are supported:\n\n:lighter Optional LIGHTER is displayed in the mode line when the\n   mode is on. If omitted, it defaults to the :lighter slot of\n   CONFIG object.\n\n:keymap If nil, a new MODE-map keymap is created what directly\n  inherits from the PARENT's keymap. The last keymap in the\n  inheritance chain is always `polymode-minor-mode-map'. If a\n  keymap it is used directly as it is. If a list of binding of\n  the form (KEY . BINDING) it is merged the bindings are added to\n  the newly create keymap.\n\n:after-hook A single form which is evaluated after the mode hooks\n  have been run. It should not be quoted.\n\nOther keywords are added to the `pm-polymode' configuration\nobject and should be valid slots in PARENT config object or the\nroot config `pm-polymode' object if PARENT is nil. By far the\nmost frequently used slots are:\n\n:hostmode Symbol pointing to a `pm-host-chunkmode' object\n  specifying the behavior of the hostmode. If missing or nil,\n  MODE will behave as a minor-mode in the sense that it will\n  reuse the currently installed major mode and will install only\n  the inner modes.\n\n:innermodes List of symbols pointing to `pm-inner-chunkmode'\n  objects which specify the behavior of inner modes (or submodes).\n\n(fn MODE &optional PARENT DOC &rest BODY)" nil t)

(function-put 'define-polymode 'doc-string-elt '3)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode" '("pm-" "poly")))

;;;***

;;;### (autoloads nil "polymode-base" "polymode-base.el" (0 0 0 0))
;;; Generated autoloads from polymode-base.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode-base" '("poly-")))

;;;***

;;;### (autoloads nil "polymode-classes" "polymode-classes.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from polymode-classes.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode-classes" '("pm-")))

;;;***

;;;### (autoloads nil "polymode-compat" "polymode-compat.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from polymode-compat.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode-compat" '("pm-" "polymode-" "*span*")))

;;;***

;;;### (autoloads nil "polymode-core" "polymode-core.el" (0 0 0 0))
;;; Generated autoloads from polymode-core.el

(defvar-local polymode-default-inner-mode nil "\
Inner mode for chunks with unspecified modes.\nIntended to be used as local variable in polymode buffers. A\nspecial value 'host means use the host mode.")

(put 'polymode-default-inner-mode 'safe-local-variable 'symbolp)

(autoload 'define-hostmode "polymode-core" "\
Define a hostmode with name NAME.\nOptional PARENT is a name of a hostmode to be derived (cloned)\nfrom. If missing, the optional documentation string DOC is\ngenerated automatically. KEY-ARGS is a list of key-value pairs.\nSee the documentation of the class `pm-host-chunkmode' for\npossible values.\n\n(fn NAME &optional PARENT DOC &rest KEY-ARGS)" nil t)

(function-put 'define-hostmode 'doc-string-elt '3)

(autoload 'define-innermode "polymode-core" "\
Ddefine an innermode with name NAME.\nOptional PARENT is a name of a innermode to be derived (cloned)\nfrom. If missing the optional documentation string DOC is\ngenerated automatically. KEY-ARGS is a list of key-value pairs.\nSee the documentation of the class `pm-inner-chunkmode' for\npossible values.\n\n(fn NAME &optional PARENT DOC &rest KEY-ARGS)" nil t)

(function-put 'define-innermode 'doc-string-elt '3)

(autoload 'define-auto-innermode "polymode-core" "\
Ddefine an auto innermode with name NAME.\nOptional PARENT is a name of an auto innermode to be\nderived (cloned) from. If missing the optional documentation\nstring DOC is generated automatically. KEY-ARGS is a list of\nkey-value pairs. See the documentation of the class\n`pm-inner-auto-chunkmode' for possible values.\n\n(fn NAME &optional PARENT DOC &rest KEY-ARGS)" nil t)

(function-put 'define-auto-innermode 'doc-string-elt '3)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode-core" '("polymode-" "*span*")))

;;;***

;;;### (autoloads nil "polymode-debug" "polymode-debug.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from polymode-debug.el

(autoload 'pm-debug-minor-mode "polymode-debug" "\
Turns on/off useful facilities for debugging polymode.\n\nKey bindings:\n\\{pm-debug-minor-mode-map}\n\n(fn &optional ARG)" t nil)

(autoload 'pm-debug-minor-mode-on "polymode-debug" "\
\n\n(fn)" nil nil)

(defvar pm-debug-mode nil "\
Non-nil if Pm-Debug mode is enabled.\nSee the `pm-debug-mode' command\nfor a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `pm-debug-mode'.")

(custom-autoload 'pm-debug-mode "polymode-debug" nil)

(autoload 'pm-debug-mode "polymode-debug" "\
Toggle Pm-Debug minor mode in all buffers.\nWith prefix ARG, enable Pm-Debug mode if ARG is positive;\notherwise, disable it.  If called from Lisp, enable the mode if\nARG is omitted or nil.\n\nPm-Debug minor mode is enabled in all buffers where\n`pm-debug-minor-mode-on' would do it.\nSee `pm-debug-minor-mode' for more information on Pm-Debug minor mode.\n\n(fn &optional ARG)" t nil)

(autoload 'pm-toggle-tracing "polymode-debug" "\
Toggle polymode tracing.\nWith numeric prefix toggle tracing for that LEVEL. Currently\nuniversal argument toggles maximum level of tracing (4). Default\nlevel is 3.\n\n(fn LEVEL)" t nil)

(autoload 'pm-trace "polymode-debug" "\
Trace function FN.\nUse `untrace-function' to untrace or `untrace-all' to untrace all\ncurrently traced functions.\n\n(fn FN)" t nil)

(autoload 'pm-debug-print-relevant-variables "polymode-debug" "\
Print values of relevant hooks and other variables.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode-debug" '("pm-")))

;;;***

;;;### (autoloads nil "polymode-export" "polymode-export.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from polymode-export.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode-export" '("pm-" "poly")))

;;;***

;;;### (autoloads nil "polymode-methods" "polymode-methods.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from polymode-methods.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode-methods" '("pm-")))

;;;***

;;;### (autoloads nil "polymode-test-utils" "polymode-test-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode-test-utils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode-test-utils" '("pm-")))

;;;***

;;;### (autoloads nil "polymode-weave" "polymode-weave.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from polymode-weave.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode-weave" '("pm-" "polymode-")))

;;;***

;;;### (autoloads nil nil ("polymode-pkg.el" "polymode-tangle.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; polymode-autoloads.el ends here
