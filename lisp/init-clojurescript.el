;;; package --- Summary:
;;; Commentary:
;; Basic clojurescript support
;; See also init-clojure-cider.el
;;; Code:
(add-to-list 'auto-mode-alist '("\\.cljs\\.hl\\'" . clojurescript-mode))

(add-hook 'clojure-mode-hook
            '(lambda ()
               ;; Hoplon functions and macros
               (dolist (pair '((page . 'defun)
                               (loop-tpl . 'defun)
                               (if-tpl . '1)
                               (for-tpl . '1)
                               (case-tpl . '1)
                               (cond-tpl . 'defun)))
                 (put-clojure-indent (car pair)
                                     (car (last pair))))))

(provide 'init-clojurescript)
;;; init-clojurescript.el ends here
