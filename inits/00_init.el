;;
;; http://emacs.rubikitch.com/better-defaults/
;; better-defaults:
;;
;;   Enable ido mode
(ido-mode t)
;;   Disable menu bar and tool bar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
;;   list-buffers -> ibuffer
(define-key global-map (kbd "C-x C-b") 'ibuffer)
;;   dabbrev-expand -> hippie-expand
(define-key global-map (kbd "M-/") 'hippie-expand)
;;   Highlight paired brackets
(show-paren-mode t)
;;   Disable indent by TAB
(setq-default indent-tabs-mode nil)
;;   Misc settings:
(setq
 ;;   Insert a new line to EOF on save
 require-final-newline t
 ;;   Use visible bell
 visible-bell t)

;;
;; Extra settings:
;;
;;   Enable display column number
(column-number-mode t)
;;   http://emacs.rubikitch.com/yes-or-no-p/
(defalias 'yes-or-no-p 'y-or-n-p)
;;   Backup file
(setq 
 make-backup-files t
 backup-directory-alist (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
                              backup-directory-alist))
;;   Misc settings:
(setq
 ;;   Disable auto save
 auto-save-default nil
 ;;   Disable initial screen
 inhibit-startup-screen t
 ;;   C-k -> Include EOL when cut a line
 kill-whole-line t
 ;;   http://emacs.rubikitch.com/line-number-display-limit-width/
 line-number-display-limit-width 8192)
;;   linum:
(require 'linum)
(global-linum-mode t)
(setq 
 ;;   http://d.hatena.ne.jp/daimatz/20120215/1329248780
 linum-delay t
 ;;   Allocate fixed widths
 linum-format "%5d ")
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 1.0 nil #'linum-update-current))

;;   Key bindings:
;;     C-h -> Backspace
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
;;     C-z -> M-v (scroll-down-command)
(define-key key-translation-map (kbd "C-z") (kbd "M-v"))

;;   Key shortcuts:
;;     C-x ! -> Delete other windows
(define-key global-map (kbd "C-x !") 'delete-other-windows)

;;   File extensions:
;;     rst_: reStructuredText
(add-to-list 'auto-mode-alist '("\\.rst_\\'" . rst-mode))

