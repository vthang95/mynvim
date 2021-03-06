set nocompatible
set foldmethod=indent
set foldlevelstart=20
set encoding=UTF-8
set autoread
filetype on
filetype plugin on

if (!isdirectory(expand("$HOME/.nvim/dein/repos/github.com/Shougo/dein.vim")))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.nvim/dein/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.nvim/dein/')

call dein#add('Shougo/dein.vim')
call dein#add('sheerun/vim-polyglot')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tpope/vim-fugitive')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('drewtempelmeyer/palenight.vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('scrooloose/nerdtree')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('mattn/emmet-vim')
call dein#add('ervandew/supertab')
call dein#add('chriskempson/base16-vim')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('airblade/vim-gitgutter')
call dein#add('ludovicchabant/vim-gutentags')
"call dein#add('slashmili/alchemist.vim')
call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
call dein#add('liuchengxu/vista.vim')

""call dein#add('Shougo/deoplete.nvim')
""call dein#add('Shougo/denite.nvim')

"call dein#add('HerringtonDarkholme/yats.vim')
"call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
call dein#add('neomake/neomake')

if dein#check_install()
    call dein#install()
    let pluginsExist=1
endif

call dein#end()

filetype plugin indent on

let mapleader = " "


" Deoplete Conf
""set completeopt-=preview
""let g:deoplete#enable_at_startup = 1
""let g:deoplete#enable_smart_case = 1
""inoremap <silent><expr><cr> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" NERDtree config
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let NERDTreeMinimalUI=1
let NERDTreeIgnore = ['\.beam$']

let g:alchemist_iex_term_size = 30
let g:alchemist_tag_disable = 0
let g:alchemist_mappings_disable = 1
let g:alchemist_tag_disable = '<C-9>'
let g:alchemist_compile_basepath = "/app/"
let g:alchemist_tag_map = '<C-]>'
let g:alchemist_tag_stack_map = '<C-T>'
let g:alchemist#elixir_erlang_src = "/usr/local/Cellar"

"Airline Config
let g:airline_powerline_fonts = 1
set hidden
let g:Powerline_symbols = 'fancy'
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tab_nr_type = 1

tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>:GFiles<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabm<cr>
map <leader>gf :GFiles<cr>
map <leader>ff :Files<space>
map <leader>gs :GFiles?<cr>
map <leader>w  :w<cr>
map <leader>wq :wqa<cr>
map <leader>hh :History<cr>
map <leader>rg :Rg<cr>
map <leader>ll :Lines<cr>
map <leader>gd :Gdiff<cr>
map <leader>ed :ExDoc<space>
map <leader>iex :IEx<cr>
" Open NERDTree
map <leader>\ :NERDTreeToggle<CR>

" Focus on NERDTree
map <leader>, <C-y>,
" Remove search highlight
map <leader>ok :noh<cr>
map <leader>j  :m .+1<cr>==
map <leader>k  :m .-2<cr>==
map <leader>hs :split<cr>
map <leader>vs :vsplit<cr>
map <leader>qs <C-w>q<cr>
map <leader>fh :BTags<cr>
map <leader><up> <C-w><up>
map <leader><down> <C-w><down>
map <leader><left> <C-w><left>
map <leader><right> <C-w><right>
map + :vertical resize +5<cr>
map _ :vertical resize -5<cr>

" jump to the first non-blank character of the line
map < ^
" jump to the end of the line
map > $
" Move code block
vnoremap <leader>k :m '<-2<cr>gv=gv
vnoremap <leader>j :m '>+1<cr>gv=gv
vnoremap <leader>md :m '>+1<CR>gv=gv
vnoremap <leader>mu :m '<-2<CR>gv=gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap d "_d

vmap # :s/^/# /g<CR>:let @/ = ""<CR>
map # :s/^/# /g<CR>:let @/ = ""<CR>
map <leader>'/ :s/^/" /g<CR>:let @/ = ""<CR>
vmap <leader>'/ :s/^/" /g<CR>:let @/ = ""<CR>

" Use K to show documentation in preview window
nnoremap ? :call <SID>show_documentation()<CR>

inoremap <S-Tab> <C-d>
nnoremap <S-Tab> <<
nnoremap <Tab> >>
nnoremap xx dd
nnoremap dd "_dd
nnoremap fw dw
nnoremap dw "_dw

map <S-j> 5j
map <S-k> 5k
map <S-h> <S-left>
map <S-l> <S-right>

inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap        {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap ' ''<Left>
inoremap " ""<Left>

inoremap [ []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Set terminals to split below and right
set splitbelow
set splitright

"Restore cursor to file position in previous editing session
""http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
"set viminfo='10,\"100,:20,%,n~/.viminfo
" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" map <Leader>b :CtrlPBuffer<CR>
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_custom_ignore = {
"     \ 'dir':  '\v\c(node_modules|_build|deps|vendor|\.git|\.svn)$',
"     \ 'file': '\v\c\.(swf|bak|png|gif|mov|ico|jpg|pdf|jrxml)$',
"     \}

set guifont=FiraCode\ Nerd\ Font\Fira\ Code\Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 13

syntax on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set number
set autoindent
set smartindent
set scrolloff=5
set background=dark
set hlsearch "highlight search
set incsearch
set updatetime=100
set ignorecase smartcase "ignore case when searching
set wrapscan "search from top when hit bottom
set cursorline
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme palenight

" Setup for ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --smart-case --color=never --ignore-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

if empty($SSH_CONNECTION) && has('clipboard')
 set clipboard^=unnamed                " Use vim global clipboard register
 if has('unnamedplus') || has('nvim')  " Use system clipboard register
   set clipboard^=unnamedplus
 endif
endif

autocmd FileType typescript :set makeprg=tsc
set colorcolumn=100
" Disable Deoplete when selecting multiple cursors starts
function! Multiple_cursors_before()
    if exists('*deoplete#disable')
        exe 'call deoplete#disable()'
    elseif exists(':NeoCompleteLock') == 2
        exe 'NeoCompleteLock'
    endif
endfunction

" Enable Deoplete when selecting multiple cursors ends
function! Multiple_cursors_after()
    if exists('*deoplete#toggle')
        exe 'call deoplete#toggle()'
    elseif exists(':NeoCompleteUnlock') == 2
        exe 'NeoCompleteUnlock'
    endif
endfunction

hi CocErrorLine guifg=#000000 guibg=#D25972
hi CocWarningLine guifg=#000000 guibg=#CBAC62
