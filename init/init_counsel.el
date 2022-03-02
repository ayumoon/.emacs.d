;;
;; counselの設定
;;

(counsel-mode 1)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (setq counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))

;; ivy設定
(ivy-mode 1)
(setq ivy-height 10)
(setq ivy-use-virtual-buffers t)
(setq enabel-recursive-minibuffers t)
(setq ivy-count-format "(%d/%d) ")
(define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)


;; swiper設定
(global-set-key "\C-r" 'swiper)

