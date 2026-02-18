# CLAUDE.md - minidot Codebase Guide

## Overview

**minidot** is a dotfiles repository for Linux servers by Garðar Þorsteinsson. It provides shell environment configuration (Bash/Zsh with oh-my-bash/oh-my-zsh), Vim/Neovim editor setup, and tmux multiplexer config. The primary goal is a fast, one-command setup for Linux server environments.

## Repository Structure

```
minidot/
├── bootstrap                        # Curl-bootstrappable entry point (clones repo + runs install.sh)
├── install.sh                       # Main interactive installation script
├── vimrc.symlink                    # Vim config → symlinked to ~/.vimrc
├── tmux.conf.symlink                # tmux config → symlinked to ~/.tmux.conf
├── gardar.zsh-theme                 # Custom oh-my-zsh theme
├── .gitignore                       # Ignores Vim swap/session files and Zsh compiled files
├── vim/
│   └── host/
│       └── Esja                     # Per-host Vim override (WSL machine named "Esja")
└── .config/
    └── nvim/
        └── lua/
            └── user/
                └── init.lua         # AstroNvim user configuration
```

## Key Convention: `.symlink` Files

Files ending in `.symlink` are automatically symlinked into `$HOME` by `install.sh` with the following transformation:

- The `.symlink` suffix is stripped
- A leading `.` is prepended
- Example: `vimrc.symlink` → `~/.vimrc`
- Example: `tmux.conf.symlink` → `~/.tmux.conf`

To add new dotfiles to this repo, name them `<filename>.symlink` and they will be picked up automatically by `symlink_files()` in `install.sh`.

## Installation Workflow

### One-Command Bootstrap
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/gardart/minidot/main/bootstrap)"
```

The `bootstrap` script:
1. Checks that `git` is installed
2. Clones the repo to `~/.dotfiles` (configurable)
3. Optionally switches the remote to SSH
4. Runs `install.sh`

### `install.sh` Steps (in order)
1. `determine_shell` - Prompts user to choose Bash or Zsh
2. `symlink_files` - Creates `~/.vimrc`, `~/.tmux.conf`, etc. from `.symlink` files (skips if destination already exists)
3. `setup_vim` - Runs `vim +PlugInstall +qall` to install vim-plug plugins
4. `setup_git` (optional) - Configures global git `user.name`, `user.email`, editor, colors
5. `setup_bash` or `setup_zsh` (optional) - Installs oh-my-bash or oh-my-zsh with plugins

### Zsh Setup Details
- Installs oh-my-zsh unattended
- Clones `zsh-autosuggestions` and `zsh-syntax-highlighting` plugins
- Downloads the custom `gardar.zsh-theme` into `$ZSH_CUSTOM/themes/`
- Sets plugins: `git vi-mode sudo tmux virtualenv zsh-autosuggestions zsh-syntax-highlighting`

## Vim Configuration (`vimrc.symlink`)

### Plugin Manager
Uses [vim-plug](https://github.com/junegunn/vim-plug). Plugins are auto-installed on first launch.

### Installed Plugins
| Plugin | Purpose |
|--------|---------|
| `altercation/vim-colors-solarized` | Solarized colorscheme |
| `sjl/badwolf` | Badwolf colorscheme |
| `joshdick/onedark.vim` | OneDark colorscheme (active) |
| `christoomey/vim-tmux-navigator` | Seamless Vim/tmux pane navigation |
| `tpope/vim-commentary` | Comment/uncomment with `gcc`/`gc` |
| `tpope/vim-surround` | Surround text with brackets/quotes |
| `scrooloose/nerdtree` | File tree explorer |
| `editorconfig/editorconfig-vim` | EditorConfig support |
| `ntpeters/vim-better-whitespace` | Trailing whitespace highlighting and removal |

### Leader Key
The leader key is `,` (comma).

### Key Mappings

**Window/Buffer Navigation**
| Mapping | Action |
|---------|--------|
| `<C-h/j/k/l>` | Switch between Vim splits (also works across tmux panes) |
| `<Shift-Tab>` | Cycle through open buffers |
| `,,` | Switch to last buffer |
| `,o` | Close all other windows (`:only`) |

**File/Config**
| Mapping | Action |
|---------|--------|
| `,d` | Toggle NERDTree file explorer |
| `,ev` | Open vimrc in vertical split |
| `,sv` | Source (reload) vimrc |

**Editing**
| Mapping | Action |
|---------|--------|
| `,<space>` | Clear search highlighting |
| `,l` | Toggle list mode (show invisible chars) |
| `,1` | Toggle line numbers |
| `,n` | Toggle relative/absolute line numbers |
| `,t` | Toggle paste mode |
| `J/K` (visual) | Move selected block down/up |
| `gcc` | Toggle comment on current line |
| `gc` (visual) | Toggle comment on selection |

**Surround (word/selection)**
| Mapping | Action |
|---------|--------|
| `,"` `,'` | Surround word/selection with `"` or `'` |
| `,{` `,(`  `,[` `,<` | Surround word/selection with respective brackets |
| `ds` / `cs` | Delete/change surrounding (vim-surround) |

