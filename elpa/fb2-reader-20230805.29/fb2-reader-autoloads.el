;;; fb2-reader-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from fb2-reader.el

(autoload 'fb2-reader-continue "fb2-reader" "\
Continue reading last opened book." t)
(autoload 'fb2-reader-mode "fb2-reader" "\
Major mode for reading FB2 books.
\\{fb2-reader-mode-map}

(fn)" t)
(add-to-list 'auto-mode-alist '("\\.fb2\\(\\.zip\\)?\\'" . fb2-reader-mode))
(register-definition-prefixes "fb2-reader" '("fb2-reader-"))

;;; End of scraped data

(provide 'fb2-reader-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; fb2-reader-autoloads.el ends here
