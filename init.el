;;; package.el
(require 'package)

;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "https://marmalade-repo.org/packages/"))
;; Orgを加追
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(package-initialize)

;; for CUI
(if (not window-system)
    (progn
      (defface hlline-face
	'((((class color)
	    (background dark))
	   (:background "gray20"))
	  (((class color)
	    (background light))
	   (:background "black"))
	  (t
	   ()))
	"*Face used by hl-line.")
      (setq hl-line-face 'hlline-face)
      ;; (setq hl-line-face 'underline) ; 下線
      (global-hl-line-mode)

      (require 'whitespace)
      ;; 空白
      (set-face-foreground 'whitespace-space "gray50")
      (set-face-background 'whitespace-space nil)
      ;; タブ
      (set-face-foreground 'whitespace-tab "gray50")
      (set-face-background 'whitespace-tab nil)
      (setq whitespace-style
	    '(face           ; faceで可視化
	      tabs           ; タブ
	      tab-mark       ; タブ表示マッピング
	      spaces         ; 空白
	      space-mark     ; 空白表示のマッピング
	      ))
      ;; 発動
      (global-whitespace-mode 1)
      ))

;; for GUI
(if (window-system)
    (progn
      ;; line numberの表示
      (require 'linum)
      (global-linum-mode 1)

      (require 'whitespace)
      ;; 空白
      (set-face-foreground 'whitespace-space "gray60")
      (set-face-background 'whitespace-space "gray97")
      ;; ファイル先頭と末尾の空行
      ;;(set-face-background 'whitespace-empty "gray95")
      ;; 改行
      ;;(set-face-foreground 'whitespace-newline "gray70")
      ;; タブ
      (set-face-foreground 'whitespace-tab "gray60")
      (set-face-background 'whitespace-tab "gray97")
      ;; ???
      ;;(set-face-foreground 'whitespace-trailing "gray95")
      ;;(set-face-background 'whitespace-hspace "gray70")
      (setq whitespace-style
	    '(face           ; faceで可視化
	      ;;trailing       ; 行末
	      tabs           ; タブ
	      ;;empty          ; 先頭/末尾の空行
	      spaces         ; 空白
	      space-mark     ; 表示のマッピング
	      new-line       ; 改行
	      tab-mark
	      ))
      ;; 発動
      (global-whitespace-mode 1)
      ))

;;
;; Emacs common setting
;;
;; 日本語対応、文字コードをutf-8に
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(menu-bar-mode 0)  ;; メニューバーを非表示
;;(tool-bar-mode 0)  ;; ツールバーを非表示
;; (scroll-nbar-mode -1)  ;; default scroll bar消去
(show-paren-mode 1)  ;; 対応する括弧をハイライト
(setq frame-title-format "%f")  ;; タイトルにフルパス表示
(setq inhibit-startup-message 0)  ;; スタートアップメッセージを表示させない
(setq ring-bell-function 'ignore)  ;; エラー音をならなくする
(setq case-fold-search t)  ;; 大文字・小文字を区別しない
(setq make-backup-files nil)  ;; バックアップファイルを作成しない
(setq create-lockfiles nil)  ;; ロックファイルを作成しない
(setq auto-save-default nil)  ;; オートセーブファイルを作成しない
;;(setq delete-auto-save-files t)  ;; 終了時にオートセーブファイルを削除
(auto-image-file-mode t)  ;; 画像ファイルを表示
(setq scroll-conservatively 1)  ;; スクロールは１行ごとに
(setq mouse-wheel-progressive-speed nil)  ;; スクロールの加速をやめる

;; 括弧を色付け
;; (require 'rainbow-delimiters)
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; 自動補完機能
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (global-auto-complete-mode t)

;; goto-addr URLなどのリンクを読み取るようにする
(progn
  (add-hook 'prog-mode-hook 'goto-address-prog-mode)
  (add-hook 'text-mode-hook 'goto-address-mode))
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(package-selected-packages (quote (auto-compile rainbow-delimiters)))
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
