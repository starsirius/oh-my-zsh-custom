# Customized honukai theme (https://github.com/oskarkrawczyk/honukai-iterm-zsh)

# Enable ls and autocomplete colors.
# https://github.com/ggreer/lscolors can be used for LSCOLORS generation.
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS (Version Control Systems)
YS_VCS_PROMPT_PREFIX1=" %{$fg[magenta]%}["
YS_VCS_PROMPT_PREFIX2=""
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY="] %{$fg[red]%}✖︎"
YS_VCS_PROMPT_CLEAN="] %{$fg[green]%}●"

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# Prompt format: \n USER:DIRECTORY [BRANCH] STATE \n $
PROMPT="
%{$fg[cyan]%}%n%{$reset_color%}\
:\
%{$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info}
$ %{$reset_color%}"

if [[ "$USER" == "root" ]]; then
PROMPT="
%{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%}\
:\
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info}
$ %{$reset_color%}"
fi
