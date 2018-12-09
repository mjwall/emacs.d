;;; lsp-ruby.el --- Ruby support for lsp-mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2018 George Pittarelli <g@gjp.cc>

;; Author: George Pittarelli <g@gjp.cc>
;; Version: 1.0
;; Package-Version: 20180910.1921
;; Package-Requires: ((lsp-mode "3.0") (emacs "25.1"))
;; Keywords: languages tools
;; URL: https://github.com/emacs-lsp/lsp-ruby

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

;; Ruby support for lsp-mode using either the solargraph or the
;; language_server gem

;;; Code:

(require 'lsp-mode)
(require 'ruby-mode)

(defconst lsp-ruby--get-root
  (lsp-make-traverser
   #'(lambda (dir)
       (directory-files dir nil "\\(Rakefile\\|Gemfile\\)"))))

(defun lsp-ruby--render-string (str)
  "Render STR with `ruby-mode' syntax highlighting."
  (ignore-errors
    (with-temp-buffer
      (ruby-mode)
      (insert str)
      (font-lock-ensure)
      (buffer-string))))

(defun lsp-ruby--initialize-client (client)
  "Initial setup for ruby LSP CLIENT."
  (lsp-provide-marked-string-renderer
   client "ruby" 'lsp-ruby--render-string))

(lsp-define-stdio-client
 lsp-ruby "ruby"
 lsp-ruby--get-root
 '("solargraph" "stdio")
 :initialize 'lsp-ruby--initialize-client)

(lsp-define-tcp-client
 lsp-ruby-solargraph-tcp "ruby"
 lsp-ruby--get-root
 '("solargraph" "socket")
 "127.0.0.1"
 7658
 :initialize 'lsp-ruby--initialize-client)

(lsp-define-stdio-client
 lsp-ruby-mtsmfm "ruby"
 lsp-ruby--get-root
 '("language_server-ruby" "--experimental-features")
 :initialize 'lsp-ruby--initialize-client)

(provide 'lsp-ruby)
;;; lsp-ruby.el ends here
