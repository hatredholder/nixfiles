{ config, pkgs, ... }: 

{
  programs.tmux = {
    enable = true;

    prefix = "C-a"; # ctrl-a prefix
    escapeTime = 0; # disable escape time
    baseIndex = 1; # start windows from 1
    keyMode = "vi"; # vi mode shortcuts
    terminal = "tmux-256color";
    mouse = true;

    plugins = with pkgs.tmuxPlugins; [
      {
        # https://github.com/tmux-plugins/tmux-resurrect
        plugin = resurrect;
        extraConfig = "set -g @resurrect-dir '${config.home.homeDirectory}/.local/share/tmux/resurrect'";
      }
      {
        # https://github.com/schasse/tmux-jump
        plugin = jump;
      }
      {
        # https://github.com/fcsonline/tmux-thumbs
        plugin = tmux-thumbs;
        extraConfig = "set -g @thumbs-command 'echo -n {} | xclip -selection clipboard'";
      }
    ];

    extraConfig = ''
      # automatically renumber windows when closed
      set -g renumber-windows on

      # split horizontally
      unbind %
      bind | split-window -h

      # split vertically
      unbind '"'
      bind - split-window -v

      # select panes
      bind-key -n M-h 'select-pane -L'
      bind-key -n M-j 'select-pane -D'
      bind-key -n M-k 'select-pane -U'
      bind-key -n M-l 'select-pane -R'

      # resize panes
      bind -r down resize-pane -D 2
      bind -r up resize-pane -U 2
      bind -r right resize-pane -R 2
      bind -r left resize-pane -L 2

      # copy mode
      bind-key 'i' copy-mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -i -selection clipboard'
    '';
  };

  home.packages = with pkgs; [
    ruby # required for tmux-jump
  ];

  home.persistence."/persist/home/${config.home.username}" = {
    allowOther = true;
    directories = [
      ".local/share/tmux"
    ];
  };
}

