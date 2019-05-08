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

; FIXME: Use 2.13.1 since 2.90 requires some git manupulation library (libgit).
;; dependecies
(el-get-bundle magit/git-modes)
(el-get-bundle magit/magit-popup)
;; FIXME: Add load-path by myself
(add-to-list 'load-path "~/.emacs.d/el-get/magit/lisp")
(el-get-bundle magit/magit :branch "2.13.1"
  (require 'magit))

(el-get-bundle zk-phi/git-complete
  (require 'git-complete)
  (setq git-complete-enable-autopair t))
