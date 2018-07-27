(dolist (dir (list
	      "/sbin"
	      "/usr/sbin"
	      "/bin"
	      "/usr/bin"
	      "/usr/local/bin"
	      (expand-file-name "~/bin")
	      (expand-file-name "~/.emacs.d/bin")
	      ))
   (when (and (file-exists-p dir) (not (member dir exec-path)))
        (setenv "PATH" (concat dir ":" (getenv "PATH")))
	   (setq exec-path (append (list dir) exec-path))))

;;multi-term
(setq load-path(cons "~/.emacs.d/inits" load-path))
(setq multi-term-program "/bin/bash")
(require 'multi-term)
;; C-c t で multi-term を起動する
(global-set-key "\C-ct" 'multi-term)
;;(setq multi-term-program shell-file-name
;;(setq ansi-term-color-vector [unspecified
;;							  "black" "red3" "green3" "yellow3"
;;                              "DeepSkyBlue" "magenta1" "cyan3" "white"])
