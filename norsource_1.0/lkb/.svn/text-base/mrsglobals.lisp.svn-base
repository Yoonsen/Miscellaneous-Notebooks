(in-package "MRS")

(defparameter *initial-semantics-path* 
  `(,(vsym "SYNSEM") ,(vsym "LOCAL") ,(vsym "CONT"))
  "Following this path into a sign gets you to the MRS structure")

(defparameter *main-semantics-path* 
  `(,(vsym "SYNSEM") ,(vsym "LOCAL") ,(vsym "CONT") 
    ,(vsym "RELS") ,(vsym "LIST")))

(defparameter *psoa-liszt-path* (list (vsym "RELS") (vsym "LIST"))
  "path to get a liszt from a psoa")

(defparameter *psoa-top-h-path*  `(,(vsym "HOOK") ,(vsym "GTOP"))
  "path to get the top handle from a psoa")

;;; bruland, 2013 qeq between top handle and main verb
;;;(setf *top-hcons* "qeq")

(defparameter *psoa-index-path* 
  `(,(vsym "HOOK") ,(vsym "INDEX"))
  "path to get an index from a psoa")

(defparameter *psoa-event-path* `(,(vsym "HOOK") ,(vsym "INDEX")))
(defparameter *psoa-rh-cons-path* `(,(vsym "HCONS") ,(vsym "LIST")))

(defparameter *rel-handel-path*
    `(,(vsym "LBL"))
  "path to get the handel from a relation")

(defparameter *sc-arg-feature* (vsym "HARG")
  "the feature in a qeq that leads to the first argument")

(defparameter *outscpd-feature* (vsym "LARG")
  "the feature in a qeq that leads to the second argument")

(defparameter *bv-feature* (vsym "ARG0"))

(defparameter *scope-feat* (vsym "BODY"))

(defparameter *ignored-sem-features* (list (vsym "WLINK") (vsym "CFROM") (vsym "CTO"))
  "A list of features which are ignored completely")

(setf *ignored-extra-features* 
  (append
   *ignored-extra-features*
   (list (vsym "INSTLOC"))))

;; bruland, this part does not exist in ERG
(defparameter *main-semantics-path* 
  (append *initial-semantics-path* (list (vsym "RELS") (vsym "LIST")))
  "the path into a lexical entry which gives the list of
   relations - typically (append *initial-semantics-path* '(RELS LIST))")


(defparameter *construction-semantics-path* 
  (list (vsym "C-CONT") (vsym "RELS") (vsym "LIST"))
  "the path into a rule/construction which gives the
   semantics specific to that construction")

(defparameter *top-semantics-type* (vsym "RELATION")
  "the highest type in the hierarchy under which all
   rels are found")

(defparameter *value-feats* 
  (list
   (vsym "CARG")))

(defparameter lkb::*semantics-index-path* 
  (append *initial-semantics-path* (list (vsym "HOOK") (vsym "INDEX"))))
  
;;;
;;; types for variable naming in mrsoutput (copy from `src/mrs/mrsglobals.lsp'
;;; but here to remind us to adapt them, as appropriate).
;;;

(defparameter *event-type* (vsym "event"))
(defparameter *event_or_index-type* (vsym "event_or_index"))
(defparameter *non_expl-ind-type* (vsym "non_expl-ind"))
(defparameter *eventtime-type* (vsym "eventtime"))
(defparameter *handle-type* (vsym "handle"))
(defparameter *group_lab-type* (vsym "group_lab"))
(defparameter *hole-type* (vsym "hole"))
(defparameter *label-type* (vsym "label"))
(defparameter *ref-ind-type* (vsym "ref-ind"))
(defparameter *full_ref-ind-type* (vsym "full_ref-ind"))
(defparameter *deg-ind-type* (vsym "deg-ind"))
(defparameter *individual-type* (vsym "individual"))
(defparameter *difference-list-type* (vsym "*diff-list*"))
(defparameter *conj-ind-type* (vsym "conj-ind"))


;; Bruland, slik som ERG
;;(setf *variable-type-mapping* :semi)

;;;
;;; context condition in MRS munging rules
;;; 

(defparameter *mrs-rule-condition-path* (list (vsym "CONDITION")))



(defun determine-variable-type (fs)
  (let ((type (create-type (fs-type fs))))
    (cond ((equal-or-subtype type *event-type*) "e")
          ((equal-or-subtype type *ref-ind-type*) "x")
          ((equal-or-subtype type (vsym "class-specified")) "s")
          ((equal-or-subtype type *deg-ind-type*) "d")
          ((equal-or-subtype type *non_expl-ind-type*) "i")
          ((equal-or-subtype type *event_or_index-type*) "i")
          ((equal-or-subtype type *handle-type*) "h")  
          (t "u"))))

;;;
;;; Bruland. 16.01.2013
;;; Tips from Dan. 
;;; In [incr tsdb] our predicates with NorSource spesific argument names where not shown in the annotating function
;;; This overrides the default in LOGON 
;;;
(defparameter %eds-relevant-features%
  '("ARG" "ARG1" "ARG2" "ARG3" "ARG4" "BV" "SOA"
    "ARGX" "ARGOBLQ" "ARGOBLQ2"
    "CONST_VALUE" "CARG" "TERM1" "TERM2" "FACTOR1" "FACTOR2"
    "MARG" "L-INDEX" "R-INDEX" "L-HNDL" "R-HNDL"  "L-HANDEL" "R-HANDEL"
    "MAIN" "SUBORD" "ROLE" "HINST" "NHINST"))



