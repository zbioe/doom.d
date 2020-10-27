;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Iury Fukuda"
      user-mail-address "iuryfukuda@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "inconsolata" :size 26))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

(setq doom-leader-alt-key "C-,")
(setq doom-localleader-alt-key "M-,")

;; exclude from recent file list
(after! recentf
  (add-to-list 'recentf-exclude "Mail/iuryfukuda")
  (add-to-list 'recentf-exclude "Mail/pirata")
  (add-to-list 'recentf-exclude "/var"))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
(auto-fill-mode -1)

;; Bind new macro to somme commands
(global-set-key (kbd "M-p") 'mark-paragraph)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "C-h") 'delete-backward-char)

;; Add keys to scroll page by line
(global-set-key (kbd "M-[") 'scroll-up-line)
(global-set-key (kbd "M-]") 'scroll-down-line)

;; Wakatime global mode
(global-wakatime-mode)

;; disable auto completion without TAB
(setq company--auto-completion nil)

;; map recent files
(map! :leader
      :desc "recentf open files"
      "r" #'recentf-open-files)

(setq explicit-shell-file-name "/bin/bash")
(setq shell-file-name "bash")
(setenv "SHELL" shell-file-name)

;; load packages related to org-mode
(use-package org-pomodoro
  :commands org-pomodoro)

(use-package counsel-org-clock
  :commands (counsel-org-clock-context counsel-org-clock-history))

;; ace-window enlarge letters
(custom-set-faces!
  '(aw-leading-char-face
    :foreground "white" :background "black"
    :weight bold :height 1.0 :box (:line-width 8 :color "black")))

;; (setq ispell-aspell-data-dir "~/spell")
;; (setq ispell-aspell-dict-dir ispell-aspell-data-dir)
;; (setq ispell-aspell-dictionary-alist '())
;; (add-to-list 'ispell-aspell-dictionary-alist (ispell-aspell-find-dictionary "en_US"))
;; (add-to-list 'ispell-aspell-dictionary-alist (ispell-aspell-find-dictionary "pt_BR"))

;; (defun flyspell-to-portuguese()
;;   (interactive)
;;   (ispell-change-dictionary "pt_BR"))

;; (defun flyspell-to-english()
;;   (interactive)
;;   (ispell-change-dictionary "en_US"))

;; base64 encode without break lines
(defun base64-encode-region-prefix-arg (&rest _args)
  "Pass prefix arg as third arg to `base64-encode-region'."
  (interactive "r\nP"))

(advice-add 'base64-encode-region :before #'base64-encode-region-prefix-arg)
