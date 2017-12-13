;;; Code:
(require 'ob)
(require 's)



(defun org-babel-execute:neo4j (body params)
  "Execute the provided cypher"

  (let*
      ((host     (or (cdr (assoc :host params)) "127.0.0.1"))
      (username (cdr (assoc :username params)))
      (password (cdr (assoc :password params)))
      (cypher-params `((:host . ,host)
                       (:password . ,password)
                       (:username . ,username))))
      
    (message (prin1-to-string cypher-params))
      (s-format "cypher ${:host}" 'aget cypher-params)
  ))

(defun org-babel-prep-session:neo4j (_session _params)
  "Return an error if the :session header argument is set.
   Neo4j does not support sessions."
  (error "Neo4j sessions are nonsensical"))


(provide 'ob-neo4j)
