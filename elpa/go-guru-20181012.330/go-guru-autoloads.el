;;; go-guru-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "go-guru" "go-guru.el" (0 0 0 0))
;;; Generated autoloads from go-guru.el

(autoload 'go-guru-set-scope "go-guru" "\
Set the scope for the Go guru, prompting the user to edit the previous scope.\n\nThe scope restricts analysis to the specified packages.\nIts value is a comma-separated list of patterns of these forms:\n	golang.org/x/tools/cmd/guru     # a single package\n	golang.org/x/tools/...          # all packages beneath dir\n	...                             # the entire workspace.\n\nA pattern preceded by '-' is negative, so the scope\n	encoding/...,-encoding/xml\nmatches all encoding packages except encoding/xml.\n\n(fn)" t nil)

(autoload 'go-guru-callees "go-guru" "\
Show possible callees of the function call at the current point.\n\n(fn)" t nil)

(autoload 'go-guru-callers "go-guru" "\
Show the set of callers of the function containing the current point.\n\n(fn)" t nil)

(autoload 'go-guru-callstack "go-guru" "\
Show an arbitrary path from a root of the call graph to the\nfunction containing the current point.\n\n(fn)" t nil)

(autoload 'go-guru-definition "go-guru" "\
Jump to the definition of the selected identifier.\n\n(fn &optional OTHER-WINDOW)" t nil)

(autoload 'go-guru-definition-other-window "go-guru" "\
Jump to the defintion of the selected identifier in another window\n\n(fn)" t nil)

(autoload 'go-guru-describe "go-guru" "\
Describe the selected syntax, its kind, type and methods.\n\n(fn)" t nil)

(autoload 'go-guru-pointsto "go-guru" "\
Show what the selected expression points to.\n\n(fn)" t nil)

(autoload 'go-guru-implements "go-guru" "\
Describe the 'implements' relation for types in the package\ncontaining the current point.\n\n(fn)" t nil)

(autoload 'go-guru-freevars "go-guru" "\
Enumerate the free variables of the current selection.\n\n(fn)" t nil)

(autoload 'go-guru-peers "go-guru" "\
Enumerate the set of possible corresponding sends/receives for\nthis channel receive/send operation.\n\n(fn)" t nil)

(autoload 'go-guru-referrers "go-guru" "\
Enumerate all references to the object denoted by the selected\nidentifier.\n\n(fn)" t nil)

(autoload 'go-guru-whicherrs "go-guru" "\
Show globals, constants and types to which the selected\nexpression (of type 'error') may refer.\n\n(fn)" t nil)

(autoload 'go-guru-unhighlight-identifiers "go-guru" "\
Remove highlights from previously highlighted identifier.\n\n(fn)" nil nil)

(autoload 'go-guru-hl-identifier "go-guru" "\
Highlight all instances of the identifier under point. Removes\nhighlights from previously highlighted identifier.\n\n(fn)" t nil)

(autoload 'go-guru-hl-identifier-mode "go-guru" "\
Highlight instances of the identifier at point after a short\ntimeout.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "go-guru" '("go-guru-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; go-guru-autoloads.el ends here
