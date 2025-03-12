(defpackage "haggis"
  (:use :clim :clim-lisp)
  (:export "HAGGIS-MAIN"))

(in-package :haggis)

(defun haggis-install-deps ()
    (ql:quickload :clim)
    (ql:quickload :clim-lisp)
  )

(clim:define-application-frame haggis ()
  ((greeting :initform "HagGIS"
	     :accessor greeting))
  (:pane (clim:make-pane 'haggis-pane)))

(defclass haggis-pane
    (clim:clim-stream-pane) ())

(defmethod handle-repaint ((pane haggis-pane) region)
  (let ((w (bounding-rectangle-width pane))
	(h (bounding-rectangle-height pane)))
    ;;
    (draw-rectangle* pane 0 0 w h
		     :filled t
		     :ink (pane-background pane))
    (draw-text* pane
		(greeting *application-frame*)
		(floor w 2) (floor h 2)
		:align-x :center
		:align-y :center)))

(defun haggis-main ()
  (clim:run-frame-top-level
   (clim:make-application-frame 'haggis))
  )

;; (haggis-main)
