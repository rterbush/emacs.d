(require-package 'handlebars-mode)

(add-to-list 'auto-mode-alist '("\\.hbs$" . handlebars-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars$" . handlebars-mode))

(provide 'init-handlebars-mode)
