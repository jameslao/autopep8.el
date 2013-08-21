;;; autopep8.el -- clean up python code
;;;
;;; based on js-beautify.el - http://sethmason.com/2011/04/28/jsbeautify-in-emacs.html
;;;
;;; put this in your emacs init:
;;; (add-to-list 'load-path "~/dir/containing/autopep8/")
;;; (require 'autopep8)
;;;
;;; to use:
;;; 'M-x autopep8' applies on highlighted region or whole buffer
;;; Add submenu "Beautify with autopep8" to "Python" menu with key 'C-t C-t'
;;; updated by James Lao, 2013

(defgroup autopep8 nil
  "Use autopep8 to clean up python code"
  :group 'editing)

(defcustom autopep8-args " - "
  "Arguments to pass to autopep8 script"
  :type '(string)
  :group 'autopep8)

(defcustom autopep8-path "C:/Python33/Scripts/autopep8-script.py"
  "Path to autopep8 python file"
  :type '(string)
  :group 'autopep8)

(defun autopep8 ()
  "Beautify a region or buffer of python using autopep8"
  (interactive)

  (if (use-region-p)
      (progn
	(let ((orig-point (point)))
	  (unless (mark) (mark-defun))
	  (shell-command-on-region (point)
				   (mark)
				   (concat "python "
					   autopep8-path
					   autopep8-args)
				   nil t)
	  (goto-char orig-point))
	(message "Beautified regionwith autopep8"))
    (progn
      (shell-command-on-region (point-min)
			       (point-max)
			       (concat "python "
				       autopep8-path
				       autopep8-args)
			       nil t)
      (message "Beautified buffer with autopep8"))))

(require 'easymenu)
(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key python-mode-map (kbd "C-t C-t")
	      'autopep8)
	    (easy-menu-add-item nil '("Python")
				["Beautify with autopep8" autopep8 t])))
(provide 'autopep8)
