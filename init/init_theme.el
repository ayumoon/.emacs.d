;;
;; テーマの設定
;;

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq custom-theme-directory "~/.emacs.d/themes")

;; GUIのとき
(when window-system
  (load-theme 'zenburn t)
  (global-hl-line-mode t) ; 現在行に色をつける
  )

;; CUI時
(unless window-system
  ;; (load-theme 'manoj-dark t)
  (setq hl-line-face 'underline) ; 現在行に下線
  (global-hl-line-mode)
  )
