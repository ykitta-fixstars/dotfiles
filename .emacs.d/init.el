;; init.el
;;
;; install packages:
;;  - auto-complete
;;  - ddskk
;; TODO: install automatically?

(add-to-list 'load-path "~/.emacs.d/site-lisp")

(show-paren-mode t)
(setq confirm-kill-emacs 'y-or-n-p)
(setq truncate-lines t)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-g" 'goto-line)
(define-key mode-specific-map "c" 'compile)

;; melpa
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; SKK
(setq-default skk-kutouten-type 'en)
(global-set-key (kbd "C-x C-j") 'skk-mode)

;; Scheme-mode
(setq scheme-program-name "gosh -i")

;; cc-mode
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; gtags
(require 'gtags)
(add-hook 'gtags-mode-hook
		  '(lambda ()
			 (local-set-key "\M-r" 'gtags-find-rtag)))

;; text-mode
(add-hook 'text-mode
		  '(lambda ()
			 (setq indent-tabs-mode nil)))

;; octave-mode
(require 'octave-mod)
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(add-hook 'octave-mod
		  '(lambda () (setq tab-width 4)))
