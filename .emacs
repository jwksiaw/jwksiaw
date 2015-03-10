(require 'package)

(setq package-list '(color-theme-zenburn ido auto-complete python-mode clojure-mode paredit cider))

(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

;; fetch the list of packages availabe if not in the user directory
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Color theme zenburn
(require 'color-theme-zenburn)
(color-theme-zenburn)

(require 'ido)
(ido-mode t)

;; No splash
(setq inhibit-splash-screen t)

;; Initial settings
(setq initial-scratch-message nil)

;; Implement color-coding
;;(global-font-lock-mode t)

;; Get rid of menu bar
(menu-bar-mode 0)

;; Get rid of annoying backup files
(setq make-backup-files nil)

;; Highlight region and overwrite it when I type
(transient-mark-mode t)
(delete-selection-mode nil)
(show-paren-mode t)

;; Tells emacs to respond to the system clipboard
(setq x-select-enable-clipboard t)

;; Show column numbers
(setq column-number-mode t)

;; Lines is lines
(setq truncate-partial-width-windows nil)
(setq mode-require-final-newline nil)

;; Always show those ugly carriage returns
(setq inhibit-eol-conversion t)

;; Always show ugly trailing white space
(setq-default show-trailing-whitespace t)

;; No tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; General Auto-Complete
(require 'auto-complete-config)
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

;; Preferred indentation for switch statements in cc-mode
(c-set-offset 'case-label '+)

;; JavaScript indentation
(setq js-indent-level 2)

;; CSS prefs
(setq cssm-indent-level 4)
(setq cssm-mirror-mode nil)
(setq cssm-newline-before-closing-bracket t)
(setq cssm-indent-function #'cssm-c-style-indenter)

;; Objective-C style preferences (objc mode is kind of broken)
(defconst objc-style
  '((c-echo-syntactic-information-p . t)
    (c-offsets-alist . ((objc-method-args-cont . c-lineup-ObjC-method-args)
                        (objc-method-call-cont . c-lineup-ObjC-method-args))))
  "Objective-C Programming Style")

(defun objc-style-hook ()
  (c-add-style "objc" objc-style t)
  (c-set-style "objc")
  (setq tab-width 4))

(add-hook 'objc-mode-hook 'objc-style-hook)

;; Bash shell
(defun bash ()
  (interactive)
  (ansi-term "/bin/bash"))

;; Python
(require 'python-mode)
;; use IPython
;(setq-default py-shell-name "ipython")
;(setq-default py-which-bufname "IPython")
;; use the wx backend, for both mayavi and matplotlib
;(setq py-python-command-args
;      '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;(setq py-force-py-shell-name-p t)

;; Python shell
;(defun py-shell ()
;  (interactive)
;  (run-python "/usr/bin/env python" nil 0))
;(setq python-shell-setup-codes nil)


;; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
;; don't split windows
(setq py-split-windows-on-execute-p nil)
;; try to automagically figure out indentation
(setq py-smart-indentation t)

;; Erlang mode
;;(require 'erlang-start)


;; Haskell mode
(require 'haskell-mode)
(require 'inf-haskell)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)


;;Clojure
;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'paredit-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; syntax hilighting for midje
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))))

;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
;(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)
