#!/usr/bin/env bash

# ----- General -----
tmux set-option -g status-justify left
tmux set-option -g status-style "bg=black"
tmux set-option -g status-right-length 100

# Message / Mode styles
tmux set-option -g mode-style "bg=blue,fg=black"
tmux set-option -g message-style "bg=blue,fg=black"

# ----- Windows (Center Section) -----
tmux setw -g window-status-style "bg=black"
tmux setw -g window-status-current-style "bg=blue,fg=black"
tmux setw -g window-status-separator " "
tmux setw -g window-status-format "#I:#W"
tmux setw -g window-status-current-format \
  "#[bold]#[fg=blue,bg=black]#[fg=black,bg=blue] #I:#W #[fg=blue,bg=black]"

# ----- Left Section -----
tmux set-option -g status-left " #S #[fg=blue,bg=black]"
tmux set-option -g status-left-style "bg=blue,fg=black"

# ----- Right Section -----
tmux set-option -g status-right-style "bg=black,fg=blue"
tmux set-option -g status-right "#[fg=blue,bg=black]#[fg=black,bg=blue] %d/%m #[fg=blue,bg=black]#[fg=blue,bg=black]#[fg=black,bg=blue] %R #[fg=blue,bg=black]"
