"""""""""""""""""""""""
"  plugin management  "
""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=$HOME/bin/vim/plugins/vundle.vim
set rtp+=$HOME/bin/vim/plugins

call vundle#begin($HOME.'/bin/vim/plugins')
Plugin 'gmarik/vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree' 
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
"Plugin 'Shougo/neocomplete'
"Plugin 'artur-shaik/vim-javacomplete2'
call vundle#end()

filetype plugin indent on
"""""""""""""""""
"  key mappings  "
""""""""""""""""""
let mapleader = ";"
nnoremap <F5> :!%:p<Enter><Enter>
nnoremap <leader>r :!%:p<Enter>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" make file executable
au BufWritePost ~/.vimrc silent execute "!cp % ~/dotfiles/.vimrc"
au BufWritePost * if getline(1) =~ "^#!.*/bin/" | silent execute "!chmod +x %" | endif
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <C-S> :echo 'De tijd is ' . strftime('%c')<CR>


"""""""""""""""
"  syntastic  "
"""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1


""""""""""""""""""""""
"  PEP8 indentation  "
""""""""""""""""""""""
au BufNewFile,BufRead *.py
	\ set tabstop=4
"	\ set softtabstop=4
"	\ set shiftwidth=4
"	\ set textwidth=79
"	\ set expandtab
"	\ set autoindent
"	\ set fileformat=unix
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"""""""""""""""""""""""""""""""""
"  set ultisnips configuration  "
"""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
"""""""""""""""""""""""""""
"  controlP coniguration  "
"""""""""""""""""""""""""""
"let g:ctrlp_map="<c-p>"
"let g:ctrlp_cmd="CtrlP"
""""""""""""""""""""""""""""""""
"  java complete coniguration  "
""""""""""""""""""""""""""""""""
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"nmap <F5> <Plug>(JavaComplete-Imports-Add)
"imap <F5> <Plug>(JavaComplete-Imports-Add)
"nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
""""""""""""""""""""""""""""""
"  neocomplete coniguration  "
""""""""""""""""""""""""""""""
"let g:acp_enableAtStartup = 0
" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"			\ 'default' : '',
"			\ 'vimshell' : $HOME.'/.viminfo',
"			\ 'scheme' : $HOME.'/.gosh_completions'
"			\ }
" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"	let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"	" For no inserting <CR> key.
"	"return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior (not recommended.)
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" :
" \ neocomplete#start_manual_complete()

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"	let g:neocomplete#sources#omni#input_patterns = {}
"endif
"if !exists('g:neocomplete#force_omni_input_patterns')
"	let g:neocomplete#force_omni_input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php =
""\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"let g:neocomplete#sources#omni#input_patterns.c =
"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
""let g:neocomplete#sources#omni#input_patterns.cpp =
""\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"
"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl =
"			\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"
"" For smart TAB completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"        \ <SID>check_back_space() ? "\<TAB>" :
"        \ neocomplete#start_manual_complete()
"  function! s:check_back_space() "{{{
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~ '\s'
"  endfunction"}}}

""""""""""""""""""""""""""""
"  nerdtree configuration  "
""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""
"  user interface styles  "
"""""""""""""""""""""""""""
set cindent
colorscheme darkblue
set number
"""""""""""""""""""""""""""""""
"  set temp file directories  "
"""""""""""""""""""""""""""""""
set directory=$HOME/bin/vim/temp/swap//,.
set undodir=$HOME/bin/vim/temp/undo//,.
set backupdir=$HOME/bin/vim/temp/backup//,.
" Double slash does not actually work for backupdir, here's a fix
au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')
set viminfo='10,\"100,:20,n$HOME/.viminfo
