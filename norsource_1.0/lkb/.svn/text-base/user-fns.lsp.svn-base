(in-package :lkb)

;;;
;;; identify characters that can form words; all other characters will create
;;; word boundaries and later be suppressed in tokenization.
;;;
;;; NOTE: obsoleted by FSPP tokeniser
(defun alphanumeric-or-extended-p (c)
  (and (graphic-char-p c) (not (member c *punctuation-characters*))))

;;;
;;; determine surface order of constituents in rule: returns list of paths into
;;; feature structure of rule, i.e. (nil (args first) (args rest first)) for a
;;; binary rule, where the first list element is the path to the mother node of
;;; the rule.
;;;
(defun establish-linear-precedence (rule)
  (let ((daughters
         (loop
             for args = (existing-dag-at-end-of rule '(args))
             then (existing-dag-at-end-of args *list-tail*)
             for daughter = (when args 
                              (get-value-at-end-of args *list-head*))
             for path = (list 'args) then (append path *list-tail*)
             while (and daughter (not (eq daughter 'no-way-through)))
             collect (append path *list-head*))))
    (if (null daughters)
      (cerror "Ignore it" "Rule without daughters")
      (cons nil daughters))))

;;;
;;; detect rules that have orthographemic variation associated to them; those
;;; who do should only be applied within the morphology system; for the time
;;; being use value of NEEDS-AFFIX feature, though it would be nicer to rely
;;; on a type distinction of lexical rules or re-entrancy of ORTH.
;;;
;(defun spelling-change-rule-p (rule)
;  (let ((affix (get-dag-value (tdfs-indef 
;                               (rule-full-fs rule)) 'needs-affix)))
;    (and affix (bool-value-true affix))))

;;;
;;; create feature structure representation of orthography value for insertion
;;; into the output structure of inflectional rules; somewhat more complicated
;;; than one might expect because of treatment for multi-word elements.
;;;
(defun make-orth-tdfs (orthography)
  (let* ((unifications
          (loop 
              for token in (split-into-words orthography)
              for path = *orth-path* then (append path *list-tail*)
              for opath = (create-path-from-feature-list 
                           (append path *list-head*))
              collect (make-unification :lhs opath                    
                                        :rhs (make-u-value :type token))))
         (indef (process-unifications unifications)))
    (when indef
      (make-tdfs :indef (create-wffs indef)))))

;bmw
;;;;
;;;; assign priorities to parser tasks and lexical entries
;;;;
;(defun rule-priority (rule)
;  (case (rule-id rule)
;    (subj 1000)))
;
;(defun gen-rule-priority (rule)
;  (rule-priority rule))
;
;(defun lex-priority (mrec)
;  (declare (ignore mrec))
;  800)
;
;(defun gen-lex-priority (fs)
;  (declare (ignore fs))
;  800)

;;;
;;; determine path and file names for lexicon and leaf type cache files.
;;;
(defun set-temporary-lexicon-filenames nil
  (let* ((version (or (find-symbol "*GRAMMAR-VERSION*" :common-lisp-user)
                      (and (find-package :lkb)
                           (find-symbol "*GRAMMAR-VERSION*" :lkb))))
         (prefix
          (if (and version (boundp version))
            (remove-if-not #'alphanumericp (symbol-value version))
            "biglex")))
    (setf *psorts-temp-file* 
      (make-pathname :name (concatenate 'string prefix ".lex")
                     :directory (pathname-directory (lkb-tmp-dir))))
    (setf *psorts-temp-index-file* 
      (make-pathname :name (concatenate 'string prefix ".idx") 
                     :directory (pathname-directory (lkb-tmp-dir))))
    (setf *leaf-temp-file* 
      (make-pathname :name (concatenate 'string prefix ".lts")
                     :directory (pathname-directory (lkb-tmp-dir))))
    (setf *predicates-temp-file* 
      (make-pathname :name (concatenate 'string prefix ".ric")
		     :host (pathname-host (lkb-tmp-dir))
		     :device (pathname-device (lkb-tmp-dir))
                     :directory (pathname-directory (lkb-tmp-dir))))
    (setf *semantics-temp-file* 
      (make-pathname :name (concatenate 'string prefix ".stc")
		     :host (pathname-host (lkb-tmp-dir))
		     :device (pathname-device (lkb-tmp-dir))
                     :directory (pathname-directory (lkb-tmp-dir))))))


(defun bool-value-true (fs)
  (and fs
       (let ((fs-type (type-of-fs fs)))
         (eql fs-type '+))))
  
(defun bool-value-false (fs)
  (and fs
       (let ((fs-type (type-of-fs fs)))
         (eql fs-type '-))))

;;;
;;; the following temporary expedient attempts to get capitalization more right
;;; than we used to do in generator outputs.  still, for acronyms like `IBM' or
;;; complex names including lower case elements, i see no alternative to using
;;; STEM to spell out the actual (canonical) surface form.  that would seem to
;;; require that we re-view assumptions about capitalization across the lexicon
;;; et al.  but the LKB should probably do that one day!        (30-aug-05; oe)
;;;
(defun gen-extract-surface (edge &optional (initialp t) &key stream)
  (if stream
    (let ((daughters (edge-children edge)))
      (if daughters
        (loop
            for daughter in daughters
            for foo = initialp then nil
            append (gen-extract-surface daughter foo :stream stream))
        (let* ((entry (get-lex-entry-from-id (first (edge-lex-ids edge))))
               (tdfs (and entry (lex-entry-full-fs entry)))
               (type (and tdfs (type-of-fs (tdfs-indef tdfs))))
               (string (string-downcase (copy-seq (first (edge-leaves edge)))))
               (capitalizep
                (ignore-errors
                 (loop
                     for match in '(basic_n_proper_lexent
                                    n_month_year_le
                                    n_day_of_week_le
                                    n_pers_pro_i_le)
                     thereis (or (eq type match)
                                 (subtype-p type match)))))
               (cliticp (and (> (length string) 0)
                             (char= (char string 0) #\'))))
          (when capitalizep
            (loop
                with spacep = t
                for i from 0 to (- (length string) 1)
                for c = (schar string i)
                when (char= c #\Space) do (setf spacep t)
                else when (char= c #\_)
                do
                  (setf spacep t)
                  (setf (schar string i) #\Space)
                else do
                  (when (and spacep (alphanumericp c))
                    (setf (schar string i) (char-upcase c)))
                  (setf spacep nil)))
          (when (and initialp (alphanumericp (schar string 0)))
            (setf (schar string 0) (char-upcase (schar string 0))))
          (format
           stream
           "~@[ ~*~]~a"
           (and (not initialp) (not cliticp)) string))))
    (let ((stream (make-string-output-stream)))
      (gen-extract-surface edge initialp :stream stream)
      (get-output-stream-string stream))))


(eval-when #+:ansi-eval-when (:load-toplevel :compile-toplevel :execute)
	   #-:ansi-eval-when (load eval compile)
  (setf *gen-extract-surface-hook* 'gen-extract-surface))
