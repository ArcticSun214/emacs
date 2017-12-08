(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(setq package-list
      '(evil
	back-button
	highlight
	evil-search-highlight-persist))

;;; The Following are copied from
;;; https://stackoverflow.com/questions/31079204/emacs-package-install-script-in-init-file
;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; Settings set from withing emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes nil)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages (quote (multi-term org evil)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; evil mode
;; Persistent highlights on evil mode search
(setq evil-search-module 'evil-search)

;; Enable evil mode
(require 'evil)
(evil-mode 1)

;; Enables evil mode for other modes
(setq evil-emacs-state-modes nil)
(setq evil-insert-state-modes nil)
(setq evil-motion-state-modes nil)

;; Make searches case sensitive
(setq evil-ex-search-case 'sensitive)

;; Back Button
(require 'back-button)
(back-button-mode 1)

;; Paste to cursor position
(setq mouse-yank-at-point t)

;;; From https://emacs.stackexchange.com/questions/30137/paste-windows-clipboard-with-shift-insert-but-not-by-yanking
;; Paste from clipboard
(global-set-key (kbd "<S-Insert>") #'clipboard-yank)

;; Display line numbers
(global-linum-mode 1)

;; Switch to previous buffer
(global-set-key (kbd "M-o") 'mode-line-other-buffer)

;; Disable 'K' key binding. This was determined by "C-h K"
(define-key evil-motion-state-map "K" nil)
