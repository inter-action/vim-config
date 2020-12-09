" debug map `:verbose imap <tab>`



set t_Co=256

" Auto installing NeoNeoBundle
let isNpmInstalled = executable("npm")
" Default path for node-modules
let s:defaultNodeModules = '~/.vim/node_modules/.bin/'
if !isNpmInstalled
    echo "==============================================="
    echo "Your need to install npm to enable all features"
    echo "==============================================="
endif

"------------------------------
" Bundles

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

":: vim enhancement
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'


Plug 'jremmen/vim-ripgrep'
" let g:rg_command = 'rg --vimgrep -S'

" fzf
" (Optional) Multi-entry selection UI.
" install fzf with home brew
Plug '/usr/local/opt/fzf' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'



Plug 'jiangmiao/auto-pairs'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'sirver/ultisnips'
Plug 'preservim/nerdcommenter'

":: GUI enhancement
Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree'

Plug 'rust-lang/rust.vim'

" Make sure you use single quotes
Plug 'flazz/vim-colorschemes'
" Tomorrow, Tomorrow-Night



" syntax
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
let g:typescript_indent_disable = 1
Plug 'peitalin/vim-jsx-typescript'



Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/personalwiki/', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/workspace/js/lunr.js/vimwiki', 'syntax': 'markdown', 'ext': '.md'},
  \ ]
                      

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Initialize plugin system
call plug#end()


"--------------------------------------------------
" Bundles Settings
syntax on



"-------------------------
" preservim/nerdcommenter
let g:NERDCreateDefaultMappings = 1

"-------------------------
" sirver/ultisnips

let g:UltiSnipsExpandTrigger = '<c-tab>'




"-------------------------
" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" vim wiki suggested setting
filetype plugin on




"-------------------------
" vim-highlightedyank
let g:highlightedyank_highlight_duration = 250



"-------------------------
" coc start
"
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <F8> <Plug>(coc-diagnostic-next)
nmap <silent> <S-F8> <Plug>(coc-diagnostic-prev)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <f2> <Plug>(coc-rename)



" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()

nnoremap <silent> <space>a  :CocAction<cr>


" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Formatting selected code.
xmap <space>f  <Plug>(coc-format-selected)
nmap <space>f  <Plug>(coc-format-selected)

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" 'Smart' nevigation
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"-------------------------
" fzf
" file history
nmap <silent> <leader>fh :History<cr>
" commands history
nmap <silent> <leader>fhc :History:<cr>
" commands 
nmap <silent> <leader>fc :Commands<cr>
" marks 
nmap <silent> <leader>fm :Marks<cr>
" maps 
nmap <silent> <leader>fmm :Maps<cr>

" search history
" nmap <silent> <leader>fhs :History/<cr>
nmap <silent> <leader>fw :Windows<cr>


