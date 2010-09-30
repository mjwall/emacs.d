;; project-root

(add-to-list 'load-path (concat dotfiles-dir "vendor/project-root"))

(require 'project-root)

(setq project-roots
       `(("Generic Maven Project"
          :root-contains-files ("pom.xml" "src")
          :filename-regex ,(regexify-ext-list '(java jsp html js css htm))
          ;;:on-hit (lambda (p) (message (car p)))
          ;;:exclude-paths ("target")
          )
         ("Grails Project"
          :root-contains-files ("grails-app")
          :filename-regex ,(regexify-ext-list '(groovy gsp java html css js))
          ;;:exclude-paths ("target")
          )
         ("Clojure Lein Project"
          :root-contains-files ("project.clj")
          :filename-regex ,(regexify-ext-list '(clj html css js))
          ;;:exclude-paths ("classes")
          )
         ("Emacs.d config"
          :root-contains-files ("init.el" "vendor")
          :filename-regex ,(regexify-ext-list '(el txt README ))
          ;;:exclude-paths ("auto-save-list" "semanticdb" "backups")
          )))

;; keybindings
(global-set-key (kbd "C-c p f") 'project-root-find-file)
(global-set-key (kbd "C-c p g") 'project-root-grep)
(global-set-key (kbd "C-c p a") 'project-root-ack)
(global-set-key (kbd "C-c p d") 'project-root-goto-root)
(global-set-key (kbd "C-c p p") 'project-root-run-default-command)
(global-set-key (kbd "C-c p l") 'project-root-browse-seen-projects)
(global-set-key (kbd "C-c p M-x") 'project-root-execute-extended-command)
