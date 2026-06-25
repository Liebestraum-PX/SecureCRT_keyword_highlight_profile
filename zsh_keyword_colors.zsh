# Zsh keyword color scheme aligned with Paul_Network_Optimized semantics.
# Tuned for macOS Terminal profile: Clear Dark (dark background).
# Usage:
#   1) Ensure zsh-syntax-highlighting is loaded.
#   2) source /path/to/zsh_keyword_colors.zsh

typeset -gA ZSH_HIGHLIGHT_STYLES

# Semantic palette (close to current SecureCRT rules)
# error   -> red
# warning -> magenta
# success -> green
# network -> orange / cyan / blue
# security -> pink

ZSH_HIGHLIGHT_STYLES[default]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff6b6b,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#8be9fd,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#ffb86c,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#ffb86c'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#50fa7b,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#61afef,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=#8be9fd'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#50fa7b,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#ff79c6,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#8be9fd'
ZSH_HIGHLIGHT_STYLES[path]='fg=#56b6c2'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#56b6c2'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#f1fa8c,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#ff79c6,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#bd93f9'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#bd93f9'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#8be9fd'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f1fa8c'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#f1fa8c'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#f1fa8c'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#7f8c8d,italic'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#c792ea'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#ffb86c,bold'

# Optional: autosuggestion color (if plugin is enabled)
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#5c6370'

# Optional: completion list colors (LS_COLORS-like style)
zstyle ':completion:*' list-colors \
  'fi=0;37:di=0;36:ln=1;35:ex=1;32:*.log=0;35:*.conf=0;33:*.yml=0;33:*.yaml=0;33'
