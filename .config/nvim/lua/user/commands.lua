-- Skeleton augroup 
vim.cmd([[
autocmd BufNew,BufNewFile,BufRead *.rkt* setlocal ft=racket

augroup skeletons
au!
autocmd BufNewFile */**/Makefile silent! execute '0r ~/.config/nvim/templates/Makefile' | %s/%project_dir%/\=expand('%:p:h:t')
autocmd BufNewFile test*.c silent! execute '0r ~/.config/nvim/templates/test.c'
autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/templates/skeleton.'.expand("<afile>:e")
augroup END
]])
