# minidot
Minimal dotfiles for servers

## Install dotfiles
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/gardart/minidot/main/bootstrap)"`

# Cheatsheet

## Vim

* `,d` brings up / closes down [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
* `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
* `,"` surround word with "
* `,'` surround word with '
* `gcc` toggles current line comment
* `gc` toggles visual selection comment lines
* `,<space>`  turn off highlighting until the next search
* `,l` Toggle between numbers and relative numbers
* `,1` Toggle number / nonumber
* `<Ctrl-hjkl>` move between windows, shorthand for `<C-w> hjkl`

## tmux
