autocmd BufRead,BufNewFile *.exoskeleton.* execute "setlocal filetype=" . substitute(expand("%"),"^[^.]*\.","",1)
