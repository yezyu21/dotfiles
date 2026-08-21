;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(unpin! org-roam)
(package! org-roam-ui
  :recipe (:host github :repo "org-roam/org-roam-ui"
           :files ("*.el" "out")))
