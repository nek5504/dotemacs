(el-get-bundle flycheck
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (add-hook 'c++-mode-hook
            (lambda () (setq flycheck-gcc-language-standard "c++11"))))
(el-get-bundle js2-mode
  ;; Javascript (*.js)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))
(el-get-bundle markdown-mode)
(el-get-bundle neotree)
(el-get-bundle quickrun)
(el-get-bundle web-mode
  ;;; http://web-mode.org/
  (with-eval-after-load-feature 'web-mode
    (setq web-mode-engines-alist 
          '(("blade" . "\\.blade\\'")
            ("php" . "\\.phtml\\'"))))
  ;; Server pages (*.asp, *.gsp, *.jsp)
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  ;; Active server pages (*.ascx, *.aspx)
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  ;; Django (*.djhtml)
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  ;; eRuby (*.erb)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  ;; mustache (*.mustache)
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  ;; PHP (*.phtml)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  ;; PHP (*.tpl.php)
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  ;;; Extra settings:
  ;; HTML (*.htm, *.html)
  (add-to-list 'auto-mode-alist '("\\.htm[l]?\\'" . web-mode))
  ;; Jinja2 (*.j2)
  (add-to-list 'auto-mode-alist '("\\.j2\\'" . web-mode)))
(el-get-bundle yaml-mode)
