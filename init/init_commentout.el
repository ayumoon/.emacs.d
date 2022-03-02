;;
;; コメントアウト
;;

(defun commentout-or-uncomment-line-or-region ()
  "comment or uncomment current line or region"
  (interactive)
  (if (region-active-p) (comment-dwim nil)
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(global-set-key (kbd "C-;") 'commentout-or-uncomment-line-or-region)
