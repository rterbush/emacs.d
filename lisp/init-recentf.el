(recentf-mode 1)
(setq recentf-max-saved-items 1000
      recentf-exclude '("/tmp/" "/ssh:"))

(setq recentf-keep '(file-remote-p file-readable-p))

(provide 'init-recentf)
