(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/style")
;;(load "column-enforce-mode.el")
(defadvice show-paren-function
    (after show-matching-paren-offscreen activate)
        "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
	(interactive)
	(let* ((cb (char-before (point)))
	       (matching-text (and cb
				   (char-equal (char-syntax cb) ?\) )
				   (blink-matching-open))))
	          (when matching-text (message matching-text))))

;;;; Use Shift+Arrow to move to window
;; (when (fboundp 'windmove-default-keybindings)
;;   (windmove-default-keybindings))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(global-font-lock-mode t nil (font-lock))
 '(set-default-coding-systems (quote utf-8))
 '(set-language-environment "UTF-8")
 '(show-paren-mode t nil (paren))
 '(user-mail-address "james.dassoulas@cern.ch"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((((class color) (background light)) :foreground "red"))))
(setq ispell-program-name "aspell")
(setq-default indent-tabs-mode nil)
(setq backup-directory-alist `(("." . "~/.saves")))
;;(setq mode-require-final-newline nil)
 (set-default 'truncate-lines t)
(delete-selection-mode t)
(global-set-key [?\C-x ?j] 'ispell)
(global-set-key [?\C-x ?g] 'goto-line)
(global-set-key [?\C-x ?r] 'indent-region)
;;(global-set-key [?\C-h] 'backward-delete-char)
(global-set-key [?\C-x ?a] 'beginning-of-buffer)
(global-set-key [?\C-x ?e] 'end-of-buffer)
(global-set-key [?\C-w] 'kill-ring-save)
(global-set-key [?\C-x ?w] 'kill-region)
(global-set-key [?\C-x ?d] 'ediff-buffers)
(global-set-key [?\C-x ?p] 'goto-match-paren)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-c <left>") 'previous-buffer)
(global-set-key (kbd "C-c <right>") 'next-buffer)

;; (define-ibuffer-op replace-string (from-str to-str)
;;   "Perform a `replace-string' in marked buffers."
;;   (:interactive
;;    (let* ((from-str (read-from-minibuffer "Replace string: "))
;; 	  (to-str (read-from-minibuffer (concat "Replace " from-str
;; 						" with: "))))
;;      (list from-str to-str))
;;    :opstring "replaced in"
;;    :complex t
;;    :modifier-p :maybe)
;;   (save-window-excursion
;;     (switch-to-buffer buf)
;;     (save-excursion
;;       (goto-char (point-min))
;;       (let ((case-fold-search ibuffer-case-fold-search))
;; 	(while (search-forward from-str nil t)
;; 	  (replace-match to-str nil t))))
;;         t))
(defun js-no-newline ()
  (setq mode-require-final-newline nil)
  (setq require-final-newline nil))

(add-hook 'js-mode-hook          'js-no-newline)

(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))
(defun goto-match-paren (arg)
    "Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
    (interactive "p")
    (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	  ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	          (t (self-insert-command (or arg 1)))))
(defun my-tab-fix ()
 (global-set-key [?\C-i] 'indent-or-expand))

(add-hook 'c-mode-hook          'my-tab-fix)
(add-hook 'sh-mode-hook         'my-tab-fix)
(add-hook 'emacs-lisp-mode-hook 'my-tab-fix)
(add-hook 'c-mode-common-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (delete-trailing-whitespace))))))
;; ;; Customizing colors used in diff mode
;; (defun custom-diff-colors ()
;;   "update the colors for diff faces"
;;   (set-face-attribute
;;    'diff-added nil :foreground "blue")
;;   (set-face-attribute
;;    'diff-removed nil :foreground "red")
;;   (set-face-attribute
;;    'diff-changed nil :foreground "purple"))
;; (eval-after-load "diff-mode" '(custom-diff-colors))

(add-hook 'ediff-load-hook
               (lambda ()
                 (set-face-foreground
                   ediff-current-diff-face-A "black")
                 (set-face-background
                   ediff-current-diff-face-A "green")
                 (set-face-foreground
                   ediff-fine-diff-face-A "white")
                 (set-face-background
                   ediff-fine-diff-face-A "red")
                 (set-face-foreground
                   ediff-current-diff-face-B "white")
                 (set-face-background
                   ediff-current-diff-face-B "red")
                 (set-face-foreground
                   ediff-fine-diff-face-B "black")
                 (set-face-background
                   ediff-fine-diff-face-B "green")
                 (make-face-italic
                   ediff-current-diff-face-B)))


;;;###dont-autoload
(setq auto-mode-alist
      ;; matches files
      ;;	- whose path contains /bin/, but not directories
      (cons '("/bin/" . sh-or-other-mode)
	    ;;	- that have a suffix .sh or .shar (shell archive)
	    ;;	- that contain resources for the various shells
	    ;;	- startup files for X11
	    (cons '("\\.sh$\\|\\.shar$\\|/\\.\\(profile\\|bash_profile\\|login\\|bash_login\\|logout\\|bash_logout\\|bashrc\\|t?cshrc\\|xinitrc\\|startxrc\\|xsession\\)$" . sh-mode)
		  auto-mode-alist)))
(setq column-number-mode t)
(setq column-enforce-comments nil)
