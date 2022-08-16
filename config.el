;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Iury Fukuda"
      user-mail-address "iuryfukuda@gmail.com")

(setq doom-font (font-spec :size 26))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

(setq doom-leader-alt-key "C-,")
(setq doom-localleader-alt-key "C-<")
;; Bind new macro to somme commands
(global-set-key (kbd "M-p") 'mark-paragraph)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "C-h") 'delete-backward-char)

(add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\):" . ":END:"))
(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))

;; (when (equal system-type 'gnu/linux)
;;   (setq racer-rust-src-path (getenv "RUST_SRC_PATH")))

;; (add-to-list 'exec-path (getenv "RUST_BIN"))
;; Add keys to scroll page by line
;;(global-set-key (kbd "M-[") 'scroll-up-line)
;;(global-set-key (kbd "M-]") 'scroll-down-line)
;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(use-package! org-roam
  :custom
  (org-roam-directory "~/roam")
  (org-roam-completion-everywhere t)
  (org-roam-completion-system 'default)
  (org-roam-dailies-directory "journal/"))

(require 'rustic)
(setq rustic-format-on-save nil)
(setq buffer-save-without-query t)
(setq rustic-format-trigger 'on-compile)
(setq compilation-read-command nil)
(setq doom-localleader-key "C-SPC")

(setq lsp-rust-analyzer-cargo-watch-command "clippy")
;; (push 'rustic-clippy flycheck-checkers)
(setq rustic-flycheck-clippy-params "--message-format=json")

  ;; (org-roam-capture-templates
  ;;   '(("d" "default" plain
  ;;      #'org-roam-capture--get-point
  ;;      "%?"
  ;;      :file-name "%<%Y%m%d%H%M%S>-${slug}"
  ;;      :head "#+title: ${title}\n"
  ;;      :unnarrowed t)
  ;;     ("ll" "link note" plain
  ;;      #'org-roam-capture--get-point
  ;;      "* %^{Link}"
  ;;      :file-name "Inbox"
  ;;      :olp ("Links")
  ;;      :unnarrowed t
  ;;      :immediate-finish)
  ;;     ("lt" "link task" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* TODO %^{Link}"
  ;;      :file-name "Inbox"
  ;;      :olp ("Tasks")
  ;;      :unnarrowed t
  ;;      :immediate-finish)))
  ;; (org-roam-dailies-capture-templates
  ;;   '(("d" "default" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* %?"
  ;;      :file-name "Journal/%<%Y-%m-%d>"
  ;;      :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
  ;;     ("t" "Task" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* TODO %?\n  %U\n  %a\n  %i"
  ;;      :file-name "Journal/%<%Y-%m-%d>"
  ;;      :olp ("Tasks")
  ;;      :empty-lines 1
  ;;      :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
  ;;     ("j" "journal" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* %<%I:%M %p> - Journal  :journal:\n\n%?\n\n"
  ;;      :file-name "Journal/%<%Y-%m-%d>"
  ;;      :olp ("Log")
  ;;      :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
  ;;     ("l" "log entry" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* %<%I:%M %p> - %?"
  ;;      :file-name "Journal/%<%Y-%m-%d>"
  ;;      :olp ("Log")
  ;;      :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
  ;;     ("m" "meeting" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* %<%I:%M %p> - %^{Meeting Title}  :meetings:\n\n%?\n\n"
  ;;      :file-name "Journal/%<%Y-%m-%d>"
  ;;      :olp ("Log")
  ;;      :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")))

  ;; :bind
  ;; (:map org-roam-mode-map
  ;;  ;; :desc "Org Roam" :ne "r r" #'org-roam
  ;;  ;; :desc "Org Roam Find File" :ne "r f" #'org-roam-find-file
  ;;  ;; :desc "Org Roam Find Date" :ne "r d" #'org-roam-dailies-find-date
  ;;  ;; :desc "Org Roam Find File" :ne "r c" #'org-roam-dailies-capture-today
  ;;  ("C-c n l"   . org-roam)
  ;;  ("C-c n f"   . org-roam-find-file)
  ;;  ("C-c n d"   . org-roam-dailies-find-date)
  ;;  ("C-c n c"   . org-roam-dailies-capture-today)
  ;;  ("C-c n C r" . org-roam-dailies-capture-tomorrow)
  ;;  ("C-c n t"   . org-roam-dailies-find-today)
  ;;  ("C-c n y"   . org-roam-dailies-find-yesterday)
  ;;  ("C-c n r"   . org-roam-dailies-find-tomorrow)
  ;;  ("C-c n g"   . org-roam-graph)
  ;;  :map org-mode-map
  ;;  (("C-c n i" . org-roam-insert))
  ;;  (("C-c n I" . org-roam-insert-immediate)))
(setq doom-font
      (cl-find-if #'doom-font-exists-p
                  '( "Noto Sans Mono:pixelsize=20"
                    "GohuGohu:pixelsize=14")))
                    

;; (setq doom-unicode-font
;;       (cl-find-if #'doom-font-exists-p
;;                   '( "Noto Sans Symbols:pixelsize=15")))

(setq smudge-transport 'connect)
