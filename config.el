;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;;; package --- Liam Private Config
;;;

(setq org-default-notes-file "~/org/gtd/inbox.org")
(setq org-agenda-files '("~/org/gtd/inbox.org" "~/org/gtd/tickler.org" "~/org/Documents/org/gtd/gtd.org"))
(setq org-directory "~/org")
(setq org-log-done 'note)
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/org/gtd/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/org/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))
(setq org-refile-targets '(("~/org/gtd/gtd.org" :maxlevel . 3)
                           ("~/org/gtd/someday.org" :level . 1)
                           ("~/org/gtd/tickler.org" :maxlevel . 2)))

(setq typescript-indent-level 2)
(setq display-line-numbers-type 'relative)



(setq twittering-use-master-password t)
(setq +mu4e-backend 'offlineimap)

(defun ng-switch-ext (ext)
  "Switch to file with extension EXT."
  (interactive "Mextension")
  (let*
      ((buffer-name (buffer-file-name))
       (split-file-name (split-string buffer-name "\\."))
       (new-file-name (string-join
                       (append (butlast split-file-name) (list ext))
                       ".")))
    (find-file new-file-name)))

(if (not (getenv "TERM_PROGRAM"))
    (setenv "PATH"
            (shell-command-to-string "source $HOME/.zshrc && printf $PATH")))

(after! rspec-mode
  (setq rspec-use-rvm nil))

;; (defcustom py-hide-show-keywords '(
;;                                   "class"    "def"    "elif"    "else"    "except"
;;                                    "for"      "if"     "while"   "finally" "try"
;;                                    "with"
;;                                   )
;;   "*Keywords that can be hiden by hide-show"
;;   :type '(repeat string)
;;   :group 'python)

;; (defcustom py-hide-show-hide-docstrings t
;;   "*Controls if doc strings can be hiden by hide-show"
;;   :type 'boolean
;;   :group 'python)


(defun make-orgcapture-frame ()
  "Create a new frame and run org-capture."
  (interactive) wv
  (make-frame '((name . "remember") (width . 80) (height . 16)
                (top . 400) (left . 300)
                (font . "-apple-Monaco-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
                ))
  (select-frame-by-name "remember")
  (org-capture))

(add-to-list 'exec-path "/usr/local/bin")
(getenv "PATH")
(setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH")))
;; Add support for HideShow
(eval-after-load "hideshow" '(add-to-list 'hs-special-modes-alist `(hoon-mode
                                       ,(rx (or "++" "("))
                                       ,(rx "::" )
                                       ,(rx "::" )
                                       nil nil)))

(eval-after-load "projectile"
 '(projectile-register-project-type 'hoon '("app" "mar" "sys" "lib")
                  :compile ""
                  :test "npm test"
                  :run "npm start"
                  :test-suffix ".spec"))

(add-hook 'hoon-mode-hook #'lsp)
;;

(eval-after-load "prettier-js" '(progn

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
                                  ))
