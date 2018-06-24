(el-get-bundle diminish
  (require 'diminish)
  (diminish 'abbrev-mode))
(el-get-bundle smartrep
  (require 'smartrep))
(el-get-bundle with-eval-after-load-feature)

(el-get-bundle ag)
(el-get-bundle auto-complete
  (with-eval-after-load-feature 'auto-complete
    (diminish 'auto-complete-mode)))
(el-get-bundle goto-chg
  (require 'goto-chg)
  (smartrep-define-key global-map "M-g"
    '(("N" . goto-last-change-reverse)
      ("P" . goto-last-change)
      ("n" . next-error)
      ("p" . previous-error))))
(el-get-bundle migemo
  (require 'migemo)
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-command "cmigemo")
  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-regex-dictionary nil)
  (setq migemo-user-dictionary nil)
  (load-library "migemo")
  (migemo-init)
  (el-get-bundle ace-isearch
    (global-ace-isearch-mode 1)
    (require 'ace-isearch)
    (diminish 'ace-isearch-mode))
  (el-get-bundle ace-jump-mode
    (require 'ace-jump-mode))
  (el-get-bundle avy
    (require 'avy)))
(el-get-bundle switch-window
  (with-eval-after-load-feature 'switch-window
    (custom-set-variables '(switch-window-threshold 3))
    (define-key global-map (kbd "C-x o") 'switch-window)))
(el-get-bundle undo-tree
  (with-eval-after-load-feature 'undo-tree
    (global-undo-tree-mode)
    (diminish 'undo-tree-mode)))
(el-get-bundle yasnippet
  (require 'yasnippet)
  (yas-global-mode 1)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (diminish 'yas-minor-mode))
(el-get-bundle yatemplate
  (require 'yatemplate)
  (yatemplate-fill-alist)
  (auto-insert-mode 1))
(el-get-bundle visual-regexp
  (require 'visual-regexp)
  (define-key global-map (kbd "M-%") 'vr/query-replace))
(el-get-bundle zoom-window
  (require 'zoom-window)
  (define-key global-map (kbd "C-x !") 'zoom-window-zoom)
  (setq zoom-window-mode-line-color "DarkGreen"))
