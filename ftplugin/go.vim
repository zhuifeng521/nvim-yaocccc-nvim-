augroup golang
    au!
    autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
    autocmd BufWritePre *.go :call CocAction('format')
augroup END

vnoremap <silent><buffer> C :<c-u>call <SID>console()<cr>
vnoremap <silent><buffer> F :<c-u>call <SID>gfor()<cr>o
vnoremap <silent><buffer> D :<c-u>call SurroundVaddPairs("/** ", " */")<cr>

func s:console()
    let tag = getline(line("."))[col("'<") - 1 : col("'>") - 2]
    let l = line('.')
    let space = substitute(getline(l), '\v(^\s*).*', '\1', '')

    call appendbufline('%', line('.'), printf(space . 'fmt.Printf("[logger-%s]: %%+v\n", %s)', tag, tag))
endf

func s:gfor()
    let tag = getline(line("."))[col("'<") - 1 : col("'>") - 2]
    let l = line('.')
    let space = substitute(getline(l), '\v(^\s*).*', '\1', '')

    call appendbufline('%', line('.'), printf(space . 'for _, %s := range %s {', tag[:-2], tag))
    call appendbufline('%', line('.') + 1, space . '}')
    execute 'norm! j'
endf
