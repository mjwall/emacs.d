(require 'ack)
(require 'project-root)

(setq project-roots
      `(
        ("Maven project"
          :root-contains-files ("pom.xml")
          ;;:filename-regex ,(regexify-ext-list '(java html groovy jsp js css xml))
;;          :on-hit (lambda (p) (message (car p)))
          ;;:exclude-paths ("target")
          )
         ("Clojure project"
          :root-contains-files ("project.clj")
          ;;:filename-regex ,(regexify-ext-list '(clj jsp css js xml html))
          ;;:exclude-paths ("lib" "classes")
          )
         ("Grails project"
          :root-contains-files ("grails-app")
          ;;:filename-regex ,(regexify-ext-list '(groovy gsp java html jsp css js xml))
          ;;:exclude-paths ("target")
          )
         (".emacs "
          :root-contains-files ("init.el")
          ;;:filename-regex ,(regexify-ext-list '(el org README txt))
          ;;:exclude-paths ("backups" "autosave-list" "semanticdb")
          )
         )
)


(global-set-key (kbd "C-c p f") 'project-root-find-file)
(global-set-key (kbd "C-c p g") 'project-root-grep)
(global-set-key (kbd "C-c p a") 'project-root-ack)
(global-set-key (kbd "C-c p d") 'project-root-goto-root)
(global-set-key (kbd "C-c p p") 'project-root-run-default-command)
(global-set-key (kbd "C-c p l") 'project-root-browse-seen-projects)
