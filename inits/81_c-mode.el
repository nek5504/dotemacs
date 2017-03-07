;; ggtags-mode
(el-get-bundle ggtags
  (with-eval-after-load-feature 'ggtags
    ;; https://github.com/leoliu/ggtags#config
    (add-hook 'c-mode-common-hook
              (lambda ()
                (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                  (ggtags-mode 1))))
    (defalias 'ggtags-navigation-mode 'ignore)
    ;; http://futurismo.biz/archives/3071
    (custom-set-variables '(ggtags-completing-read-function nil))
    (define-key ggtags-mode-map (kbd "M-g M-c") 'ggtags-create-tags)
    (define-key ggtags-mode-map (kbd "M-g M-d") 'ggtags-find-definition)
    (define-key ggtags-mode-map (kbd "M-g M-e") 'ggtags-find-tag-regexp)
    (define-key ggtags-mode-map (kbd "M-g M-f") 'ggtags-find-file)
    (define-key ggtags-mode-map (kbd "M-g M-h") 'ggtags-view-tag-history)
    (define-key ggtags-mode-map (kbd "M-g M-r") 'ggtags-find-reference)
    (define-key ggtags-mode-map (kbd "M-g M-r") 'ggtags-find-tag-dwim)
    (define-key ggtags-mode-map (kbd "M-g M-u") 'ggtags-update-tags)))
(el-get-bundle google-c-style
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode)
                (require 'google-c-style)
                (google-set-c-style)
                (google-make-newline-indent)))))

;; gdb-mode:
(add-hook 'gdb-mode-hook
          '(lambda ()
             (setq 
              ;; Enable opening helpful windows
              gdb-many-windows t
              ;; Separate I/O buffer
              gdb-use-separate-io-buffer t)
             (cl-flet ((setup (mode)
                              (define-key mode (kbd "C-x C-a C-d") 'gud-down)
                              (define-key mode (kbd "C-x C-a C-u") 'gud-up)
                              (define-key mode (kbd "C-x C-a d") 'gud-remove)
                              (define-key mode (kbd "C-x C-a p") 'gud-print)
                              (define-key mode (kbd "C-x C-a t") 'gud-tbreak)
                              (define-key mode (kbd "C-x C-a w") 'gud-watch)
                              (smartrep-define-key mode "C-x C-a"
                                '(("c" . 'gud-cont)
                                  ("f" . 'gud-finish)
                                  ("n" . 'gud-next)
                                  ("s" . 'gud-step)
                                  ("u" . 'gud-until)))))
               (setup c-mode-map)
               (setup c++-mode-map))))

