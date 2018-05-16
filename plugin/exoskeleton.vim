let g:exoskeleton_base_directory = get(g:, 'exoskeleton_base_directory', '~/.vim/exoskeleton/')
let g:exoskeleton_ft_directory = g:exoskeleton_base_directory . 'ft/'
let g:exoskeleton_place_directory = g:exoskeleton_base_directory . 'place/'

augroup exoskeleton_ft

    "One autocmd per file extension in the ft directory.
    "i.e.
    "~/.vim/exoskeleton/ft/php
    "~/.vim/exoskeleton/ft/vim
    "etc...
    for filepath in glob(g:exoskeleton_ft_directory . '*', '', 1)
        let extension = fnamemodify(filepath, ':t')
        execute 'autocmd BufNewFile *.' . extension . ' 0 read' . g:exoskeleton_ft_directory . extension
    endfor
augroup END

augroup exoskeleton_place   

augroup END
