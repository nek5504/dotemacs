(el-get-bundle ag)
(el-get-bundle auto-complete
  (eval-after-load "auto-complete"
    '(diminish 'auto-complete-mode)))
(el-get-bundle diminish
  (require 'diminish)
  (diminish 'abbrev-mode))
(el-get-bundle goto-chg
  (eval-after-load "goto-chg"
    '(eval-after-load "smartrep"
       '(smartrep-define-key global-map "M-g"
          '(("n" quote goto-last-change-reverse)
            ("p" quote goto-last-change))))))
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
    (eval-after-load "ace-isearch"
      '(diminish 'ace-isearch-mode))
    (require 'ace-isearch))
  (el-get-bundle ace-jump-mode
    (require 'ace-jump-mode))
  (el-get-bundle avy
    (require 'avy))
  (global-ace-isearch-mode 1))
(el-get-bundle smartrep
  (require 'smartrep))
(el-get-bundle switch-window
  (with-eval-after-load-feature 'switch-window
    (custom-set-variables '(switch-window-threshold 3))
    (define-key global-map (kbd "C-x o") 'switch-window)))
(el-get-bundle undo-tree
  (with-eval-after-load-feature 'undo-tree
    (diminish 'undo-tree-mode)
    (global-undo-tree-mode)))
(el-get-bundle yasnippet
  (eval-after-load "yasnippet"
    '(diminish 'yas-minor-mode))
  (require 'yasnippet)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))
(el-get-bundle yatemplate
  (require 'yatemplate)
  (yatemplate-fill-alist)
  (auto-insert-mode 1))
(el-get-bundle visual-regexp
  (require 'visual-regexp)
  (define-key global-map (kbd "M-%") 'vr/query-replace))
(el-get-bundle zoom-window
  (require 'zoom-window)
  (define-key global-map (kbd "C-x 1") 'zoom-window-zoom)
  (setq zoom-window-mode-line-color "DarkGreen"))

