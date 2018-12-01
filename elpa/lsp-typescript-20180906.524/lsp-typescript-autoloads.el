;;; lsp-typescript-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "lsp-typescript" "lsp-typescript.el" (23554
;;;;;;  62821 0 0))
;;; Generated autoloads from lsp-typescript.el

(defvar lsp-typescript-server "typescript-language-server" "\
The typescript-language-server executable to use.
Leave as just the executable name to use the default behavior of
finding the executable with `exec-path'.")

(custom-autoload 'lsp-typescript-server "lsp-typescript" t)

(defvar lsp-typescript-server-args 'nil "\
Extra arguments for the typescript-language-server language server")

(custom-autoload 'lsp-typescript-server-args "lsp-typescript" t)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; lsp-typescript-autoloads.el ends here
