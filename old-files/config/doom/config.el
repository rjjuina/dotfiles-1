;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; DO NOT EDIT THIS FILE DIRECTLY
;; This is a file generated from a literate programing source file located at
;; https://gitlab.com/zzamboni/dot-doom/-/blob/master/doom.org
;; You should make any changes there and regenerate it from Emacs org-mode
;; using org-babel-tangle (C-c C-v t)

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; (setq user-full-name "John Doe"
;;      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq user-full-name "XiongChenYu"
      user-mail-address "xiongchenyu6@gmail.com")

(setq
      doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-unicode-font (font-spec :family "DejaVu Sans" :size 14)
      doom-modeline-github t
      doom-modeline-major-mode-color-icon t
      doom-modeline-enable-word-count t
      ;; doom-modeline-minor-modes t
      doom-modeline-indent-info t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(fringe-mode '8)
(menu-bar-mode -1)

(setq highlight-indent-guides-mode t)

;; Set up the visible bell
(setq visible-bell t)

(global-auto-revert-mode)
;; (setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar")

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq display-line-numbers-type 'relative)

(setq url-debug t)

(setq-default fill-column 120)

(setq +lookup-open-url-fn #'+lookup-xwidget-webkit-open-url-fn)

(after! dash-docs
  (setq dash-docs-browser-func #'+lookup-xwidget-webkit-open-url-fn))

;; (add-hook 'emacs-startup-hook (lambda () (normal-erase-is-backspace-mode +1)))

(if (not (display-graphic-p)) (setq normal-erase-is-backspace t))
;;
(setq mouse-avoidance-mode 'banish)

(after! lsp (setq lsp-ui-doc-use-webkit t
                       lsp-ui-doc-max-height 999
                       lsp-ui-doc-max-width 999
                       ))

(+global-word-wrap-mode)

(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq compilation-read-command nil)
(setq confirm-kill-emacs nil)

(setq pixel-scroll-precision-mode t)

(require 'eieio-compat)
(general-auto-unbind-keys :off)
(remove-hook 'doom-after-init-modules-hook #'general-auto-unbind-keys)
(evil-set-initial-state 'grep-mode 'normal)

;; (setq font-lock-maximum-decoration '((c++-mode . 2) (c-mode . 2) (rustic-mode . 2) (t . t)))

;; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-[") 'keyboard-escape-quit)

;; (map!
;;  ;; Easier window movement
;;  :n "C-h" 'evil-window-left
;;  :n "C-j" 'evil-window-down
;;  :n "C-k" 'evil-window-up
;;  :n "C-l" 'evil-window-right
;;  :n "C-q" 'delete-window

;;  (:map evil-treemacs-state-map
;;   "C-l" 'evil-window-right)
;;  )

(setq centaur-tabs-set-icons t)
(define-key evil-normal-state-map (kbd "g t")
  'centaur-tabs-forward)
(define-key evil-normal-state-map (kbd "g T")
  'centaur-tabs-backward)
(define-key evil-normal-state-map (kbd "C-M-f")
  'scroll-other-window)
(define-key evil-normal-state-map (kbd "C-M-b")
  'scroll-other-window-down)

;; , ', ,@ must be used inside `() directly otherwise you should use apply func
(defmacro set-evil-number-keymap (key-set func &rest modes)
    `(progn
       ,@(-map
          (lambda (mode)
            `(define-key ,(intern (concat "evil-" mode "-state-map")) (kbd ,key-set)
               ',(intern (concat "evil-numbers/" func)))) `(,@modes))))

(eval
 (macroexpand-1
  '(set-evil-number-keymap "C-a" "inc-at-pt" "normal" "insert")))
;; (eval
;;  (macroexpand
;;   '(set-evil-number-keymap "C-x" "dec-at-pt" "normal" "insert")))

(setq auth-sources '("~/.authinfo.gpg")
      auth-source-cache-expiry nil)

(setq message-send-mail-function 'smtpmail-send-it
  smtpmail-stream-type 'starttls
  smtpmail-default-smtp-server "smtp.gmail.com"
  smtpmail-smtp-server "smtp.gmail.com"
  smtpmail-smtp-service 587)

(setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t"
      org-msg-startup "hidestars indent inlineimages"
      org-msg-greeting-fmt "\nHi%s,\n"
      org-msg-convert-citation t
      org-msg-signature "
Regards,

#+begin_signature
*Xiong ChenYu*
/One Emacs to rule them all/
#+end_signature")

(after! mu4e
  (setq mu4e-attachment-dir "~/Downloads/"
        mu4e-update-interval 100
        mu4e-view-show-images t
        mu4e-view-prefer-html t
        mu4e-display-update-status-in-modeline t
        ))

(setq +mu4e-gmail-accounts '("xiongchenyu6@gmail.com" . "/xiongchenyu6"))
;; don't need to run cleanup after indexing for gmail
;(setq mu4e-index-cleanup nil
      ;mu4e-index-lazy-check t)

  (my-fetch-password :user "freemanX" :host "irc.libera.chat")
  )

(set-irc-server! "irc.libera.chat"
  '(:tls t
    :port 6697
    :nick "freemanX"
    :sasl-username "freemanX"
    :sasl-password my-nickserv-password
    :channels ("#emacs")))

(require 'eacl)
(define-key evil-insert-state-map (kbd "C-x C-g") 'eacl-complete-multiline)

(define-key evil-insert-state-map (kbd "C-n") 'company-select-next-or-abort)
(define-key evil-insert-state-map (kbd "C-p") 'company-select-previous-or-abort)

(after!
  company
  ;; (setq company-minimum-prefix-length
  ;;       2
  ;;       company-tooltip-limit
  ;;       20
  ;;       company-transformers '(company-sort-by-backend-importance)
  ;;       )
  (define-key! company-active-map
    "TAB" nil
    [tab] nil))


(after! yasnippet
  (add-to-list 'yas-snippet-dirs (expand-file-name "~/.snippets"))
  (yas-reload-all)
  (setq yas-wrap-around-region t)
  )

(after! auto-yasnippet
  (setq aya-persist-snippets-dir "~/.snippets")
  )
;; (use-package! company-tabnine
;;   :after company
;;   :config
;;   (set-company-backend! '(sql-mode conf-mode) '(company-yasnippet :with company-capf :with company-tabnine))
;;   )

(setq lsp-file-watch-threshold nil)
(setq lsp-auto-guess-root t)

(setq lsp-ui-doc-use-webkit t)
(setq lsp-ui-doc-max-height 99)
(setq lsp-ui-doc-max-width 9999)

(setq-default lsp-semantic-tokens-enable t)
(setq-default lsp-semantic-tokens-mode t)

(add-to-list '+debugger--dap-alist '((:lang clojure +lsp) :after clojure-mode :require dap-chrome))

(add-to-list '+debugger--dap-alist '((:lang python +lsp) :after python-mode :require dap-python))

(add-to-list '+debugger--dap-alist '((:lang go +lsp) :after go-mode :require dap-go))

(add-to-list '+debugger--dap-alist '((:lang cc +lsp) :after cc-mode :require dap-cpptools))
(setq
 gdb-many-windows t
 gdb-show-main t)

(after! rustic-mode
  (require 'dap-gdb-lldb)
  )

(set-rotate-patterns! 'rustic-mode
    :symbols '(("Ok" "Err")))
;; (after! rotate-text
;;   (pushnew! rotate-text-symbols '("Ok" "Err")))

(setq magit-repository-directories '(("~/workspace" . 2)))

(after! lsp-clients
  (set-lsp-priority! 'clangd 1))

(after! cc-mode
  (setq semantic-mode 1)
  (map!
   :map (c-mode-map c++-mode-map)
   (:localleader
    :n "r" #'srefactor-refactor-at-point
    ))
  )

(after! projectile
  (projectile-register-project-type 'cmake '("CMakeLists.txt")
                                    :project-file "CMakeLists.txt"
                                    :configure #'projectile--cmake-configure-command
                                    :compile #'projectile--cmake-compile-command
                                    :test #'projectile--cmake-test-command
                                    :run "./build/main"
                                    :install "cmake --build build --target install"
                                    :package "cmake --build build --target package")

  (setq projectile-project-search-path '(("~/workspace/" . 1) ("~/git/". 1) ("~/private/".  1) ("~/go/src/" . 2)))
  )

(add-hook! 'cmake-mode-hook #'lsp-deferred)

(setq haskell-process-type 'cabal-new-repl)
(after! haskell-mode
  (map!
   :map haskell-mode-map
   ;; this is set to use cabal for dante users and stack for intero users:
   (:localleader
    (:prefix ("r" . "repl")
     :n "l" #'haskell-process-load-or-reload
     :n "d" #'haskell-process-reload-devel-main )
    )))

(after! ob-ammonite
(setq ob-ammonite-prompt-str "scala>")
)

;(set-lookup-handlers! 'emacs-lisp-mode :documentation #'helpful-at-point)

;(set-lookup-handlers! 'emacs-library-link :documentation )

(after! lispy
  (setq lispy-outline "^;; \\(?:;[^#]\\|\\*+\\)"
        lispy-outline-header ";; "
        lispy-ignore-whitespace t)
  (map! :map lispy-mode-map
        :i "M-)" #'lispy-parens-auto-wrap
        :i "M-}" #'lispy-braces-auto-wrap
        :i "M-]" #'lispy-brackets-auto-wrap
        :i "_" #'special-lispy-different
        :i [remap delete-backward-char] #'lispy-delete-backward)
  )

(after! evil-mc
  (add-to-list 'evil-mc-incompatible-minor-modes 'lispy-mode))

(setq org-log-done "time"
      org-log-done-with-time 't)
(setq org-catch-invisible-edits 'show-and-error)

(setq org-cycle-separator-lines 0)

(setq org-startup-with-inline-images t)

(setq org-hugo-auto-set-lastmod 't
      org-hugo-section "posts"
      org-hugo-suppress-lastmod-period 43200.0
      org-hugo-export-creator-string "Emacs 28.05 (Org mode 9.4 + ox-hugo + XiongChenYu)"
      )
(setq rmh-elfeed-org-files '("~/Dropbox/Org/fun/elfeed.org"))

(setq deft-directory "~/Dropbox/Org")

(setq org-directory "~/Dropbox/Org"
      org-agenda-files
      (list org-directory)
      org-agenda-diary-file
      (concat org-directory "/todo.org")
      org-default-notes-file
      (concat org-directory "/notes.org"))

(setq org-src-preserve-indentation t
      org-return-follows-link t)

(map!
 :map (org-mode-map)
 :i "<S-return>" #'org-insert-subheading)

(advice-remove #'org-export-output-file-name #'+org*export-output-file-name)

(after! ox-latex
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (setq org-latex-listings 'minted)
  (add-to-list 'org-latex-packages-alist '("" "geometry"))
)

(setq org-src-fontify-natively t)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
    "bibtex %b"
    "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(setq org-html-htmlize-output-type 'css)

(after! org (require 'ox-gfm nil t))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("cpp" . "src cpp :namespaces std :flags  -std=c++20 :includes <iostream> <vector>"))
(add-to-list 'org-structure-template-alist '("cl" . "src C :includes <stdlib.h> <stdio.h>"))
(add-to-list 'org-structure-template-alist '("ts" . "src typescript"))
(add-to-list 'org-structure-template-alist '("js" . "src javascript"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("go" . "src go"))
(add-to-list 'org-structure-template-alist '("rust" . "src rust"))
(add-to-list 'org-structure-template-alist '("yaml" . "src yaml"))
(add-to-list 'org-structure-template-alist '("json" . "src json"))

(setq org-roam-directory "~/Dropbox/Notes/"
      org-roam-capture-templates
      '(("d" "default" plain "%?"
          :target (file+head "${slug}.org" "#+title: ${title}\n#+date: %U\n")
          :unnarrowed t
          :immediate-finish t)))

(after! org-roam
  (setq +org-roam-open-buffer-on-find-file nil)
  )

(setq! citar-bibliography '("~/Dropbox/references.bib"))
(setq! citar-library-paths '("~/Dropbox/bibiography/")
       citar-notes-paths '("~/Dropbox/Notes/"))

(use-package! org-auto-tangle
 ; :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(after! org
  (require 'ox-moderncv nil t)
  (require 'ox-hugocv nil t)
  )
(defun resume-export ()
  "Export the resume with moderncv latex module to pdf"
  (interactive)
  (let ((name (file-name-sans-extension (buffer-name))))
    (progn
      (org-export-to-file 'moderncv (concat name ".tex"))
      (org-latex-compile (concat name ".tex"))))
  )

(defun resume-hugo-export ()
  "Export the resume with moderncv to hugo md"
  (interactive)
  (let ((name (file-name-sans-extension (buffer-name)))
        (org-export-exclude-tags '("noexport" "latexonly")))
      (org-export-to-file 'hugocv (concat name ".md")))
  )

(setq lsp-pyls-plugins-autopep8-enabled nil)
(setq lsp-pyls-plugins-yapf-enabled t)
(after! dap-mode (setq dap-python-executable "python3"))

(setq plantuml-default-exec-mode 'jar)

(define-derived-mode prometheus-v2-rules-mode yaml-mode "prometheus rule" ())

(add-to-list 'auto-mode-alist '("\\.rules$" . prometheus-v2-rules-mode))

(require 'flycheck)
(flycheck-define-checker prometheus-v2-promtool-rules
  "A prometheus rules checker using promtool.
  See URL `https://github.com/prometheus/prometheus/tree/master/cmd/promtool'."
  :command ("promtool" "check" "rules" (eval (expand-file-name (buffer-file-name))))
  :standard-input t
  :error-patterns
  ((error (zero-or-more not-newline) "\n"
          (zero-or-more not-newline) "\n"
          (zero-or-more not-newline)
          (zero-or-more "\n")
          " line " line ":" (message)))
  :modes prometheus-v2-rules-mode)

(add-to-list 'flycheck-checkers 'prometheus-v2-promtool-rules)

(add-hook! 'sql-mode-hook #'lsp-deferred)

(setq lsp-yaml-schemas '(:kubernetes "/*-k8s.yaml"))

;; (setq js-indent-level 2)
;; (setq css-indent-offset 2)

(defun delete-carrage-returns ()
  (interactive)
  (save-excursion
    (goto-char 0)
    (while (search-forward "\r" nil :noerror)
      (replace-match ""))))

(setq leetcode-prefer-language "cpp")
(setq leetcode-prefer-sql "mysql")

(use-package wakatime-mode)
(global-wakatime-mode)

(add-hook! wakatime-mode
  (setq wakatime-cli-path "wakatime")
)

(map! :leader "h" nil
      :desc "Follow thing"  "RET" 'org-open-at-point
      :desc "delete-other-windows" "w" #'treemacs-delete-other-windows
      (:when (featurep! :lang org +roam2)
       (:prefix ("m" . "roam")
        :desc "Open random node"           "a" #'org-roam-node-random
        :desc "Find node"                  "f" #'org-roam-node-find
        :desc "Find ref"                   "F" #'org-roam-ref-find
        :desc "Show graph"                 "g" #'org-roam-graph
        :desc "Insert node"                "i" #'org-roam-node-insert
        :desc "Capture to node"            "n" #'org-roam-capture
        :desc "Toggle roam buffer"         "r" #'org-roam-buffer-toggle
        :desc "Launch roam buffer"         "R" #'org-roam-buffer-display-dedicated
        :desc "Sync database"              "s" #'org-roam-db-sync
        (:prefix ("d" . "by date")
         :desc "Goto previous note"        "b" #'org-roam-dailies-goto-previous-note
         :desc "Goto date"                 "d" #'org-roam-dailies-goto-date
         :desc "Capture date"              "D" #'org-roam-dailies-capture-date
         :desc "Goto next note"            "f" #'org-roam-dailies-goto-next-note
         :desc "Goto tomorrow"             "m" #'org-roam-dailies-goto-tomorrow
         :desc "Capture tomorrow"          "M" #'org-roam-dailies-capture-tomorrow
         :desc "Capture today"             "n" #'org-roam-dailies-capture-today
         :desc "Goto today"                "t" #'org-roam-dailies-goto-today
         :desc "Capture today"             "T" #'org-roam-dailies-capture-today
         :desc "Goto yesterday"            "y" #'org-roam-dailies-goto-yesterday
         :desc "Capture yesterday"         "Y" #'org-roam-dailies-capture-yesterday
         :desc "Find directory"            "-" #'org-roam-dailies-find-directory)))
      (:when (featurep! :os macos)
       (:prefix-map  ("o" . "open")
        :desc "Open in mac default program" "s" #'+macos/open-in-default-program
        :desc "Open in mac term" "t" #'+macos/open-in-iterm
        ))
      )

(setq word-wrap-by-category t)

(if IS-LINUX
    ((let ((liberime-auto-build t))
       (require 'liberime nil t))

     (use-package! liberime)
     (use-package! pyim
       ;; :quelpa (pyim :fetcher github :repo "merrickluo/pyim")
       :init
       (setq pyim-title "R")
       :config
       ;; (use-package pyim-basedict
       ;;   :config
       ;;   (pyim-basedict-enable))
       (define-key evil-insert-state-map (kbd "M-i") 'pyim-convert-string-at-point)
       (setq pyim-dcache-auto-update t)
       (setq default-input-method "pyim")

       (setq pyim-page-length 9)

       ;; 我使用全拼
       (setq pyim-page-tooltip 'child-frame)

       (setq pyim-default-scheme 'rime)
       (liberime-try-select-schema "luna_pinyin_simp")
       ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
       ;; 我自己使用的中英文动态切换规则是：
       ;; 1. 光标只有在注释里面时，才可以输入中文。
       ;; 2. 光标前是汉字字符时，才能输入中文。
       ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
;;; lsp-solidity.el --- description -*- lexical-binding: t; -*-

;; Copyright (C) 2020 emacs-lsp maintainers

;; Author: emacs-lsp maintainers
;; Keywords: lsp, solidity, solidity

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; LSP Clients for the Solidity Programming Language.

;;; Code:

(require 'lsp-mode)

(defgroup lsp-solidity nil
  "LSP support for solidityl using solidity-language-server."
  :group 'lsp-mode
  :link '(url-link "https://www.npmjs.com/package/solidity-language-server"))

(defcustom lsp-clients-solidity-executable '("solidity-language-server"  "--stdio")
  "Command to start the solidity language server."
  :group 'lsp-solidity
  :risky t
  :type 'file)

(defcustom lsp-clients-solidity-initialization-options '()
  "Initialization options for solidity language server."
  :group 'lsp-solidity
  :type 'alist)

(lsp-dependency 'solidity-language-server
                '(:system "solidity-language-server")
                '(:npm :package "solidity-ls"
                       :path "solidity-ls"))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection
                                   (lambda ()
                                     `(,(or (executable-find (cl-first lsp-clients-solidity-executable))
                                            (lsp-package-path 'solidity-language-server))
                                       ,@(cl-rest lsp-clients-solidity-executable))))
                  :major-modes '(solidity-mode)
                  :priority -1
                  :server-id 'solidity-ls
                  :initialization-options (lambda () lsp-clients-solidity-initialization-options)
                  :download-server-fn (lambda (_client callback error-callback _update?)
                                        (lsp-package-ensure 'solidity-language-server
                                                            callback error-callback))))

(lsp-consistency-check lsp-solidity)

(provide 'lsp-solidity)
;;; lsp-solidity.el ends here       (setq-default pyim-english-input-switch-functions
                     '(pyim-probe-dynamic-english
                       pyim-probe-isearch-mode
                       pyim-probe-program-mode
                       pyim-probe-evil-normal-mode
                       pyim-probe-org-structure-template))

       (setq-default pyim-punctuation-half-width-functions
                     '(pyim-probe-punctuation-line-beginning
                       pyim-probe-punctuation-after-punctuation)))
     (require 'ox-confluence-en)
     (require 'systemd)))