nnoremap <C-P> :Files<CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Comment'],
  \ 'prompt':  ['fg', 'CursorLine'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Keyword'] }


"-------------------------
" Fugitive

" Blame on current line
nmap <silent> <leader>b :.Gblame<cr>
" Blame on all selected lines in visual mode
vmap <silent> <leader>b :Gblame<cr>
" Git status
nmap <silent> <leader>gst :Gstatus<cr>
" like git add
nmap <silent> <leader>gw :Gwrite<cr>
" git diff
nmap <silent> <leader>gd :Gdiff<cr>
" git commit
nmap <silent> <leader>gc :Gcommit<cr>
" git commit all
nmap <silent> <leader>gca :Gcommit -a<cr>
" git fixup previous commit
nmap <silent> <leader>gcf :Gcommit -a --amend<cr>


"--------------------------------------------------
" Colorscheme

" Set highlighting for colorcolumn
highlight ColorColumn ctermbg=lightGrey

" Tomorrow, Tomorrow-Night, monokain
" colorscheme Tomorrow-Night
colorscheme Tomorrow-Night-Eighties

set background=dark


"-------------------------
" NERDTree

" Tell NERDTree to display hidden files on startup
let NERDTreeShowHidden=1

" Disable bookmarks label, and hint about '?'
let NERDTreeMinimalUI=1

" Display current file in the NERDTree ont the left
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
nnoremap <silent> <leader>nn :NERDTreeToggle<CR>


"-------------------------
" vim-bookmarks
let g:bookmark_no_default_key_mappings = 1
nmap <Leader>m <Plug>BookmarkToggle
" nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>l <Plug>BookmarkShowAll
" nmap <Leader>j <Plug>BookmarkNext
" nmap <Leader>k <Plug>BookmarkPrev
" nmap <Leader>c <Plug>BookmarkClear
" nmap <Leader>x <Plug>BookmarkClearAll
" nmap <Leader>kk <Plug>BookmarkMoveUp
" nmap <Leader>jj <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine

"--------------------------------------------------
" General options

" Enable per-directory .vimrc files and disable unsafe commands in them
"set exrc secure

" Set up leader key <leader>, i use default \
"let mapleader = ','

" Buffer will be hidden instead of closed when no one display it
set hidden

" enable mouse support for window
set mouse=a

" enlong the leader key combination typing
set timeoutlen=2000

" Auto reload changed files
set autoread

"Always draw the signcolumn.
set signcolumn=yes

" Always change current directory to current-editing-file dir
"set autochdir

" Indicates fast terminal connection
set ttyfast

" Set character encoding to use in vim
set encoding=utf-8

" Let vim know what encoding we use in our terminal
set termencoding=utf-8

" Which EOl used. For us it's unix
" Not works with modifiable=no
if &modifiable
    set fileformat=unix
endif

" Enable Tcl interface. Not sure what is exactly mean.
" hset infercase

" Interprete all files like binary and disable many features.
" set binary

"--------------------------------------------------
" Display/View options

" 启用truecolor rendering
set termguicolors

" Hide showmode
" Showmode is useless with airline
set noshowmode

" Show file name in window title
set title

" open preview window at bottom
set splitbelow

" Hide preview window for completion
" set completeopt-=preview
set completeopt=menu,noinsert


" Mute error bell
set novisualbell

" Remove all useless messages like intro screen and use abbreviation like RO
" instead readonly and + instead modified
set shortmess=atI

" Enable display whitespace characters
set list

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" Wrap line only on characters in breakat list like ^I!@*-+;:,./?
" Useless with nowrap
" set linebreak

" Numbers of lines to scroll when the cursor get off the screen
" Useless with scrolloff
" set scrolljump=5

" Numbers of columns to scroll when the cursor get off the screen
" Useless with sidescrollof
" set sidescroll=4

" Numbers of rows to keep to the left and to the right off the screen
set scrolloff=10

" Numbers of columns to keep to the left and to the right off the screen
set sidescrolloff=10

" Vim will move to the previous/next line after reaching first/last char in
" the line with this command (you can add 'h' or 'l' here as well)
" <,> stand for arrows in command mode and [,] arrows in visual mode
set whichwrap=b,s,<,>,[,],

" Display command which you typing and other command related stuff
set showcmd

" Indicate that last window have a statusline too
set laststatus=2

" The cursor should stay where you leave it, instead of moving to the first non
" blank of the line
set nostartofline

" Disable wrapping long string
" set nowrap
set wrap linebreak nolist


" Display Line numbers
set number relativenumber

" Highlight line with cursor
set cursorline

" Maximum text length at 80 symbols, vim automatically breaks longer lines
" set textwidth=80

" Highlight column right after max textwidth
" set colorcolumn=+1


"--------------------------------------------------
" Tab options

" Copy indent from previous line
set autoindent

" Enable smart indent. It add additional indents whe necessary
set smartindent

" Replace tabs with spaces
" set expandtab

" When you hit tab at start of line, indent added according to shiftwidth value
set smarttab


" Number of spaces to use for each step of indent
" set shiftwidth=4

" Number of spaces that a Tab in the file counts for
" set tabstop=4

" but in most cases tabstop and softtabstop better be the same
" set softtabstop=4


" when setting tabstop=4 there're some wired shit going on when open a new
" line that tabsize doesnt seems right at all
set shiftwidth=8
set softtabstop=8
set tabstop=8
set noexpandtab

" Round indent to multiple of 'shiftwidth'.
" Indentation always be multiple of shiftwidth
" Applies to  < and > command
set shiftround

"--------------------------------------------------
" Search options

" Add the g flag to search/replace by default
set gdefault

" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" Disable highlighting search result on Enter key
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Show matching brackets
set showmatch

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

"--------------------------------------------------
" Wildmenu

set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor


"--------------------------------------------------
" Folding

" set foldmethod=indent
set foldmethod=syntax
set nofoldenable

" Keymap to toggle folds with space
nmap <F9> zA

"--------------------------------------------------
" Edit

" Allow backspace to remove indents, newlines and old text
set backspace=indent,eol,start

" toggle paste mode on \p
set pastetoggle=<leader>p

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" Disable backups file
set nobackup

" Disable vim common sequence for saving.
" By default vim write buffer to a new file, then delete original file
" then rename the new file.
set nowritebackup

" Disable swp files
set noswapfile

" Do not add eol at the end of file.
set noeol

" Spellcheck
" set spell spelllang=en_us

"--------------------------------------------------
" Diff Options

" Display filler
set diffopt=filler

" Open diff in horizontal buffer
set diffopt+=vertical

" Ignore changes in whitespaces characters
set diffopt+=iwhite

" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic

"--------------------------------------------------
" Navigate Options

map H ^
map L $

" Moving between splits
nnoremap <C-Left> gT
nnoremap <C-Right> gt

"-------------------------------------------------- 
" personal options


" Open new tab

" quit & write
nnoremap <silent><leader>q :q<CR>
nnoremap <silent><leader>w :w<CR>

" yank to system clipboard
vnoremap <silent><leader>y "+y<CR>

nnoremap j gj
nnoremap k gk

" completion popup behaviour
" https://unix.stackexchange.com/questions/162528/select-an-item-in-vim-autocomplete-list-without-inserting-line-break
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"


" others
nnoremap <s-tab> <c-w>w

" new stuff
nnoremap <silent> <space>nt :tabnew<CR>
" new vertical
nnoremap <silent> <space>nv :vertical new<CR>


"-------------------------------------------------- 
" diff git, copied from https://brookhong.github.io/2016/09/03/view-diff-file-side-by-side-in-vim.html
"
function! Vimdiff()
    let lines = getline(0, '$')
    let la = []
    let lb = []
    for line in lines
        if line[0] == '-'
            call add(la, line[1:])
        elseif line[0] == '+'
            call add(lb, line[1:])
        else
            call add(la, line)
            call add(lb, line)
        endif
    endfor
    tabnew
    set bt=nofile
    vertical new
    set bt=nofile
    call append(0, la)
    diffthis
    exe "normal \<C-W>l"
    call append(0, lb)
    diffthis
endfunction
autocmd FileType diff       nnoremap <silent> <leader>vd :call Vimdiff()<CR>
autocmd FileType git       nnoremap <silent> <leader>vd :call Vimdiff()<CR>

"-------------------------------------------------- 
" Options config copied from https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
"

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" todo: find a better way to handle this
":: <leader>s for live Rg search
noremap <leader>s :LRg

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" let g:fzf_layout = { 'down': '~30%' }
command! -bang -nargs=* LRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" function! s:list_cmd()
"   let base = fnamemodify(expand('%'), ':h:.:S')
"   return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
" endfunction
" 
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
"   \                               'options': '--tiebreak=index'}, <bang>0)





"--------------------------------------------------
" Quickfix window
" https://vim.fandom.com/wiki/Toggle_to_open_or_close_the_quickfix_window
nmap <F4> :QFix<CR>

command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction



"--------------------------------------------------
" Quickfix window size
" https://vim.fandom.com/wiki/Automatically_fitting_a_quickfix_window_height
au FileType qf call AdjustWindowHeight(5, 23)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction


"--------------------------------------------------
" Autocmd

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Set filetypes aliases
au FileType scss set ft=scss.css
au FileType less set ft=less.css

" no syntax highlight for 1 million lines
au BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif

" au BufRead,BufNewFile *.json set ft=json
" autocmd BufNewFile,BufRead *.ts set filetype=typescript



" Disable vertical line at max string length in NERDTree
autocmd FileType * setlocal colorcolumn=+1
autocmd FileType nerdtree setlocal colorcolumn=""

" nerdtree config, https://github.com/scrooloose/nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" auto save on focus lost
au FocusLost * silent! wa

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()


" vim-easymotion disturbs diagnostics
" https://github.com/neoclide/coc.nvim/issues/110
let g:easymotion#is_active = 0
function! EasyMotionCoc() abort
  if EasyMotion#is_active()
    let g:easymotion#is_active = 1
    CocDisable
  else
    if g:easymotion#is_active == 1
      let g:easymotion#is_active = 0
      CocEnable
    endif
  endif
endfunction
autocmd TextChanged,CursorMoved * call EasyMotionCoc()
