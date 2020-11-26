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

" Make sure you use single quotes
Plug 'flazz/vim-colorschemes'
" Tomorrow, Tomorrow-Night

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'easymotion/vim-easymotion'

Plug 'jremmen/vim-ripgrep'
let g:rg_command = 'rg --vimgrep -S'

" syntax
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
let g:typescript_indent_disable = 1
Plug 'peitalin/vim-jsx-typescript'

" LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
" install fzf with home brew
Plug '/usr/local/opt/fzf' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" let g:deoplete#enable_at_startup = 1

Plug 'jiangmiao/auto-pairs'

Plug 'MattesGroeger/vim-bookmarks'

Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/personalwiki/', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/workspace/js/lunr.js/vimwiki', 'syntax': 'markdown', 'ext': '.md'},
  \ ]
                      

Plug 'sirver/ultisnips'

" Initialize plugin system
call plug#end()


"--------------------------------------------------
" Bundles Settings
syntax on

" vim wiki suggested setting
filetype plugin on


"-------------------------
" LSP
"
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'go': ['~/go/bin/go-langserver'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


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
" search history
" nmap <silent> <leader>fhs :History/<cr>
nmap <silent> <leader>fw :Windows<cr>



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
" vim-airline

" Colorscheme for airline
let g:airline_theme='understated'

" Set custom left separator
let g:airline_left_sep = '▶'

" Set custom right separator
let g:airline_right_sep = '◀'

" Enable airline for tab-bar
let g:airline#extensions#tabline#enabled = 1

" Don't display buffers in tab-bar with single tab
let g:airline#extensions#tabline#show_buffers = 0

" Display only filename in tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't display encoding
let g:airline_section_y = ''

" Don't display filetype
" let g:airline_section_x = ''

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
"set hidden
"

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
" Display options

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

" Setting up how to display whitespace characters
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~

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

" Add a line / column display in the bottom right-hand section of the screen.
" Not needed with airline plugin
"set ruler

" Setting up right-hand section(ruller) format
" Not needed with airline plugin
"set rulerformat=%30(%=\:%y%m%r%w\ %l,%c%V\ %P%)

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
set colorcolumn=+1


"--------------------------------------------------
" Tab options

" Copy indent from previous line
set autoindent

" Enable smart indent. It add additional indents whe necessary
set smartindent

" Replace tabs with spaces
set expandtab

" When you hit tab at start of line, indent added according to shiftwidth value
set smarttab

" Number of spaces to use for each step of indent
set shiftwidth=2

" Number of spaces that a Tab in the file counts for
set tabstop=2

" but in most cases tabstop and softtabstop better be the same
set softtabstop=2

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

"--------------------------------------------------
" Wildmenu

" Extended autocompletion for commands
set wildmenu

" Autocmpletion hotkey
set wildcharm=<TAB>

"--------------------------------------------------
" Folding

set foldmethod=indent
set nofoldenable

" Keymap to toggle folds with space
nmap <space> za

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
set diffopt+=horizontal

" Ignore changes in whitespaces characters
set diffopt+=iwhite

"-------------------------------------------------- Hotkeys

" Open new tab
" nnoremap <silent><leader>tn :tabnew .<CR>

" Moving between splits
nnoremap <C-Left> gT
nnoremap <C-Right> gt

nnoremap gw <nop>
nnoremap gw <C-w>
nnoremap gl <C-w>w

nnoremap <C-P> :Files<CR>
" nnoremap <M-B>p :Buffers<CR>

nnoremap <silent><leader>q :q<CR>
nnoremap <silent><leader>w :w<CR>

" yank to system clipboard
vnoremap <silent><leader>y "+y<CR>

nnoremap j gj
nnoremap k gk

" https://unix.stackexchange.com/questions/162528/select-an-item-in-vim-autocomplete-list-without-inserting-line-break
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

" inoremap <C-x> <Esc>ddi

" Quickfix window
" https://vim.fandom.com/wiki/Toggle_to_open_or_close_the_quickfix_window
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

nmap <F4> :QFix<CR>
" end Quickfix window


" Quickfix window size
" https://vim.fandom.com/wiki/Automatically_fitting_a_quickfix_window_height
au FileType qf call AdjustWindowHeight(5, 23)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
" end Quickfix window size

"--------------------------------------------------
" Autocmd

" It executes specific command when specific events occured
" like reading or writing file, or open or close buffer
if has("autocmd")
    " Define group of commands,
    " Commands defined in .vimrc don't bind twice if .vimrc will reload
    augroup vimrc
    " Delete any previously defined autocommands
    au!
        " Auto reload vim after your change it
        au BufWritePost *.vim source $MYVIMRC | AirlineRefresh
        au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh

        " Restore cursor position :help last-position-jump
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal g'\"" | endif

        " Set filetypes aliases
        au FileType htmldjango set ft=html.htmldjango
        au FileType scss set ft=scss.css
        au FileType less set ft=less.css
        au BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
        au BufRead,BufNewFile *.json set ft=json
        " Execute python \ -mjson.tool for autoformatting *.json
        au BufRead,BufNewFile *.bemhtml set ft=javascript
        au BufRead,BufNewFile *.bemtree set ft=javascript
        au BufRead,BufNewFile *.xjst set ft=javascript
        au BufRead,BufNewFile *.tt2 set ft=tt2
        au BufRead,BufNewFile *.plaintex set ft=plaintex.tex
        autocmd BufNewFile,BufRead *.ts set filetype=typescript
        autocmd BufNewFile,BufRead *.tsx set filetype=typescript
        autocmd BufNewFile,BufRead *.jsx set filetype=typescript
        autocmd BufNewFile,BufRead *.js set filetype=typescript
        au BufRead,BufNewFile *.go set ft=go


        " Auto close preview window, it uses with tags,
        " I don't use it
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

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


        " Group end
    augroup END
endif


"--------------------------------------------------
" SwitchColor
let loaded_switchcolor = 1

let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
let s:swback = 0    " background variants light/dark was not yet switched
let s:swindex = 0

function! SwitchColor(swinc)

	" if have switched background: dark/light
	if (s:swback == 1)
		let s:swback = 0
		let s:swindex += a:swinc
		let i = s:swindex % len(s:swcolors)

		" in skip list
		if (index(s:swskip, s:swcolors[i]) == -1)
			execute "colorscheme " . s:swcolors[i]
		else
			return SwitchColor(a:swinc)
		endif

	else
		let s:swback = 1
		if (&background == "light")
			execute "set background=dark"
		else
			execute "set background=light"
		endif

		" roll back if background is not supported
		if (!exists('g:colors_name'))
			return SwitchColor(a:swinc)
		endif
	endif

	" show current name on screen. :h :echo-redraw
	redraw
	execute "colorscheme"
endfunction

nmap <F8>        :call SwitchColor(1)<CR>
imap <F8>   <Esc>:call SwitchColor(1)<CR>

nmap <S-F8>      :call SwitchColor(-1)<CR>
imap <S-F8> <Esc>:call SwitchColor(-1)<CR>

