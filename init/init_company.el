;;
;; companyの設定
;;

(require 'company)
(global-company-mode)

(setq company-idle-delay 0.3) ; 初期値は 0.5
(setq company-minimum-prefix-length 3) ; 初期値は 4
;; (add-hook 'after-init-hook 'company-mode)
