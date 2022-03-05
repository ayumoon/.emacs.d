;;; init_font.el --- Setting for font
;;; Commentary:

;;; Code:

;; Ricty Diminished
(add-to-list 'default-frame-alist '(font . "Ricty Diminished"))
(add-to-list 'default-frame-alist '(height . 132))

(set-fontset-font
 t 'japanese-jisx0208
 (font-spec :family "Ricty Diminished"))

;;; init_font.el ends here

