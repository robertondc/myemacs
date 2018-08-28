
(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-not))
                    (dos (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when  (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-ag-r helm helm-ag ## tabbar tabbar-ruler nyan-mode neotree multiple-cursors))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(package-initialize)


(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

(require 'nyan-mode)
(nyan-mode 1)

(recentf-mode 1) ; keep a list of recently opened files
;; set F7 to list recently opened file
(global-set-key (kbd "<f7>") 'recentf-open-files)

(global-set-key "%" 'match-paren)

(defun match-paren (arg)
"Go to the matching paren if on a paren; otherwise insert %."
(interactive "p")
(cond ((looking-at "\\s(") (forward-list 1) (backward-char 1))
      ((looking-at "\\s)") (forward-char 1) (backward-list 1))
      (t (self-insert-command (or arg 1)))))

(setq visible-bell 1)
(setq x-select-enable-clipboard t)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

(setq column-number-mode t)

(show-paren-mode 1)

(desktop-save-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq tabbar-ruler-global-tabbar t)
(global-set-key (kbd "C-{") 'tabbar-backward-tab)
(global-set-key (kbd "C-}") 'tabbar-forward-tab)

(require 'tabbar-ruler)

(global-set-key (kbd "C-S-f") 'helm-ag)
