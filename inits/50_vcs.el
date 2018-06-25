(el-get-bundle diffview
  (with-eval-after-load-feature 'diffview
    (defun diffview-close ()
      (interactive)
      (kill-buffer "*side-by-side-1*")
      (kill-buffer "*side-by-side-2*")
      (kill-buffer-and-window))))
(el-get-bundle git-gutter
  (with-eval-after-load-feature 'git-gutter
    (add-hook 'git-gutter-mode-on-hook
              '(lambda ()
                 (smartrep-define-key (current-local-map) "M-g"
                   '(("d" . 'git-gutter:popup-diff)
                     ("n" . 'git-gutter:next-hunk)
                     ("p" . 'git-gutter:previous-hunk)
                     ("r" . 'git-gutter:revert-hunk)
                     ("u" . 'git-gutter:update-all-windows)))))
    (git-gutter:linum-setup)))
(el-get-bundle magit/magit
  (require 'magit)
  (magit-auto-revert-mode 1)
  (diminish 'magit-auto-revert-mode))
(el-get-bundle magit/git-modes
  (require 'git-modes))
(el-get-bundle zk-phi/git-complete
  (require 'git-complete)
  (setq git-complete-enable-autopair t))
