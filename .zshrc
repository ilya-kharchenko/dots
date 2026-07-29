# ---------- Подключение Homebrew ----------
[[ -d /opt/homebrew/bin ]] && export PATH="/opt/homebrew/bin:$PATH"

# ---------- ZSH HISTORY MANAGEMENT ----------
export HISTFILE="$HOME/.zsh_history"         # Файл, в котором хранится история команд
export SAVEHIST=100000                       # Максимальное количество команд, сохраняемых на диск
export HISTSIZE=100000                       # Максимальное количество команд в памяти

# Опции оптимизации и безопасности истории
setopt HIST_IGNORE_ALL_DUPS                  # Удалять все предыдущие дубликаты команды
setopt HIST_IGNORE_SPACE                     # Не сохранять команды, начинающиеся с пробела
setopt SHARE_HISTORY                         # Общая история между всеми открытыми окнами терминала
setopt HIST_FIND_NO_DUPS                     # Не показывать дубликаты при поиске по истории
setopt HIST_REDUCE_BLANKS                    # Удалять лишние пробелы перед сохранением команды
setopt EXTENDED_HISTORY                      # Сохранять время выполнения каждой команды
setopt HIST_NO_STORE                         # Не сохранять команду history в историю
setopt HIST_EXPIRE_DUPS_FIRST                # При переполнении сначала удалять дубликаты

# ---------- UX & SHELL BEHAVIOUR ----------
setopt AUTOCD                                # Переход в папку без команды cd
setopt NOBEEP                                # Отключить системный сигнал
setopt NUMERIC_GLOB_SORT                     # Сортировка: file2 перед file10

# ---------- MANUAL PLUGINS INITIALIZATION ----------
# Подключение плагинов, установленных через Homebrew

# Автоподсказки команд
if [[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Подсветка синтаксиса
if [[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# ---------- ALIASES ----------
# Здесь будут находиться пользовательские алиасы

alias ls='eza -l -g -a --git --color=auto --group-directories-first --icons'
alias lt='ls --tree --level=1 --sort=modified --reverse'
alias tree="eza --tree"

alias cat="bat"

alias tinty='tinty --config $HOME/.config/tinted-theming/tinty/config.toml'

# ---------- TOOLS INITIALIZATION ----------
# Инициализация инструментов. Выполняется в самом конце.
(( $+commands[brew] )) && eval "$(brew shellenv)"
(( $+commands[fzf] )) && source <(fzf --zsh)                      # Интеграция fzf с Zsh
(( $+commands[starship] )) && source <(starship init zsh --print-full-init) # Инициализация Starship
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"             # Умная замена команды cd
(( $+commands[tinty] )) && eval "$(tinty init)"                   # Автоматическое применение тем
