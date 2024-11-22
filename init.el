;; THE GNU/EMACS CONFIG FILE
;; ash, 2024, ethique_moderne


;; TODO:
;; * Paint the mode-line red when an error occurs
;; * Set up flyspell-mode (hooks, bindings)
;; * Try to mess with the org-mode...


(require 'centaur-tabs)              ;; Tabs for buffer groups
(require 'dashboard)                 ;; Statrup screen
(require 'treemacs)                  ;; File navigation
(require 'package)                   ;; Package manager
(require 'org)                       ;; The Mighty Org Mode
(require 'fb2-reader)


;; ------------------
;; CONFIGURE PACKAGES
;;-------------------
(use-package fb2-reader
  :mode ("\\.fb2\\(\\.zip\\)?\\'" . fb2-reader-mode)
  :commands (fb2-reader-continue)
  :custom
  (fb2-reader-page-width 80)
  (fb2-reader-image-max-width 400)
  (fb2-reader-image-max-height 400))


;; --------------------
;; ENABLE/DISABLE MODES
;; --------------------
(global-visual-line-mode 1)          ;; Proper breaking for long lines
(transient-mark-mode 1)              ;; [ Idk what it does ]
(centaur-tabs-mode t)                ;; Tabs for buffer groups
(scroll-bar-mode -1) 		     ;; Scroll bar
(menu-bar-mode -1)   		     ;; Top menu bar
(tool-bar-mode -1)   		     ;; Built-in ugly icons for actions
(cua-mode t)                         ;; C-c/C-v/C-z to copy/paste/undo


;; ------------
;; SET UP HOOKS
;; ------------
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(add-hook 'org-mode-hook
	  (lambda ()
	    (olivetti-mode)
	    (org-indent-mode
	     (local-set-key (kbd "C-b") 'org-emphasize)))) ;; olivetti-mode

(add-hook 'fountain-mode-hook (lambda () (olivetti-mode)))

;;(add-to-list 'org-export-latex-packages-alist '("" "cmap" t))
;;(add-to-list 'org-export-latex-packages-alist '("english,russian" "babel" t))

(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; programming modes


(add-hook 'emacs-lisp-mode-hook
	  (lambda () (local-set-key (kbd "C-b") 'eval-buffer))
	  )

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(dashboard-setup-startup-hook)


(add-to-list 'org-latex-packages-alist '("AUTO" "babel" t ("pdflatex")))

;; ---------------------
;; CALL/DEFINE FUNCTIONS
;; ---------------------
(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(ef-trio-light))
 '(custom-safe-themes
   '("df1ed4aa97d838117dbda6b2d84b70af924b0380486c380afb961ded8a41c386" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "0664443859604a53d2257701f034459edf8eab3cc2be50c7d8ae36740fe35578" "7257129c6b4a6f3b57ec53d0ae13914c80004b69a97e0a60b14e097550542bed" "5e0b80a3faa2d0e8a27f1219abf29ec1ed5b274113960579ae05ae63d1b2f660" "30b323c73d2b24c3eff96802f0085fbfef3c6d2aad03ddfb5f615b658b2d5bfa" "46ae6660834278f41a1c074b817bb316f2da0196513b59a83a2a49b846a9921f" "f84dbe5cfa80aa6774c57fef30d76bcdeb71bd0077665fb74f75728c42f5675d" "2ef84b2c7ad4810912a095993ca8bdf386e1fd7f97842b57aac62dddb2bba211" default))
 '(display-line-numbers-width-start t)
 '(display-time-24hr-format t)
 '(fountain-export-command-profiles
   '(("wrap" . "wrap pdf %b -o %B.pdf 2> /dev/null")
     ("afterwriting-usletterpdf-doublespace" . "afterwriting --source %b --pdf %B.pdf --overwrite --setting double_space_between_scenes=true --setting print_profile=usletter")
     ("afterwriting-a4pdf-doublespace" . "afterwriting --source %b --pdf %B.pdf --overwrite --setting double_space_between_scenes=true --setting print_profile=a4")
     ("wrap-usletterpdf-cprime" . "wrap pdf %b --use-courier-prime --out %B.pdf")
     ("make-pdf" . "make %B.pdf")
     ("textplay-fdx" . "textplay --fdx < %b > %B.fdx")
     ("screenplain" . "screenplain %b --strong --encoding=utf-8 -f pdf %B.pdf")))
 '(fountain-export-troff-extra-options '("-ms -Kutf8 -Tpdf -Dpdf -TC"))
 '(fountain-scene-numbers-display-in-margin t)
 '(fountain-scene-numbers-separator 46)
 '(fountainq-export-troff-command "groff")
 '(google-translate-default-source-language "auto")
 '(google-translate-default-target-language "ru")
 '(ispell-dictionary "russian")
 '(olivetti-minimum-body-width 100)
 '(org-agenda-files '("~/work/org/Catch 22.org" "/home/ash/work/org/дела.org"))
 '(package-selected-packages
   '(magit git dired-git sublime-themes sublimity smart-mode-line minesweeper telega fb2-reader easy-jekyll all-the-icons google-translate dashboard page-break-lines pdf-tools fountain-mode treemacs centaur-tabs ef-themes lsp-treemacs writeroom-mode olivetti ## org-modern))
 '(sml/extra-filler 0)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fb2-reader-default ((t nil)))
 '(treemacs-root-face ((t (:foreground "black")))))


;; -------------
;; SET VARIABLES
;; -------------
;; centaur-tabs
(setq centaur-tabs-set-modified-marker t
      centaur-tabs-modified-marker "*"
      centaur-tabs-show-count t
      centaur-tabs-set-bar nil
      centaur-tabs-style "bar"
      centaur-tabs-height 35)

;; dashboard
(setq dashboard-startup-banner nil
      dashboard-center-content t
      dashboard-vertically-center-content t
      dashboard-set-navigator t
)

;; treemacs
(setq treemacs-no-png-images t)

;; cua
(setq cua-auto-tabify-rectangles nil
      tab-always-indent 'complete)

;; org
(setq org-indent-indentation-per-level 1
      org-replace-disputed-keys t
      org-support-shift-select t ;; deals with cua-mode
      org-hide-emphasis-markers t)

;; fountain
(setq fountain-display-scene-numbers-in-margin t)

;; system
(setq scroll-conservatively 10000)
(setq frame-title-format "[ %b ]") 
(setq-default cursor-type 'bar)
(setq auto-window-vscroll nil)
(setq isearch-lazy-count 1)
(setq scroll-step 1)
(setq-default mode-line-format
	      '(
		"[ %l:%c ]"
		"%e " mode-line-modes
		))
;;(setq sgml-quick-keys 'close)



;; -------------------
;; SET FONTS AND FACES
;; -------------------
(set-frame-font "IBM\ Plex\ Mono 13" nil t)

;(set-face-attribute 'mode-line nil
;		    :height 140
;		    :foreground "#4F3363"
;		    :background "#F8F5FF"
;		    :overline "black"
;		    :underline nil
;		    :box nil)
;(set-face-attribute 'mode-line-inactive nil
;		    :height 140
;		    :foreground "#786E74"
;		    :background "#F8F5FF"
;		    :overline "gray"
;		    :underline nil
;		    :inherit nil
;		    :box nil)
;;(set-face-attribute centaur-tabs-display-line nil
;;		    :background "#F8F5FF")
(set-face-attribute centaur-tabs-display-line nil
		    :background (format "%s" (face-attribute 'default :background)))

;; ----------------------------
;; UNSET OLD NON-SILLY BINDINGS
;; ----------------------------
;; Old values:
;; [M-l]     -> downcase-word
;; [C-s]     -> isearch-forward
;; [C-f]     -> forward-char
;; [C-x C-s] -> save-buffer
;; [M->]     -> end-of-buffer
;; [M-<]     -> beginning-of-buffer

(global-unset-key (kbd "C-x C-s"))
(global-unset-key (kbd "M->"))
(global-unset-key (kbd "M-<"))
(global-unset-key (kbd "C-y"))


;; ----------------------
;; SET NEW SILLY BINDINGS
;; ----------------------
;; Movement for treemacs-mode
(define-key treemacs-mode-map (kbd "C-<right>") 'treemacs-next-workspace)
(define-key treemacs-mode-map (kbd "C-<left>") 'treemacs-next-workspace)
(define-key treemacs-mode-map (kbd "C-<up>") 'treemacs-previous-project)
(define-key treemacs-mode-map (kbd "C-<down>") 'treemacs-next-project)

(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward) ;;repetitive search for new binding
(global-set-key (kbd "C-x C-<up>") 'other-window)
(global-set-key (kbd "C-x C-<down>") 'previous-window-any-frame)
(global-set-key (kbd "C-x C-<right>") 'centaur-tabs-forward)
(global-set-key (kbd "C-x C-<left>") 'centaur-tabs-backward)
(global-set-key (kbd "M-<up>") 'beginning-of-buffer)
(global-set-key (kbd "C-<left>") 'beginning-of-line)
(global-set-key (kbd "M-<down>") 'end-of-buffer)
(global-set-key (kbd "C-<right>") 'end-of-line)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-d") 'treemacs)
(global-set-key (kbd "<mouse-9>") 'flyspell-correct-word)
(global-set-key (kbd "s-f") 'flyspell-mode)
(global-set-key (kbd "s-b") 'flyspell-buffer)

(global-set-key (kbd "C-c") 'magit-commit)
(global-set-key (kbd "C-p") 'magit-push)


;; ---------
;; AUXILIARY
;; ---------
(message "Buffer has been successfully evaluated!")
