vim.cmd([[
  augroup PlugInstall
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.lua | qall
  augroup END
]])
