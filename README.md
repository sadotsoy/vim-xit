# [x]it! syntax plugin

Inspired by [ryanolsonx plugin](https://github.com/ryanolsonx/vim-xit) with my personal taste of salt.

## Examples of syntax highlighting

[Darkforce theme](https://github.com/sadotsoy/darkforce-vim)
![Darkforce](./images/darkforce.png)

[Breve](https://github.com/AlessandroYorba/Breve)
![Breve](./images/breve.png)

[Yui](https://github.com/cideM/yui)
![Yui](./images/yui.png)

[Nord](https://github.com/arcticicestudio/nord-vim)
![Nord](./images/nord.png)

## Notes

The [Todo list](todo.xit).

**IMPORTANT** I like the approach to have a empty checkbox like `[]` so this case is valid, if you want to set as invalid you can set it with

`let g:xit_invalid_empty_checkboxes = 1`


## Instalation

### Vim Packages

Using the built in package loader in Vim.

```bash
mkdir -p ~/.vim/pack/3rd/start
cd ~/.vim/pack/3rd/start
git clone https://github.com/sadotsoy/xit-vim
```

### Plug

Using [vim-plug](https://github.com/junegunn/vim-plug):

```viml
Plug 'sadotsoy/xit-vim'
```

### Vundle

Using [Vundle](https://github.com/VundleVim/Vundle.vim): 

```viml
Plugin 'sadotsoy/xit-vim'
```

## License

MIT
