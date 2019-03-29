;;; groovy-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "groovy-electric" "groovy-electric.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from groovy-electric.el

(autoload 'groovy-electric-mode "groovy-electric" "\
Toggle Groovy Electric minor mode.\nWith no argument, this command toggles the mode.  Non-null prefix\nargument turns on the mode.  Null prefix argument turns off the\nmode.\n\nWhen Groovy Electric mode is enabled, simple, double and back\nquotes as well as braces are paired auto-magically. Expansion\ndoes not occur inside comments and strings. Note that you must\nhave Font Lock enabled. ${ } is expanded when in a GString\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "groovy-electric" '("groovy-electric-")))

;;;***

;;;### (autoloads nil "groovy-mode" "groovy-mode.el" (0 0 0 0))
;;; Generated autoloads from groovy-mode.el

(add-to-list 'auto-mode-alist '("\\.g\\(?:ant\\|roovy\\|radle\\)\\'" . groovy-mode))

(add-to-list 'auto-mode-alist '("Jenkinsfile" . groovy-mode))

(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(autoload 'groovy-mode "groovy-mode" "\
Major mode for editing Groovy code.\n\nThe hook `groovy-mode-hook' is run with no args at mode\ninitialization.\n\nKey bindings:\n\\{groovy-mode-map}\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "groovy-mode" '("groovy-")))

;;;***

;;;### (autoloads nil "inf-groovy" "inf-groovy.el" (0 0 0 0))
;;; Generated autoloads from inf-groovy.el

(autoload 'inf-groovy-keys "inf-groovy" "\
Set local key defs for inf-groovy in groovy-mode\n\n(fn)" nil nil)

(autoload 'inferior-groovy-mode "inf-groovy" "\
Major mode for interacting with an inferior groovy (groovysh) process.\n\nThe following commands are available:\n\\{inferior-groovy-mode-map}\n\nA groovy process can be fired up with M-x run-groovy.\n\nCustomisation: Entry to this mode runs the hooks on comint-mode-hook and\ninferior-groovy-mode-hook (in that order).\n\nYou can send text to the inferior groovy process from other buffers containing\nGroovy source.\n    switch-to-groovy switches the current buffer to the groovy process buffer.\n    groovy-send-definition sends the current definition to the groovy process.\n    groovy-send-region sends the current region to the groovy process.\n\n    groovy-send-definition-and-go, groovy-send-region-and-go,\n        switch to the groovy process buffer after sending their text.\nFor information on running multiple processes in multiple buffers, see\ndocumentation for variable groovy-buffer.\n\nCommands:\nReturn after the end of the process' output sends the text from the\n    end of process to point.\nReturn before the end of the process' output copies the sexp ending at point\n    to the end of the process' output, and sends it.\nDelete converts tabs to spaces as it moves back.\nTab indents for groovy; with argument, shifts rest\n    of expression rigidly with the current line.\nC-M-q does Tab on each line starting within following expression.\nParagraphs are separated only by blank lines.  # start comments.\nIf you accidentally suspend your process, use \\[comint-continue-subjob]\nto continue it.\n\n(fn)" t nil)

(autoload 'run-groovy "inf-groovy" "\
Run an inferior Groovy process, input and output via buffer *groovy*.\nIf there is a process already running in *groovy*, switch to that buffer.\nWith a prefix argument, prompt for the groovysh path and arguments\n(see variables `groovysh' and `groovysh-args' for the defaults).\n\nRuns the hook `inferior-groovy-mode-hook' (after the\n`comint-mode-hook' is run).  Type \\[describe-mode] in the\nprocess buffer for a list of commands.\n\n(fn CMD)" t nil)

(eval-after-load 'groovy-mode (lambda nil (add-hook 'groovy-mode-hook 'inf-groovy-keys)))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "inf-groovy" '("inf" "groovy" "switch-to-groovy" "remove-in-string")))

;;;***

;;;### (autoloads nil nil ("groovy-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; groovy-mode-autoloads.el ends here
