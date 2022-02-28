;; package.el
(require 'package)

;; パッケージ追加
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

;; 初期化
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
      ;;(set-face-foreground 'whitespace-space "gray60")
      ;;(set-face-background 'whitespace-space "gray97")
      ;; ファイル先頭と末尾の空行
      ;;(set-face-background 'whitespace-empty "gray95")
      ;; 改行
      ;;(set-face-foreground 'whitespace-newline "gray70")
      ;; タブ
      ;;(set-face-foreground 'whitespace-tab "gray60")
      ;;(set-face-background 'whitespace-tab "gray97")
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
      ;; (global-whitespace-mode 1)
      ))

;;
;; Emacs common setting
;;
;; 日本語対応、文字コードをutf-8に
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; Ricty Diminished
(set-fontset-font
 t 'japanese-jisx0208
 (font-spec :family "Ricty"))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq custom-theme-directory "~/.emacs.d/themes")
(load-theme 'zenburn t)


;; (define-key global-map (kbd "C-h") 'delete-backward-char) ; 削除
;; (define-key global-map (kbd "C-z") 'undo) ; undo

;; コメントアウト
(global-set-key (kbd "C-;") 'commentout-one-line)
(defun commentout-one-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

;; タブエディタ化
(tabbar-mode 1)
(setq tabbar-buffer-groups-function nil)
;; (setq tabbar-use-images nil)

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

;; "y or n" 選択
(fset 'yes-or-no-p 'y-or-n-p)

;; 括弧を色付け
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; 現在行をハイライト
(global-hl-line-mode)

;; 自動補完機能
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (global-auto-complete-mode t)

(add-hook 'after-init-hook #'global-flycheck-mode)
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
 '(package-selected-packages (quote (tabbar js2-mode flycheck rainbow-delimiters)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty Diminished Discord" :foundry "PfEd" :slant normal :weight normal :height 132 :width normal)))))
