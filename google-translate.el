;;; google-translate.el -*- lexical-binding: t; -*-

(defvar text-to-translate ""
  "Holds the text to be translated.")

(defun evil-google-translate--block-line(beg end)
  "Get current line from the block and append it to the translaton text."
  (setq text-to-translate
        (concat text-to-translate
                " " (buffer-substring-no-properties beg end))))

(evil-define-operator evil-google-translate (beg end type)
  "Evil operator: translate using *google-translator* package"
  :move-point nil
  (interactive "<R>")
  (setq text-to-translate "")
  (if (eq type 'block)
      (evil-apply-on-block 'evil-google-translate--block-line beg end nil)
    (setq text-to-translate (buffer-substring-no-properties beg end)))
  (let* ((source-language (google-translate-read-source-language))
         (target-language (google-translate-read-target-language)))
    (google-translate-translate source-language target-language
                                text-to-translate)))

;; use 'gt' as operator key-combo:
(define-key evil-normal-state-map "gt" 'evil-google-translate)
(define-key evil-motion-state-map "gt" 'evil-google-translate)
(define-key evil-visual-state-map "gt" 'evil-google-translate)
