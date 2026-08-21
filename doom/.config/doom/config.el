;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; ─────────────────────────────────────────
;; UI
;; ─────────────────────────────────────────
(setq doom-font              (font-spec :family "FiraCode Nerd Font" :size 14)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 14)
      doom-big-font          (font-spec :family "FiraCode Nerd Font" :size 20))

(setq doom-theme 'doom-gruvbox)
(setq doom-gruvbox-dark-variant "soft")

(setq display-line-numbers-type t)

;; ─────────────────────────────────────────
;; Org — directorios
;; ─────────────────────────────────────────
(setq org-directory      "~/notas/"
      org-roam-directory "~/notas/roam/")

;; ─────────────────────────────────────────
;; Org — agenda
;; ─────────────────────────────────────────
(after! org
  (setq org-agenda-file-regexp "\\`[^.].*\\.org\\'")
  (setq org-agenda-files
        (append
         (directory-files-recursively "~/notas/roam/" "\\.org$")
         (directory-files "~/notas/" t "\\.org$"))))

;; ─────────────────────────────────────────
;; Org — capture templates
;; ─────────────────────────────────────────
(after! org
  (setq org-capture-templates
        '(("j" "Diario" entry
           (file+olp+datetree "~/notas/diario.org")
           "* %<%H:%M> %?\n"
           :empty-lines 1))))

;; ─────────────────────────────────────────
;; Org — misc
;; ─────────────────────────────────────────
(after! org
  (setq org-startup-numerated nil))

(remove-hook 'org-mode-hook #'org-num-mode)

;; ─────────────────────────────────────────
;; Org-roam — capture templates
;; ─────────────────────────────────────────
(after! org-roam
 (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "${slug}.org"
                              "#+title: ${title}\n#+filetags:\n\n")
           :unnarrowed t)
          ("u" "universidad" plain "* Tema\n%?\n"
           :target (file+head "uni/${slug}.org"
                              "#+title: ${title}\n#+filetags: :uni:\n\n")
           :unnarrowed t)
          ("p" "permanente" plain
           "* Idea central\n%?\n\n* Relaciones\n\n* Fuentes"
           :target (file+head "permanentes/${slug}.org"
                              "#+title: ${title}\n#+filetags: :permanente:\n#+date: %U\n\n")
           :unnarrowed t))))
;; ─────────────────────────────────────────
;; Org-roam-ui
;; ─────────────────────────────────────────

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t))
;; ─────────────────────────────────────────
;; Keybindings
;; ─────────────────────────────────────────
(map! :leader
      :prefix "n r"
      :desc "Find node"     "f" #'org-roam-node-find
      :desc "Insert node"   "i" #'org-roam-node-insert
      :desc "Toggle buffer" "b" #'org-roam-buffer-toggle
      :desc "Capture"       "c" #'org-roam-capture
      :desc "Diario hoy"    "d" #'org-capture)
