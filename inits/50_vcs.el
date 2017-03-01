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
;; Newer versions of magit require 24.4 or higher
(el-get-bundle magit/git-modes :branch "1.0.0"
  (el-get-bundle magit/magit :branch "1.4.2"
    (with-eval-after-load-feature 'magit
      (magit-auto-revert-mode 1)
      (setq magit-last-seen-setup-instructions "1.4.0")
      (diminish 'magit-auto-revert-mode))))

