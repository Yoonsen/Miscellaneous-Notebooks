(in-package :lkb)
(delete :lui *features*)
(push :genserver *features*)

(defun show-gen-result ()
  (if #+:lui (lui-status-p :realization) #-:lui nil
    (lui-show-gen-result)
    #+:genserver
    (let ((strings (loop for edge in *gen-record*
		       collect (edge-string edge))))
      (with-open-file (stream (merge-pathnames
			       (lkb::lkb-tmp-dir)
			       (format
				nil
				".generate.~a.~(~a~)"
				(lkb::current-user) (first *translate-grid*)))
		       :direction :output :if-exists :supersede)
	(loop for string in strings
	      do (format stream "~%~A" string))
	(force-output)))
    #-:genserver
     (if *gen-record*
        (draw-active-list
           (sort
              (mapcar
                 #'(lambda (edge)
                     (cons (if (stringp (edge-string edge))
                             (edge-string edge)
                             (format
                              nil
                              "~{~A~^ ~}" 
                              (fix-spelling (g-edge-leaves edge))))
                        edge))
                 *gen-record*)
              #'string-lessp :key #'car)
           "Generated Sentences"
           (list
              (cons "Feature structure"
                 #'(lambda (edge)
                     (display-fs (g-edge-dag edge)
                        (format nil "Edge ~A G - Tree FS" (g-edge-id edge)))))
              (cons "Tree"
                 #'(lambda (edge)
                     (display-parse-tree edge nil)))
              (cons "MRS"
                  #'(lambda (edge)
                      (show-mrs-window edge)))))
        (show-message-window "No strings generated"))))
