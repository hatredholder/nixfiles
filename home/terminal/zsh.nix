{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    dotDir = ".config/zsh";
    history.path = "${config.home.homeDirectory}/.config/zsh/zsh_history";

    # enable vi mode
    defaultKeymap = "viins";

    syntaxHighlighting.enable = true;

    autosuggestion = {
      enable = true;
      highlight = "fg=#665c54";
      strategy = [
        "history"
        "completion"
      ];
    };

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos#${builtins.getEnv "HOSTNAME"}";
      shutdown = "shutdown -h now";
      ss = "scrot --select --freeze --delay b2 ~/pictures/%Y-%m-%d-%T-screenshot.png";

      v = "nvim";
      vi = "vim";

      ls = "eza --icons -A --group-directories-first";
      l = "ls --group-directories-first -lah";
    };
    
    initExtra = ''
      # match hidden files
      setopt globdots

      # tab completion
      zstyle ':completion:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      bindkey '^[[Z' reverse-menu-complete

      # prompt
      autoload -U colors && colors
      PS1="%B%{$fg[green]%}%n%{$fg[yellow]%}@%{$fg[green]%}%M%{$reset_color%}: %{$fg[cyan]%}%~%{$reset_color%} $%b "

      # lf integration
      lfcd () {
        tmp="$(mktemp)"
          lf -last-dir-path="$tmp" "$@"
          if [ -f "$tmp" ]; then
            dir="$(cat "$tmp")"
              rm -f "$tmp"
              [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
              fi
      }
      bindkey -s '^o' 'lfcd\n'
 
      # cursor style based on vi mode
      zle-keymap-select () {
          if [[ $KEYMAP == vicmd ]]; then
              # the command mode for vi
              echo -ne "\e[2 q"
          else
              # the insert mode for vi
              echo -ne "\e[5 q"
          fi
      }
      precmd_functions+=(zle-keymap-select)
      zle -N zle-keymap-select
    '';
  };

  home.persistence."/persist/home/${config.home.username}" = {
    allowOther = true;
    directories = [
      ".config/zsh"
    ];
  };
}
