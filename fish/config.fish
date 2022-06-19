if status is-interactive
    source /opt/homebrew/lib/python3.9/site-packages/powerline/bindings/fish/powerline-setup.fish
    zoxide init fish | source # Add this line to your fish config
    set fish_greeting
    export LANG='en_US.UTF-8'
    export LC_ALL='en_US.UTF-8'
    export EDITOR='/usr/local/bin/vim'
    alias lg="lazygit"
    alias cl="clear"
    alias gitlog='git log --all --graph --pretty=format:"%Cred%h%Creset %C(bold blue)%an%Creset :%C(yellow)%d%Creset %s %Cgreen(%cr) %Creset" --abbrev-commit'
    alias nosleep='caffeinate -d'
    alias g="git"
    alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
    alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
    alias ll='exa -l --color=always --group-directories-first --icons'  # long format
    alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
    alias l='exa -lah --color=always --group-directories-first --icons' # tree listing
end

function task
    python $HOME/.config/scripts/task.py -t "$argv"
end

function lilith
    $HOME/.config/scripts/lilith
end

function dev
    tmux new-session -A -s main 
end
function ide
  tmux split-window 
  tmux split-window -h
end
