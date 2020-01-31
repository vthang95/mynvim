call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'huytd/vim-quickrun'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'liuchengxu/vista.vim'
call plug#end()

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

set hidden
set nobackup
set nowritebackup

set wildoptions=pum
set pumblend=20

let g:is_posix = 1

set noswapfile
set nojoinspaces
set nowrap
set number
set ttyfast
set laststatus=2
set ttimeout
set ttimeoutlen=10
set termguicolors
set ignorecase

inoremap jk <ESC>
inoremap <ESC> `
vnoremap <M-/> <Esc>/\%V
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>

"colorscheme base16-ocean-clean
set background=dark
set termguicolors
let g:quantum_black=1
let g:quantum_italics=1
colorscheme quantum

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif

set listchars=eol:Â,tab:>á,trail:~,extends:>,precedes:<,space:á
set list
hi Whitespace guifg=#333333

let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
let $FZF_DEFAULT_OPTS = '-m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all'

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
set grepprg=rg\ --vimgrep
nnoremap \ :Find<SPACE>

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let mapleader=" "
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>pr :History<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>l :vsplit<CR>
nnoremap <Leader>k :split<CR>
nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wl :wincmd l<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>w= :wincmd =<CR>
nnoremap <Leader>e :QuickRunExecute<CR>
nnoremap <Leader>wb :e#<CR>
nnoremap <Leader>qq :bd<CR>
nnoremap <Leader>ss :mksession! .work<CR>
nnoremap <Leader>sr :so .work<CR>
nnoremap <Leader><Leader>r :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>n :NERDTreeTabsToggle<CR>
nnoremap <Leader><Leader>o :Vista coc<CR>
nnoremap <D-r> :CocList outline<CR>
"Buffer
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>tc :tabe<CR>
" Git
nnoremap <Leader>ggn :GitGutterNextHunk<CR>
nnoremap <Leader>ggp :GitGutterPrevHunk<CR>

" Turn off whitespaces compare and folding in vimdiff
set diffopt+=iwhite
set nofoldenable
nnoremap <Leader>1 :diffget 1<CR>:diffupdate<CR>
nnoremap <Leader>2 :diffget 2<CR>:diffupdate<CR>

set relativenumber
set clipboard=unnamed

let g:vrc_follow_redirects = 1

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'quantum',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified', 'nearmethod' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightLineFilename',
      \   'nearmethod': 'NearestMethodOrFunction'
      \ },
      \ }

function! LightLineFilename()
	let name = ""
	let subs = split(expand('%'), "/")
	let i = 1
	for s in subs
		let parent = name
		if  i == len(subs)
			let name = parent . '/' . s
		elseif i == 1
			let name = s
		else
			let name = parent . '/' . strpart(s, 0, 1)
		endif
		let i += 1
	endfor
  return name
endfunction

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

filetype off
filetype plugin indent on

set shortmess+=c
set signcolumn=yes
set cmdheight=2

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('doHover')

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{StatusDiagnostic()}

" Vim easymotion
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)

let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['Cargo.tom', 'package.json', '.git/']

hi CocErrorLine guifg=#000000 guibg=#D25972
hi CocWarningLine guifg=#000000 guibg=#CBAC62
