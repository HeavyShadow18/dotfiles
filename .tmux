unbind r
bind r source-file ~/.tmux.conf

set -g mouse on  
set -g status-position top
set -s set-clipboard on

# -- Key Bingings

setw -g mode-keys vi 
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R


# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'nhdaly/tmux-better-mouse-mode'

set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'dracula/tmux'
set -g @dracula-show-powerline true
set -g @dracula-fixed-location "Canberra"
set -g @dracula-show-fahrenheit false 
set -g @dracula-refresh-rate 5 
set -g @dracula-military-time true
set -g @plugin "janoamaral/tokyo-night-tmux"

# --- Theme --
#set -g @tokyo-night-tmux_window_id_style digital
#set -g @tokyo-night-tmux_pane_id_style hsquare
#set -g @tokyo-night-tmux_zoom_id_style dsquare
set -g @tokyo-night-tmux_theme night # storm | day | default to 'night'
set -g @tokyo-night-tmux_transparent 1  # 1 or 0

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
