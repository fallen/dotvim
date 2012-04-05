call pathogen#infect()
call pathogen#helptags()
syntax on
set number
set background=dark
highlight Normal     guifg=gray guibg=black
filetype plugin indent on
set mouse=a
set nocompatible

au FileType python set omnifunc=pythoncomplete#Complete
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

map <C-h> <Esc>:GundoToggle<CR>

" Fonction d'affichage d'un message en inverse vidéo
function! s:DisplayStatus(msg)
  echohl Todo
  echo a:msg
  echohl None
endfunction

" Variable d'enregistrement de l'état de la gestion de la souris
let s:mouseActivation = 1
" Fonction permettant l'activation/désactivation de la gestion de la souris
function! ToggleMouseActivation()
  if (s:mouseActivation)
    let s:mouseActivation = 0
    set mouse=n
    set paste
    call s:DisplayStatus('Désactivation de la gestion de la souris (mode collage)')
  else
    let s:mouseActivation = 1
    set mouse=a
    set nopaste
    call s:DisplayStatus('Activation de la gestion de la souris (mode normal)')
  endif
endfunction

" Activation par défaut au démarrage de la gestion de la souris
set mouse=a
set nopaste

set cc=+1

map <F4> <Esc>:call ToggleMouseActivation()<CR>
" Amélioration de la recherche avant et arrière avec surlignement du pattern
map * <Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR><Esc>:exe '/' . expand('<cWORD>') . '/'<CR>
map ù <Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR><Esc>:exe '?' . expand('<cWORD>') . '?'<CR>

set tags=tags;
