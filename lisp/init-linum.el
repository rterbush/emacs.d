;;; package --- init-linum.el
;;; Commentary:
;;; Code:

(setq linum-format "%3d ")

(defvar *linum-mdown-line* nil)

(defun line-at-click ()
  (save-excursion
    (let ((click-y (cdr (cdr (mouse-position))))
          (line-move-visual-store line-move-visual))
      (setq line-move-visual t)
      (goto-char (window-start))
      (next-line (1- click-y))
      (setq line-move-visual line-move-visual-store)
      ;; If you are using tabbar substitute the next line with
      ;; (line-number-at-pos))))
      (1+ (line-number-at-pos)))))

(defun md-select-linum ()
  (interactive)
  (goto-line (line-at-click))
  (set-mark (point))
  (setq *linum-mdown-line*
        (line-number-at-pos)))

(defun mu-select-linum ()
  (interactive)
  (when *linum-mdown-line*
    (let (mu-line)
      ;; (goto-line (line-at-click))
      (setq mu-line (line-at-click))
      (goto-line (max *linum-mdown-line* mu-line))
      (set-mark (line-end-position))
      (goto-line (min *linum-mdown-line* mu-line))
      (setq *linum-mdown*
            nil))))

(global-set-key (kbd "<left-margin> <down-mouse-1>") 'md-select-linum)
(global-set-key (kbd "<left-margin> <mouse-1>") 'mu-select-linum)
(global-set-key (kbd "<left-margin> <drag-mouse-1>") 'mu-select-linum)

(if (fboundp 'prog-mode)
    (dolist (hook '(lisp-mode-hook
                    emacs-lisp-mode-hook
                    scheme-mode-hook
                    clojure-mode-hook
                    ruby-mode-hook
                    yaml-mode
                    python-mode-hook
                    shell-mode-hook
                    php-mode-hook
                    css-mode-hook
                    haskell-mode-hook
                    caml-mode-hook
                    nxml-mode-hook
                    crontab-mode-hook
                    perl-mode-hook
                    tcl-mode-hook
                    javascript-mode-hook
                    scala-mode-hook
                    web-mode-hook))
      (add-hook hook 'linum-on)))

(provide 'init-linum)
;;; init-linum.el ends here
