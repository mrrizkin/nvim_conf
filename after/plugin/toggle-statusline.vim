let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set laststatus=0
    else
        let s:hidden_all = 0
        set laststatus=2
    endif
endfunction
nnoremap <silent> <leader>h :call ToggleHiddenAll()<CR>
