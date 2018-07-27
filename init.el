;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "/home/takuya/.emacs.d/inits")
(put 'upcase-region 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(color-theme ## yasnippet pyflakes jedi python-mode py-autopep8 multi-term init-loader))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; スタートアップメッセージを表示させない
(setq inhibit-startup-message 1)
;; ターミナルで起動したときにメニューを表示しない
(if (eq window-system 'x)
    (menu-bar-mode 1) (menu-bar-mode 0))
(menu-bar-mode nil)
;; scratchの初期メッセージ消去
(setq initial-scratch-message "")
;; font
(set-face-attribute 'default nil
					:family "Menlo"
					:height 160)
;;ファイルを開くときに大文字小文字の違いを無視
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
;;行末の改行も削除
(setq kill-whole-line t)
;;複数ウィンドウ禁止
(setq ns-pop-up-frames nil)
;; line numberの表示
(require 'linum)
(global-linum-mode 1)
;; tabサイズ
(setq default-tab-width 4)
;; メニューバーを非表示
(menu-bar-mode 0)
;; ツールバーを非表示
(tool-bar-mode 0)
;; default scroll bar消去
(scroll-bar-mode -1)
;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)
;; 対応する括弧をハイライト
(show-paren-mode 1)
;; リージョンのハイライト
(transient-mark-mode 1)
;; タイトルにフルパス表示
(setq frame-title-format "%f")


;;current directory 表示
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
		  (cdr ls))))
;;Window Coordinate with Display             
(setq default-frame-alist
      (append (list
			   '(foreground-color . "white")
			   '(background-color . "black")
			   ;;''
			   '(top . 0)    ; フレームの Y 位置(ピクセル数)
			   '(left . 0)    ; フレームの X 位置(ピクセル数)
			   '(width . 400)    ; フレーム幅(文字数)
			   '(height . 450)   ; フレーム高(文字数)
				 )
			  default-frame-alist)
	  )
;;Movement Window
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)


(set-frame-parameter (selected-frame) 'alpha '(75 35))
(set-face-foreground 'which-func "deep sky blue")
(set-face-foreground 'term-color-blue "magenta")
;;(set-face-foreground 'change-log-acknowledgment "red")


