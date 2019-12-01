;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)
(package! org-pomodoro)

(package! prettier-js)

(package! hoon-mode :recipe (:host github :repo "liam-fitzgerald/hoon-mode.el" :branch "lang-server"))

(package! org-cliplink)
