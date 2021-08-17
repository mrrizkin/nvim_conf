" Statusline colors
hi Base guibg=#212333 guifg=#212333
hi Mode guibg=#82aaff guifg=#181824 gui=bold
hi Git guibg=#292d3e guifg=#929dcb
hi Filetype guibg=#292d3e guifg=#929dcb
hi LineCol guibg=#82aaff guifg=#181824 gui=bold
" Get current mode
let g:currentmode={
            \ 'n' : 'Normal ',
            \ 'no' : 'N·Operator Pending ',
            \ 'v' : 'Visual ',
            \ 'V' : 'V·Line ',
            \ '^V' : 'V·Block ',
            \ 's' : 'Select ',
            \ 'S': 'S·Line ',
            \ '^S' : 'S·Block ',
            \ 'i' : 'Insert ',
            \ 'R' : 'Replace ',
            \ 'Rv' : 'V·Replace ',
            \ 'c' : 'Command ',
            \ 'cv' : 'Vim Ex ',
            \ 'ce' : 'Ex ',
            \ 'r' : 'Prompt ',
            \ 'rm' : 'More ',
            \ 'r?' : 'Confirm ',
            \ '!' : 'Shell ',
            \ 't' : 'Terminal '
            \ }

" Get current mode
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Get current git branch
function! GitBranch(git)
  if a:git == ""
    return '-'
  else
    return a:git
  endif
endfunction

" Get current filetype
function! CheckFT(filetype)
  if a:filetype == ''
    return '-'
  else
    return tolower(a:filetype)
  endif
endfunction

" Check modified status
function! CheckMod(modi)
  if a:modi == 1
    hi Modi guifg=#efefef guibg=#212333
    hi Filename guifg=#efefef guibg=#212333
    return expand('%:t').'*'
  else
    hi Modi guifg=#929dcb guibg=#212333
    hi Filename guifg=#929dcb guibg=#212333
    return expand('%:t')
  endif
endfunction

" Set active statusline
function! ActiveLine()
  " Set empty statusline and colors
  let statusline = ""
  let statusline .= "%#Base#"

  " Current mode
  let statusline .= "%#Mode# %{ModeCurrent()}"

  let statusline .= "%#Base#"

  " Align items to right
  let statusline .= "%="

  " Current modified status and filename
  let statusline .= "%#Modi# %{CheckMod(&modified)} "

  " Current filetype
  let statusline .= "%#Filetype# %{CheckFT(&filetype)} "

  " Current line and column
  let statusline .= "%#LineCol# Ln %l, Col %c "
  return statusline
endfunction

function! InactiveLine()
  " Set empty statusline and colors
  let statusline = ""
  let statusline .= "%#Base#"

  " Full path of the file
  let statusline .= "%#Filename# %F "

  return statusline
endfunction

" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END
