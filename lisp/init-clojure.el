;;; package --- Summary:
;;; Commentary:
;; Basic clojure support, even in Emacs 23
;; See also init-clojure-cider.el
;;; Code:
(when (maybe-require-package 'clojure-mode)
  (require-package 'cljsbuild-mode)
  (require-package 'elein)

  (after-load 'clojure-mode
    (add-hook 'clojure-mode-hook 'sanityinc/lisp-setup)
    (add-hook 'clojure-mode-hook 'subword-mode)))

(provide 'init-clojure)
;;; init-clojure.el ends here
