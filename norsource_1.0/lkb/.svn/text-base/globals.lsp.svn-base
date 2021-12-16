;;; LinGO grammar specific globals file
;;; parameters only - grammar specific functions 
;;; should go in user-fns.lsp

(defparameter *active-parsing-p* t)

;;; Strings

(defparameter *toptype* '*top*)

(defparameter *string-type* 'string
   "a special type name - any lisp strings are subtypes of it")

;;; Lexical files

(defparameter *orth-path* '(stem))

(defparameter *list-tail* '(rest))

(defparameter *list-head* '(first))

(defparameter *empty-list-type* 'null)

(defparameter *list-type* 'list)

(defparameter *diff-list-type* 'diff-list)

(defparameter *diff-list-list* 'list)

(defparameter *diff-list-last* 'last)

;(defparameter *lex-rule-suffix* "_INFL_RULE"
; "creates the inflectional rule name from the information
;  in irregs.tab - for PAGE compatability")

(defparameter *irregular-forms-only-p* t)

;;;
;;; input characters to be ignored (i.e. suppressed) in tokenization
;;; NOTE: obsoleted by FSPP
;;;
(defparameter *punctuation-characters*
  (append
   '(#\space #\! #\" #\& #\' #\(
     #\) #\* #\+ #\, #\- #\. #\/ #\;
     #\< #\= #\> #\? #\@ #\[ #\\ #\] #\^
     #\_ #\` #\{ #\| #\} #\~)
   #+:ics
   '(#\ideographic_full_stop #\fullwidth_question_mark 
     #\horizontal_ellipsis #\fullwidth_full_stop
     #\fullwidth_exclamation_mark #\black_circle
     #\fullwidth_comma #\ideographic_space
     #\katakana_middle_dot #\white_circle)))

(defparameter *display-type-hierarchy-on-load* nil)

;;; Parsing

(defparameter *chart-limit* 100)

(defparameter *maximum-number-of-edges* 4000)

(defparameter *mother-feature* NIL
  "The feature giving the mother in a grammar rule")

(defparameter *start-symbol* '(root root2)
  "specifing valid parses")

(defparameter *maximal-lex-rule-applications* 6
   "The number of lexical rule applications which may be made
   before it is assumed that some rules are applying circularly")

(defparameter *maximal-morphological-rule-depth* 1)
(setf *maximal-morphological-rule-depth* 1)

(defparameter *deleted-daughter-features* 
  '(ARGS HEAD-DTR NON-HEAD-DTR DTR)
  "features pointing to daughters deleted on building a constituent")

;;; Parse tree node labels

;;; the path where the name string is stored
(defparameter *label-path* '(LABEL-NAME))

;;; the path for the meta prefix symbol
(defparameter *prefix-path* '(META-PREFIX))

;;; the path for the meta suffix symbol
(defparameter *suffix-path* '(META-SUFFIX))

;;; the path for the recursive category
(defparameter *recursive-path* '(SYNSEM NON-LOCAL SLASH LIST FIRST))

;;; the path inside the node to be unified with the recursive node
(defparameter *local-path* '(SYNSEM LOCAL))

;;; the path inside the node to be unified with the label node
(defparameter *label-fs-path* '())

(defparameter *label-template-type* 'label)

;;; for the compare function 

(defparameter *discriminant-path* '(synsem local keys key pred))

(defparameter *lexdb-dump-tdl* nil)

;; customise default parse sentence
#-:tty
(if (or 
     (equalp *last-parses* '("the dog barks"))
     (null *last-parses*))
    (setf *last-parses* '("mannen smiler")))

;; (bmw)
;; display all morphological realisations (rather than 1 step at a time)
(defparameter *lex-rule-show-one-step* nil)

;; enable characterization
(defparameter *characterize-p* t)

(defparameter *maximum-list-pane-items* 500)

;;;

;;; SMAF etc.
;;;

#+:smaf
(progn
  ;; enable clobbering
  (setf smaf::*clobber-p* t)
  ;; ... and log clobbered edges
  (setf smaf::*warning-clobber* t)
  ;; warn on all unanalysed tokens
  (setf *generate-messages-for-all-unanalysed-tokens* t)
  ;; abort parse if no spanning path
  (setf *abort-parse-if-no-spanning-morph-edge-path* t)
  
  ;; unknown word fallback
;;  (setf *fallback-pos-p* t)
;;  (setf smaf::*unknown-word-type* 'proper-name-word)
  )

;;;
;;; COMPOUNDS
;;;

(defparameter *compound-constituent-supertype* 'noun-lexeme)
(defparameter *compound-join-strings* '("s" "e"))
(defparameter *compound-sem-path* '(synsem lkeys keyrel pred))

(setf *translate-grid* '(:no . (:no)))


;;;
;;; FOR MALGRAM
;;;

(setf *gen-ignore-rules*
  '(mal-head-subject-rule
    mal-head-invertsubject-decl-rule
    mal-adjective-mod-def-m-or-f-sg-rule
    mal-adjective-mod-def-neut-sg-rule
    mal-adjective-mod-def-plur-rule
    mal-vp-to-inf-cp-rule
    mal-inf-cp-to-vp-rule
    mal-neutsg-adj_infl_rule
    mal-commsg-adj-finstr_infl_rule
    mal-pres-infl_rule
    mal-present-inf-like_infl_rule
    mal-past-inf-like-1_infl_rule
    mal-past-inf-like-2_infl_rule
    mal-passive-form-to-passive-vp-rule
    mal-pred-ap-to-copula-rule
    mal-pp-to-copula-rule
    mal-np-to-copula-rule
    mal-adv-to-copula-rule
    mal-subj-drop-rule
    mal-np-obj-drop-rule
    mal-np-in-sel-pp-drop-rule
    mal-vp-subcat-pp-for-np-rule
    mal-vp-subcat-np-for-pp-rule
    mal-3rd-refl-np-obj-drop-rule
    mal-2nd-sg-refl-np-obj-drop-rule
    mal-2nd-pl-refl-np-obj-drop-rule
    mal-1st-pl-refl-np-obj-drop-rule
    mal-1st-sg-refl-np-obj-drop-rule
    mal-perf-marker-drop-rule
    mal-redundant-med-with-sammen-rule
    mal-s-adv-sentence-final-rule
    mal-quant-adv-final-rule
	mal-s-adv-sentence-initial-rule
    mal-postnom-poss-rule
    mal-possparticle-drop-rule
    mal-n_spec-m_or_f_noun-head-spec-det-rule
    mal-m_or_f_spec-n_noun-head-spec-det-rule
    mal-pl_spec-sg_noun-head-spec-det-rule
    mal-sg_spec-pl_noun-head-spec-det-rule
    mal-n_spec-m_noun-head-spec-art-rule
    mal-fem_spec-m_noun-head-spec-art-rule
    mal-n_spec-f_noun-head-spec-art-rule
    mal-m_or_f_spec-n_noun-head-spec-art-rule
    mal-n_spec-m_or_f_noun-head-spec-quantor-rule
    mal-m_or_f_spec-n_noun-head-spec-quantor-rule
	mal-object-before-the-verb-rule
    ; I-rules
    ; Noun I-rules
    mal_masc_sing_def_for_neut_sing_def_final-full-mm_irule
    mal_masc_sing_def_for_neut_sing_def_final-full_irule
    mal_masc_sing_def_for_neut_sing_def_light-e_irule
    mal_comm_pl_indef_for_neut_pl_indef_final-full_irule
    mal_comm_pl_indef_for_neut_pl_indef_final-full-mm_irule
    mal_comm_pl_indef_for_neut_pl_indef_light-e_irule
    mal_fem_sg_def_for_masc_sg_def_final-full-mm_irule
    mal_fem_sg_def_for_masc_sg_def_final-full_irule
    mal_fem_sg_def_for_masc_sg_def_light-e_irule
    mal_neut_sg_def_for_masc_sg_def_final-full-mm_irule
    mal_neut_sg_def_for_masc_sg_def_final-full_irule
    mal_neut_sg_def_for_masc_sg_def_light-e_irule
    mal_neut_sg_def_for_fem_sg_def_final-full-mm_irule
    mal_neut_sg_def_for_fem_sg_def_final-full_irule
    mal_neut_sg_def_for_fem_sg_def_light-e_irule
    ; Adjective I-rules
    mal-n_sg_strong-for-c_sg_strong-finstr_infl_rule
    mal-n_sg_strong-for-c_sg_strong-nonfstr_infl_rule
    mal-c_sg_strong-for-n_sg_strong-infl_rule
    mal-c_sg_strong-for-pl_strong-infl_rule
    mal-c_sg_strong-for-weak-infl_rule
    mal-n_sg_strong-for-pl_strong-nonfstr_infl_rule
    mal-n_sg_strong-for-pl_strong-finstr_infl_rule
    mal-n_sg_strong-for-weak-nonfstr_infl_rule
    mal-n_sg_strong-for-weak-finstr_infl_rule
    mal-plural_or_weak-for-c_sg_strong-nonfstr_infl_rule
    mal-plural_or_weak-for-c_sg_strong-finstr_infl_rule
    mal-plural_or_weak-for-n_sg_strong-nonfstr_infl_rule
    mal-plural_or_weak-for-n_sg_strong-finstr_infl_rule
	; Verb I-rules
	mal-pres_to_inf-infl_rule
	mal-pres_to_perf-infl_rule
	mal-present-inf-like_infl_rule
	mal-past-inf-like-1_infl_rule	
	mal-past-inf-like-2_infl_rule
	mal-perfect_present-like_infl_rule	
	mal-perfect_past-like-1_infl_rule
	mal-perfect_past-like-2_infl_rule
    ; L-rules
    ; noun L-rules
    mal-bare-sg-noun-lxm-lrule
 ))

(defparameter *duplicate-lex-ids*
    '(mal_en_indef-neut-art
      mal_en_indef-fem-art 
      mal_et_indef-masc-art
      mal_et_indef-fem-art
      mal_ei_indef-neut-art
      mal_ei_indef-masc-art
      mal_det_masc_or_fem_sg_dem
      mal_det_pl_dem
      mal_den_neut_sg_dem
      mal_den_pl_dem
      mal_de_neut_sg_dem
      mal_de_masc_or_fem_sg_dem
      mal_jeg_perspron
      mal_meg_perspron
      mal_vi_perspron
      mal_oss_perspron
      mal_du_perspron
      mal_deg_perspron
      mal_de_perspron
      mal_dem_perspron
      mal_ham_perspron
      mal_hun_perspron
      mal_henn_persprone
      mal_og_inf_comp
      mal_å_connect
      mal_å__n-coord
      mal_å_adv-p-coord
      mal_å_v-coord
      mal_å_v-dir-coord
      mal_å_relclause-coord
      mal_å_adj-coord
      ))
