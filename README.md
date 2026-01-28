# Vim
My personal Vim configuration.

## Dependencies

### Plugin Manager

#### Unix
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
#### Windows (PowerShell)
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```
### Command-line utilities

- ripgrep, fzf, fd
