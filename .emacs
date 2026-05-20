;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; You must set these variables BEFORE calling (xclip-mode 1)
(with-eval-after-load 'xclip
  (setq xclip-method 'wl-copy)
  (setq xclip-program "wl-copy"))

(require 'xclip)
(xclip-mode 1)

(setq inhibit-startup-message t)
(menu-bar-mode -1)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(when (fboundp 'fringe-mode)
  (fringe-mode 0))

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'visual)
(setq display-line-numbers-current-absolute t)

(tooltip-mode -1)
(setq ring-bell-function 'ignore)
(setq initial-scratch-message "")

(delete-selection-mode t)

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-x C-z") 'suspend-frame)

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-q") 'delete-backward-char)
    (define-key map (kbd "M-q") 'backward-kill-word)
    map)
  "Keymap for my-keys-minor-mode.")

(define-minor-mode my-keys-minor-mode
  "This string is REQUIRED by Emacs, do not delete it."
  :init-value t
  :lighter " my-keys"
  :global t)

(my-keys-minor-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(cuda-mode dockerfile-mode ewal go-mode jtsx kotlin-mode magit
	       markdown-mode php-mode rust-mode typescript-mode
	       web-mode xclip yaml-mode))
 '(send-mail-function 'mailclient-send-it)
 '(warning-suppress-log-types '((native-compiler))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Force web-mode for React files
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(load-theme 'deeper-blue t)