### Per-Host Vim Overrides
Vim loads host-specific config from `~/.vim/host/<hostname>` (hostname without domain). The file `vim/host/Esja` contains WSL-specific clipboard support via `clip.exe`.

To add per-host config: create `vim/host/<your-hostname>` and symlink the entire `vim/` directory, or place the file directly at `~/.vim/host/<hostname>`.

A local override file at `~/.vim/.vimrc.local` is also loaded if it exists (for machine-specific settings not tracked in git).

### Editor Settings
- Tab width: 2 spaces (expandtab)
- Encoding: UTF-8
- Colorscheme: OneDark (dark background)
- Relative line numbers in normal mode, absolute in insert mode
- Trailing whitespace auto-stripped on save for: JavaScript, C, C++, Java, HTML, Ruby, YAML, Python

## tmux Configuration (`tmux.conf.symlink`)

Based on [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) defaults.

### Key Settings
- Prefix: `Ctrl-b` (default)
- Mouse: **off** (to allow terminal copy/paste on remote machines)
- Copy mode: vi keybindings
- Windows/panes indexed from 1 (not 0)
- Terminal: `screen-256color`
- Scrollback: 50,000 lines

### Key Bindings
| Binding | Action |
|---------|--------|
| `Ctrl-h/j/k/l` | Smart pane switching (Vim-aware) |
| `prefix -` | Split pane horizontally |
| `prefix ö` | Split pane vertically |
| `prefix c` | New window (inherits current path) |
| `prefix b` | Break pane into new window |
| `prefix r` | Reload tmux config |
| `prefix Esc` | Enter copy mode |
| `v` (copy mode) | Begin selection |
| `y` (copy mode) | Copy and exit (pipes to `pbcopy`) |

## Neovim Configuration (`.config/nvim/lua/user/init.lua`)

Uses [AstroNvim](https://astronvim.com/) as the base distribution. The `init.lua` file provides user overrides.

### Key Differences from Default AstroNvim
- Leader key: `Space`
- Colorscheme: `default_theme`
- Additional plugins: `onedark.vim`, `vimwiki`, `vim-surround`, `telescope-repo.nvim`
- Formatters: `stylua` (Lua), `prettier` (JS/web)
- Linter: `yamllint`
- LSP: `sumneko_lua` (Lua language server)
- Treesitter: `lua`
- `J/K` in visual mode moves selection up/down
- Search results centered with `nzzzv`

## Development Conventions

### Adding New Dotfiles
1. Create `<name>.symlink` in the repo root
2. Re-run `symlink_files` from `install.sh` (or manually `ln -s`)
3. Commit and push

### Adding Vim Plugins
Edit the `plug#begin`/`plug#end` block in `vimrc.symlink`, then run `:PlugInstall` in Vim.

### Adding Per-Host Config
Place files in `vim/host/<hostname>` for Vim host-specific overrides. The hostname is resolved without the domain suffix.

### Modifying the Zsh Theme
Edit `gardar.zsh-theme`. The theme displays: virtualenv, time (green/red based on last exit code), user@host, current directory, and git branch status.

## Git Workflow

This repo uses a simple `main` branch workflow. No CI/CD or test suite — changes are manually tested by running the bootstrap/install scripts.

```bash
# Clone
git clone https://github.com/gardart/minidot.git ~/.dotfiles

# After changes
git add <files>
git commit -m "descriptive message"
git push origin main
```

## No Build Process

There is no build step, test suite, linter, or package manager. This is a pure shell/Vimscript/Lua configuration repository. Validation is done by applying the configs and verifying behavior manually.
