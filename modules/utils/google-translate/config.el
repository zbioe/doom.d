;;; utils/google-translate/config.el -*- lexical-binding: t; -*-

(require 'google-translate-smooth-ui)

(map! :leader :desc "google translate" :prefix "g"
       :desc "at point"                  "."  #'google-translate-at-point
       :desc "smooth translate"          "s"  #'google-translate-smooth-translate
       :desc "query translate"           "q"  #'google-translate-query-translate
       :desc "query translate reverse"   "r"  #'google-translate-query-translate-reverse)

(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "pt")
(setq google-translate-translation-directions-alist
      '(("en" . "pt") ("pt" . "en")))
