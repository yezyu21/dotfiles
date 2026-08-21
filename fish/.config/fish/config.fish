if status is-interactive
    # Commands to run in interactive sessions can go here
    if not set -q SSH_AUTH_SOCK
        eval (ssh-agent -c) >/dev/null
        ssh-add ~/.ssh/id_ed25519 2>/dev/null
    end
end
set -g fish_greeting
set -gx PATH /home/niko/.config/emacs/bin $PATH
