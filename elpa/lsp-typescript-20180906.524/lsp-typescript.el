;;; lsp-typescript.el --- Javascript/Typescript support for lsp-mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2017 George Pittarelli <g@gjp.cc>

;; Author: George Pittarelli <g@gjp.cc>
;; Version: 1.0
;; Package-Version: 20180906.524
;; Package-Requires: ((lsp-mode "3.0") (typescript-mode "0.1") (emacs "25.1"))
;; Keywords: languages tools
;; URL: https://github.com/emacs-lsp/lsp-javascript

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Javascript and Typescript support for lsp-mode using Theia's
;; typescript-language-server server.

;;; Code:

(require 'lsp-mode)
(require 'typescript-mode)

;;;###autoload
(defcustom lsp-typescript-server
  "typescript-language-server"
  "The typescript-language-server executable to use.
Leave as just the executable name to use the default behavior of
finding the executable with `exec-path'."
  :group 'lsp-typescript
  :risky t
  :type 'file)

;;;###autoload
(defcustom lsp-typescript-server-args
  '()
  "Extra arguments for the typescript-language-server language server"
  :group 'lsp-typescript
  :risky t
  :type '(repeat string))

(defconst lsp-typescript--get-root
  (lsp-make-traverser #'(lambda (dir)
                          (directory-files dir nil "package.json"))))

(defun lsp-typescript--ls-command ()
  "Generate the language server startup command."
  `(,lsp-typescript-server
    "--stdio"
    ,@lsp-typescript-server-args))

(defun lsp-typescript--render-string (str)
  (condition-case nil
      (with-temp-buffer
	      (delay-mode-hooks (typescript-mode))
	      (insert str)
	      (font-lock-ensure)
	      (buffer-string))
    (error str)))

(defun lsp-typescript--initialize-client (client)
  (lsp-provide-marked-string-renderer
   client "typescript" 'lsp-typescript--render-string)
  (lsp-provide-marked-string-renderer
   client "javascript" 'lsp-typescript--render-string))

(defun lsp-typescript--language-id (buffer)
  (if (equal "ts" (file-name-extension (buffer-file-name buffer)))
      "typescript" "javascript"))

(lsp-define-stdio-client
 lsp-typescript "javascript"
 lsp-typescript--get-root
 nil
 :language-id-fn 'lsp-typescript--language-id
 :initialize 'lsp-typescript--initialize-client
 :command-fn 'lsp-typescript--ls-command)

(provide 'lsp-typescript)
;;; lsp-typescript.el ends here
