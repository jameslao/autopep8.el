autopep8.el
===========

autopep8.el to beautify Python code
based on js-beautify.el - http://sethmason.com/2011/04/28/jsbeautify-in-emacs.html

requires autopep8 - https://github.com/hhatto/autopep8

put this in your emacs init:

    (add-to-list 'load-path "~/dir/containing/autopep8/")
    (require 'autopep8)

To use:
`M-x autopep8`, "Beautify with autopep8" in "Python" menu, or with key `C-t C-t`, to apply autopep8 on highlighted region or whole buffer.
