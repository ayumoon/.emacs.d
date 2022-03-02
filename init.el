;; package.el
;; (setq package-check-signature nil)
(require 'package)

;; パッケージ追加
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

;; 初期化
(package-initialize)

;; 設定ファイルの読み込み
(add-to-list 'load-path "~/.emacs.d/init")

(when window-system ; for GUI

      )

(unless window-system ; for GUI
    (load "init_nw");
      )

;;
;; Emacs common setting
;;

;; 日本語環境、文字コードはutf-8
(set-language-environment 'Japanese)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)  ; emacs -nw で文字化けしない
(setq default-file-name-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(prefer-coding-system 'utf-8-unix)

;; Ricty Diminished
(set-fontset-font
 t 'japanese-jisx0208
 (font-spec :family "Ricty"))

(define-key global-map (kbd "C-h") 'delete-backward-char) ; 削除
;; (define-key global-map (kbd "C-z") 'undo) ; undo

(load "init_theme") ; テーマの設定
(load "init_commentout") ; コメントアウトの設定
(load "init_tabbar") ; tabbarの設定
(load "init_company") ; companyの設定
(load "init_counsel") ; ivyの設定

(global-set-key (kbd "C-x g") 'magit-status)

(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; line numberの表示
(require 'linum)
(global-linum-mode 1)


;; 行の折り返し
;; (global-set-key (kbd "C-c l") 'toggle-truncate-lines)
;; (defun toggle-truncate-lines ()
;;   (interactive)
;;   (if truncate-lines
;;     (setq truncate-lines nil)
;;     (setq truncate-lines t))
;;   (recenter))

;; (menu-bar-mode 0)  ;; メニューバーを非表示
;; (tool-bar-mode 0)  ;; ツールバーを非表示
;; (scroll-nbar-mode -1)  ;; default scroll bar消去

;; 対応する括弧をハイライト
(show-paren-mode 1)
;; (setq show-paren-style 'mixed)

; 括弧を自動で補完する
(electric-pair-mode 1)

;; タイトルにフルパス表示
(setq frame-title-format "%f")

(setq inhibit-startup-message 0);; スタートアップメッセージを表示させない
(setq ring-bell-function 'ignore)  ;; エラー音をならなくする
(setq case-fold-search t)  ;; 大文字・小文字を区別しない

(setq make-backup-files nil)  ;; バックアップファイルを作成しない
(setq create-lockfiles nil)  ;; ロックファイルを作成しない
(setq auto-save-default nil)  ;; オートセーブファイルを作成しない

(auto-image-file-mode t)  ;; 画像ファイルを表示
(setq scroll-conservatively 1)  ;; スクロールは１行ごとに
(setq mouse-wheel-progressive-speed nil)  ;; スクロールの加速をやめる

(fset 'yes-or-no-p 'y-or-n-p) ;; "y or n" 選択

;; 括弧を色付け
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; 現在行をハイライト
;; (global-hl-line-mode)

(require 'flycheck)
(global-flycheck-mode 1)
;; (add-hook 'after-init-hook #'global-flycheck-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; goto-addr URLなどのリンクを読み取るようにする
(progn
  (add-hook 'prog-mode-hook 'goto-address-prog-mode)
  (add-hook 'text-mode-hook 'goto-address-mode))
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("296209339b86901f8760670bda8bc167327fd5028d44b0f87784c00d68cb04e3" default)))
 '(package-selected-packages
   (quote
    (counsel undo-tree gnu-elpa-keyring-update magit undo-propose company ivy tabbar js2-mode flycheck rainbow-delimiters)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty Diminished Discord" :foundry "PfEd" :slant normal :weight normal :height 132 :width normal)))))
