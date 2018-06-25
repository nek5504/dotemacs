(el-get-bundle helm 
  (require 'helm)
  (helm-mode t)
  ;; https://abicky.net/2015/11/23/223011/
  (define-key global-map (kbd "C-c i") 'helm-semantic-or-imenu)
  (define-key global-map (kbd "C-x b") 'helm-mini)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x C-r") 'helm-recentf)
  (define-key global-map (kbd "M-x") 'helm-M-x)
  (define-key global-map (kbd "M-y") 'helm-show-kill-ring)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
  (setq helm-buffer-details-flag nil)
  (add-hook 'after-init-hook 'helm-recentf)
  '(diminish 'helm-mode))
(el-get-bundle helm-ag
  (require 'helm-ag))
(el-get-bundle helm-swoop
  (require 'helm-swoop))
