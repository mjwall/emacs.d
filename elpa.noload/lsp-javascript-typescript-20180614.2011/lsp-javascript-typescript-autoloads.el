;;; lsp-javascript-typescript-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "lsp-javascript-typescript" "lsp-javascript-typescript.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from lsp-javascript-typescript.el

(defvar lsp-javascript-typescript-server "javascript-typescript-stdio" "\
The javascript-typescript-stdio executable to use.
Leave as just the executable name to use the default behavior of
finding the executable with `exec-path'.")

(custom-autoload 'lsp-javascript-typescript-server "lsp-javascript-typescript" t)

(defvar lsp-javascript-typescript-server-args 'nil "\
Extra arguments for the javascript-typescript-stdio language server")

(custom-autoload 'lsp-javascript-typescript-server-args "lsp-javascript-typescript" t)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lsp-javascript-typescript" '("lsp-javascript-typescript--")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lsp-javascript-typescript-autoloads.el ends here
