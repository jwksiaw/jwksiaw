(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/")
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

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
(setq-default py-shell-name "ipython3")
(setq-default py-which-bufname "IPython3")
;; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
      '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

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