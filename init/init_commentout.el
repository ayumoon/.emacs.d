;;; init_comment --- Setting for Comment out
;;; Commentary:
;; コメントアウト設定

;;; Code:
(defun commentout-or-uncomment-line-or-region ()
  "Comment or uncomment current line or region."
  (interactive)
  (if (region-active-p) (comment-dwim nil)
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(global-set-key (kbd "M-;") 'commentout-or-uncomment-line-or-region)

;;; init_commentout.el ends here

