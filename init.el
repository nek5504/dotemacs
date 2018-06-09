;;
;; package-managers:
;;   http://tarao.hatenablog.com/entry/20150221/1424518030
;;

(package-initialize)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;
;;   el-get packages
;;
(el-get-bundle 'init-loader
  (require 'init-loader)
  (setq init-loader-byte-compile t)
  (setq init-loader-show-log-after-init nil)
  (init-loader-load "~/.emacs.d/inits"))

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
