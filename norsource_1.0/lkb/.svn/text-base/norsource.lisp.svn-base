(in-package :common-lisp-user)
;;
;; make sure we have enough space available
;;
(system:resize-areas :old 256 :new 256)
(let* ((logon (system:getenv "LOGONROOT"))
       (lingo (namestring (parse-namestring (format nil "~a/lingo" logon)))))
  ;;
  ;; load MK defsystem() and LinGO load-up library first
  ;;
  (load (format nil "~a/lingo/lkb/src/general/loadup" logon))
  ;;
  ;; for NorSource, we need (close to) the full scoop
  ;;
  (pushnew :lkb *features*)
  (pushnew :mrs *features*)
  (pushnew :tsdb *features*)
  (pushnew :logon *features*)
  (pushnew :slave *features*)
  (excl:tenuring 
   (funcall (intern "COMPILE-SYSTEM" :make) "tsdb")
   (funcall 
    (intern "READ-SCRIPT-FILE-AUX" :lkb)
    (format nil "~a/ntnu/norsource/lkb/script" logon)))
;; when we can generate
;; (funcall (intern "INDEX-FOR-GENERATOR" :lkb)))
  (set (intern "*MAXIMUM-NUMBER-OF-EDGES*" :lkb) 10000)
  (excl:gc :tenure) (excl:gc) (excl:gc t) (excl:gc)
  (setf (sys:gsgc-parameter :auto-step) nil)
  (set (intern "*TSDB-SEMANTIX-HOOK*" :tsdb) "mrs::get-mrs-string")
  (funcall (symbol-function (find-symbol "SLAVE" :tsdb))))
