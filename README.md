autopep8.el
===========

autopep8.el to beautify Python code
based on js-beautify.el - http://sethmason.com/2011/04/28/jsbeautify-in-emacs.html

put this in your emacs init:

    (add-to-list 'load-path "~/dir/containing/autopep8/")
    (require 'autopep8)

To use:
'M-x autopep8' applies on highlighted region or whole buffer


- Add submenu "Beautify with autopep8" to "Python" menu with key 'C-t C-t'
- updated by James Lao, 2013
