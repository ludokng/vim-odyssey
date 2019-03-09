# Odyssey for Vim

Odyssey is a dark green colorscheme for Vim.

## Installation

### Downloading the plugin

#### Using `./vim/colors/`

Copy the file `./vim-odyssey/colors/odyssey.vim` under the repertory
`./vim/colors`.
  ```zsh
  git clone https://github.com/ludokng/vim-odyssey.git vim-odyssey/
  cp vim-odyssey/colors/odyssey.vim ~/.vim/colors/
  ```

#### Using [pathogen.vim]

After having installed [pathogen.vim], clone the repository under
`./vim/bundle`.
  ```zsh
  cd ~/.vim/bundle/
  git clone https://github.com/ludokng/vim-odyssey.git vim-odyssey/
  ```

### Updating the `./vimrc`

Add the following to the `./vimrc` file.

  + For GUI versions of Vim:

    ```vim
    colorscheme odyssey
    ```

  + For terminals that support true color, if 24-bits colors are required, the
    following lines must be used:

    ```vim
    set termguicolors
    colorscheme odyssey
    ```

  + For terminals that support 256-colors, if 8-bits colors are required, the
    following lines must be used:

    ```vim
    set t_Co=256
    colorscheme odyssey
    ```

## License

Odyssey for Vim is distributed under the terms of the MIT license.

[pathogen.vim]:  https://github.com/tpope/vim-pathogen
