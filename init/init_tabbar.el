;;
;; tabbarの設定
;;

(require 'tabbar)
(tabbar-mode 1)

(tabbar-mwheel-mode nil) ; マウスホイール操作無効
(setq tabbar-buffer-groups-function nil) ; ブループ化無効
;; (setq tabbar-use-images nil) ; 画像を無効
;; (setq tabbar-separator '(2.0)) ; タブのセパレーターの長さ

;; キー操作
(global-set-key (kbd "C-.") 'tabbar-forward-tab)
(global-set-key (kbd "C-,") 'tabbar-backward-tab)
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)

;; 左側のボタンを消す
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; 表示するバッファ
(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
		      ; *scratch*バッファは表示する
                     ((equal "*scratch*" (buffer-name b)) b)
		      ; それ以外の * で始まるバッファは表示しない
                     ((char-equal ?* (aref (buffer-name b) 0)) nil)
                     ((buffer-live-p b) b)))
                (buffer-list))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
