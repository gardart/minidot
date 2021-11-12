# minidot
dotfiles fyrir Linux þjóna

## Uppsetning
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/gardart/minidot/main/bootstrap)"`

# Cheatsheet

## Vim

| Flýtilyklar | Lýsing |
| -------- | ----------- |
| **,d** | Opna/Loka NERDTree |
| **ds** | Toggle Tagbar (it is opened by default in certain source ccode files) |
| **F4** | Open a vertical split and show the list of existing buffers |
| **F5** | Open a shell in a tmux split |
| **Shift-Left/Right** | Change to the previous/next buffer |
| **\<Ctrl-Space\>** | In INSERT mode opens the autocompletion popup |
| **\<Ctrl-p\>** | Opens the CtrlP file search window |

* `<Ctrl-hjkl>` move between windows and splits, works with tmux windows as well
* `,d` brings up / closes down [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
* `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
* `,"` surround word with "
* `,'` surround word with '
* `gcc` toggles current line comment
* `gc` toggles visual selection comment lines
* `,<space>`  turn off highlighting until the next search
* `,l` Toggle between numbers and relative numbers
* `,1` Toggle number / nonumber

## tmux

* `<Ctrl-b> -` split pane horizontally
| Flýtilyklar | Lýsing |
| -------- | ----------- |
| **F2** | Opna NERDTree |
| **F3** | Toggle Tagbar (it is opened by default in certain source ccode files) |
| **F4** | Open a vertical split and show the list of existing buffers |
| **F5** | Open a shell in a tmux split |
| **Shift-Left/Right** | Change to the previous/next buffer |
| **\<Ctrl-Space\>** | In INSERT mode opens the autocompletion popup |
| **\<Ctrl-p\>** | Opens the CtrlP file search window |
