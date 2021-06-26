;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
    (add-to-list 'package-archives (cons "melpa" url) t))

;; get some ido goodness
(ido-mode 1)
(ido-everywhere 1)
;; in org-mode and magit
(setq org-completion-use-ido t)
(setq magit-completing-read-function 'magit-ido-completing-read)
(setq magit-last-seen-setup-instructions "1.4.0")
;; in M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; keep smex items in the mounted volume
(setq smex-save-file "~/.emacs.d/smex-items")

;; disable auto-save
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; move the backups directory
(setq backup-directory-alist `(("." . "~/.emacs-saves")))

;; no lock files jesus fucking christ
(setq create-lockfiles nil)

;; whitespace and long line highlighting
(require 'whitespace)
(setq whitespace-style '(face trailing lines-tail))
(set-face-attribute 'whitespace-trailing nil
                    :background "#585858")
(set-face-attribute 'whitespace-line nil
                    :background "#585858"
                    :foreground "#808080")
(global-whitespace-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(beacon-color "#d33682")
 '(custom-enabled-themes '(solarized-dark-high-contrast))
 '(custom-safe-themes
   '("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default))
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'light)
 '(org-agenda-files
   '("~/org/ideas.org" "~/org/reference.org" "~/org/inbox.org"))
 '(package-selected-packages
   '(graphql-mode gdscript-mode solidity-mode tide typescript-mode rust-mode solarized-theme color-theme-sanityinc-solarized rjsx-mode js2-mode deft toml-mode haskell-mode yaml-mode ssh-file-modes smex paredit markdown-mode magit ido-ubiquitous go-mode better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(setq js-indent-level 2)
(setq js2-strict-missing-semi-warning nil)
(setq js2-missing-semi-one-line-override t)
(setq-default typescript-indent-level 2)

;; org mode stuff
(require 'org)
(global-set-key "\C-ca" 'org-agenda)
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-refile-targets '(("~/org/reference.org" :maxlevel . 1)
                           ("~/org/ideas.org" :maxlevel . 1)))

(setq org-todo-keywords
      '((sequence "[ ](t)" "[?](w)" "|" "[X](d)" "[-](c)")))

(setq org-capture-templates
      '(
        ("t" "Task" entry (file+headline "~/org/inbox.org" "Tasks")
         "* [ ] %?\n %i")

        ("r" "Reference Note" entry (file+headline "~/org/inbox.org" "Reference Notes")
         "* %? %^G\n %i")

        ("i" "Idea" entry (file+headline "~/org/inbox.org" "Ideas")
         "* %? %^G\n %i")))

(define-key global-map "\C-cr"
  (lambda () (interactive) (org-capture nil "r")))
(define-key global-map "\C-ci"
  (lambda () (interactive) (org-capture nil "i")))
(define-key global-map "\C-ct"
  (lambda () (interactive) (org-capture nil "t")))

;; Keep auto-backups and auto-saves out of the way
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; set the magit key binding
(define-key global-map "\C-xg" 'magit-status)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; orgmode multiline bold
(setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n,\"")
