;;; package --- Summary:
;;; Commentary:

;;; Code:
(autoload 'powershell-mode "powershell-mode" "Mode PowerShell" t)
(add-to-list 'auto-mode-alist '("\\.ps[12]?$" . powershell-mode))

(add-hook 'powershell-mode-hook
          (setq powershell-indent 4))

(provide 'init-powershell-mode)
;;; init-powershell-mode.el ends here
