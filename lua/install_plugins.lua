vim.cmd([[
  augroup PlugInstall
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | qall
  augroup END
]])
