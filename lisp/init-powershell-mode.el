;;; package --- Summary:
;;; Commentary:
;;; Code:
(require 'powershell-mode)

(autoload 'powershell-mode "powershell-mode" "Mode PowerShell" t)
(add-to-list 'auto-mode-alist '("\\.ps[12]?$" . powershell-mode))

(provide 'init-powershell-mode)
;;; init-powershell-mode.el ends here
