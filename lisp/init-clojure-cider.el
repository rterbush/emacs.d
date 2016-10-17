;;; package --- Summary:
;;; Commentary:
(require 'init-clojure)
;;; Code:
(defun cider-figwheel-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/start-figwheel!)
             (figwheel-sidecar.repl-api/cljs-repl)")
    (cider-repl-return)))

(global-set-key (kbd "C-c C-r") 'cider-figwheel-repl)

(when (maybe-require-package 'cider)
  (require-package 'ac-cider)

  (setq nrepl-popup-stacktraces nil)

  (after-load 'cider
    (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
    (add-hook 'cider-mode-hook 'ac-cider-setup)
    (after-load 'auto-complete
      (add-to-list 'ac-modes 'cider-repl-mode))

    (add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
    (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
    (add-hook 'cider-mode-hook 'eldoc-mode)
    (add-hook 'cider-repl-mode-hook 'subword-mode)
    (add-hook 'cider-repl-mode-hook 'paredit-mode)
    (define-key cider-mode-map (kbd "C-c C-d") 'ac-cider-popup-doc)
    (global-set-key (kbd "C-c g") 'cider-grimoire)

    ;; nrepl isn't based on comint
    (add-hook 'cider-repl-mode-hook
              (lambda () (setq show-trailing-whitespace nil))))

  (require-package 'flycheck-clojure)
  (after-load 'clojure-mode
    (after-load 'flycheck
      (flycheck-clojure-setup)
      '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))

(provide 'init-clojure-cider)
;;; init-clojure-cider.el ends here
