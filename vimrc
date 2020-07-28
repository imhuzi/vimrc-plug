"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> Plugins management
"    -> General
"    -> VIM user interface
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> User functions
"    -> Abbreviations
"    -> Colors and Fonts
"    -> Plugin settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins management: vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins to be installed
call plug#begin()
"----------------------------------
" development/programming tools
"----------------------------------
"--- Language specific/syntax checking ---
Plug 'jvirtanen/vim-octave'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'NLKNguyen/c-syntax.vim'
"Plug 'klen/python-mode'
"Plug 'JuliaEditorSupport/julia-vim'
Plug 'scrooloose/syntastic'

" --- Directory Listing ---
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } " Fuzzy finder
Plug 'junegunn/fzf.vim' " Fuzzy finder plugin
Plug 'vim-scripts/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" --- Comments ---
Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-commentary'
"Plug 'tomtom/tcomment_vim'

" --- Code Formatting ---
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'

" --- Autocompletion---
Plug 'Valloric/YouCompleteMe', {'do' : 'python3 install.py --clang-completer'}
"snippets
""Plug 'msanders/snipmate.vim'
"Plug 'MarcWeber/vim-addon-mw-utils'|Plug 'tomtom/tlib_vim'|Plug 'garbas/vim-snipmate'
" Optional:
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" --- Git ---
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim'

" --- Command line Integration ---
Plug 'benmills/vimux'
Plug 'oplatek/Conque-Shell'

" --- Misc ---
Plug 'vim-scripts/supertab'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'

"----------------------------------
" document writing and note taking
"----------------------------------
Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
"use fork from DENG Yao for glossary compatibility
Plug 'yxrdydh/vim-latex-live-preview'
"Plug 'xuhdev/vim-latex-live-preview'
"Plug 'vimwiki/vimwiki'
Plug 'rhysd/vim-grammarous' 

"----------------------------------
" colorschemes and themes
"----------------------------------
Plug 'powerline/powerline-fonts'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'romainl/Apprentice'
Plug 'ayu-theme/ayu-vim'
Plug 'sjl/badwolf'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'croaker/mustang-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jacoborus/tender.vim'
Plug 'veloce/vim-aldmeris'
Plug 'w0ng/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'zeis/vim-kolor'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Sets how many lines of history VIM has to remember
set history=700

" Use many muchos levels of undo
set undolevels=700

" Set to auto read when a file is changed from the outside
set autoread

" Automatically set working directory to the current directory of the file
"set autochdir
cd %:p:h
"autocmd BufEnter * silent! lcd %:p:h

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" quickly open vimrc for editing
nnoremap <leader>rc :tabedit $MYVIMRC<CR>
nnoremap <leader>rl :source $MYVIMRC<CR>
" load vimrc immediately after changes -- may cause conflicts with
" autocomplete plugins
"augroup myvimrc
"    au!
"    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup END
"



" copy to clipboard with Ctrl-C

 vmap <C-c> "+yi
 vmap <C-x> "+c
" paste from clipboard with Ctrl-V
 vmap <C-v> c<ESC>"+p
 imap <C-v> <C-r><C-o>+

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on the WiLd menu
" wildmenu and wildmode are used for command line completion.
set wildmenu
set wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.aux,*.bbl,*.blg,*.lof,*.log,*.lot,*.toc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Automatically wrap left and right
set whichwrap+=<,>,h,l,[,]

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" No annoying sound on errors
set noerrorbells
set novisualbell

" Use visual bell instead of beeping when doing something wrong
" set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Display line numbers on the left
set number

" Enable use of the mouse for all modes
set mouse=a

" Hide the mouse when characters are typed
set mousehide

" improve popup menu behavior for autocompletion
set completeopt=longest,menuone

" when running diff, use vertical split
set diffopt+=vertical

" Show tab characters in Python. Visual Whitespace.
autocmd filetype python,xml set list
autocmd filetype python,xml set listchars=tab:>.,trail:.,extends:#,nbsp:.

" If running gvim, set window styles and fonts
if has("gui_running")
   " set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
    "set guifont=Inconsolata-g\ for\ Powerline\ 11
    "set guifont=Terminus\ for\ Powerline\ 12
    set guifont=MesloLGSForPowerline-Regular:h16
    set guioptions-=T "remove toolbars
    set guioptions-=m "remove menu bars
    set guioptions-=r "remove right hand scroll bar
    set guioptions-=L "remove left hand scoll bar
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Go to last files is invoked without arguments
" make session files upon exiting
"autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
"    \ call mkdir($HOME . "/.vim") |
"    \ endif |
"    \ execute "mksession! " . $HOME . "/.vim/Session.vim"
"" load seesion files upon starting
"autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
"    \ execute "source " . $HOME . "/.vim/Session.vim"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

" tell vim to display as many long lines as possible
set display+=lastline


" Stop certain movements from always going to the first character of a line.
" " While this behaviour deviates from that of Vi, it does what most users
" " coming from other editors would expect.
set nostartofline


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search)
map <space> /

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>
" Cycle through listed buffers
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tt :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabp<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>

" Specify the behavior when switching between buffers 
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

"function! Tabbufn()
"    let s:tab_count = tabpagenr('$')
"    if s:tab_count <= 1
"        :bn
"    else
"        :tabnext
"    endif
"endfunction
"function! Tabbufp()
"    let s:tab_count = tabpagenr('$')
"    if s:tab_count <= 1
"        :bp
"    else
"        :tabprev
"    endif
"endfunction
"nnoremap <silent> <leader>tn :call Tabbufp()<CR>
"nnoremap <silent> <Leader>tp :call Tabbufn()<CR>

" nnoremap <silent> <LocalLeader>[ :call Tabbufp()<CR>
" nnoremap <silent> <LocalLeader>] :call Tabbufn()<CR>

""""""""""""""""""""""""""""""
" => autocamd
""""""""""""""""""""""""""""""
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif

    " This causes colon, underscore and hyphen to be added to the 'iskeyword' variable only
    " when editing .tex files, then ctrlp plugin <C-p> can do completion for LaTeX References in Vim
    autocmd BufRead,BufNewFile *.tex set iskeyword+=:,-,_

    " This causes some characters to be added to the 'iskeyword' variable only
    " when editing .c,.h,.cpp,.cc files, then ctrlp plugin <C-p> can do completion for LaTeX References in Vim
    autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.cc set iskeyword+=:,-,_,>

    " Normally don't automatically format 'text' as it is typed, only do this
    " with comments, at 79 characters.
    au BufNewFile,BufEnter *.c,*.h,*.java,*.jsp set formatoptions-=t tw=79

    " add an autocommand to update an existing time stamp when writing the file 
    " It uses the functions above to replace the time stamp and restores cursor 
    " position afterwards (this is from the FAQ) 
    autocmd BufWritePre,FileWritePre * ks|call UpdateTimeStamp()|'s

    " Delete trailing white space on save, useful for Python and CoffeeScript
    func! DeleteTrailingWS()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
    endfunc
    autocmd BufWrite *.py :call DeleteTrailingWS()
    autocmd BufWrite *.coffee :call DeleteTrailingWS()

endif " has("autocmd")

" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\[%{&ff}:%{&fenc}:%Y]\ \ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\%r%{getcwd()}%h\ %=\ \Line:\ %5l/%5L\ \ \ \Column:\ %5c\ \[%P%*]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader> to navigate between misspellings
map <leader>sn ]s
map <leader>sp [s
map <leader>sa z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Subfunction for VisualSelection
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

" Visual mode related function
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Subfunction for status line
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Time stamp function for track coding log
" first add a function that returns a time stamp in the desired format 
if !exists("*TimeStamp")
    fun TimeStamp()
        return "Last modified: " . strftime("%d %b %Y %X")
    endfun
endif

" searches the first ten lines for the timestamp 
" and update using the TimeStamp function
if !exists("*UpdateTimeStamp")
    function! UpdateTimeStamp()
        " let l:timestamp_filetype_blacklist = ['text']
        " Do the update only if the current buffer is modified 
        " and filetype is not blacklisted (empty is blacklisted by default)
        " if &modified == 1  && index(l:timestamp_filetype_blacklist, &filetype) == -1
        if &modified == 1
            " go to the first line
            exec "1"
            " Search for Last modified string:
            let modified_line_no = search("Last modified:")
            if modified_line_no==0
                let l:timestamp_input=input('No last modified string found, add new time stamp?(y)')
                if l:timestamp_input == 'y' || l:timestamp_input == 'Y'
                    let l:commentstring = split(&commentstring,'%s')[0]
                    let l:commentstringrev = join(reverse(split(l:commentstring,'\zs')),'')
                    call append(line('^')+1, l:commentstring.' '.TimeStamp().' '.l:commentstringrev)
                else
                    echom 'Abort'
                end
            elseif modified_line_no < 10
                " There is a match in first 10 lines 
                " Go to this 'Last modified' line
                exe "s/Last modified: .*/" . TimeStamp()
            endif
        endif
    endfunction
endif

" Run Shell commands in Vim
function! s:ExecuteInShell(command)
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! execute 'resize ' . line('$')
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
    echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" abbreviation to manually enter a timestamp. Just type YTS in insert mode 
iab YTS <C-R>=TimeStamp()<CR>

" Date/Time stamps
" %a - Day of the week
" %b - Month
" %d - Day of the month
" %Y - Year
" %H - Hour
" %M - Minute
" %S - Seconds
" %Z - Time Zone
iab YDATETIME <c-r>=strftime(": %a %b %d, %Y %H:%M:%S %Z")<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
syntax on 

" Enable true colors support
set t_Co=256

nnoremap <silent> <leader>bg :call ToggleBackground()<CR>
function! ToggleBackground()
    if &background == "light"
        set background=dark
        try 
            colorscheme gruvbox
        catch 
        endtry
    else
        set background=light
        try 
            colorscheme hybrid_material
        catch 
        endtry
    endif
endfunction


" Tell vim to use colors which look good on a dark/light background
set background=dark
" Color scheme
try
    colorscheme gruvbox
catch
endtry

" Highlight current cursor line, <leader>c to toggle on and off
set nocursorline
hi CursorLine cterm=NONE ctermbg=grey ctermfg=white guibg=grey guifg=white
nnoremap <leader>c :set cursorline!<CR>

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Commands and Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" maps to run latex compile
" noremap <C-d> :Shell Compile.sh p 
" noremap <C-x> :Shell Compile.sh x
" maps for Tagbar and Ctags
nnoremap <silent> <F9> :TagbarToggle<CR>
" maps for Syntastic
nnoremap <silent> <F8> :Errors<CR>
nnoremap <silent> <F7> :lclose<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Qihang's addition
" " => Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF 
" -----------------------------------------------------------
"nnoremap <silent><leader><leader> :execute 'Files '.expand('%:h')<CR><CR>
if has('gui_running')
    " fzf not working well with gvim and terminal emulator
    " use CtrlP instead
    nnoremap <silent><leader><leader> :CtrlP<CR>
else
    nnoremap <silent><leader><leader> :execute 'Files '.$PWD<CR><CR>
endif
"expand the current directory

"under gvim fzf requires a terminal emulator
" This is the default. %s is replaced with fzf command
"let g:fzf_launcher = 'xterm -e bash -ic %s'
" Use urxvt instead
"let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'

" -----------------------------------------------------------
" OCTAVE SYNTAX
" -----------------------------------------------------------
"augroup filetypedetect
"    au! BufRead,BufNewFile *.m,*.oct set filetype=octave
"augroup end
"" Use keywords from Octave syntax language file for autocomplete
"if has("autocmd") && exists("+omnifunc")
"    autocmd Filetype octave
"                \ if &omnifunc == ""|
"                \ setlocal omnifunc=syntaxcomplete#Complete |
"                \ endif
"endif

function! SetOctaveOptions()
    if exists("+omnifunc")
        " Use keywords from Octave syntax language file for autocomplete
        if &omnifunc == ""
            setlocal omnifunc=syntaxcomplete#Complete
        endif
    endif
    set filetype=octave
    let &commentstring="% %s"
endfunction

augroup filetypedetect
    au! BufRead,BufNewFile,BufEnter *.m,*.oct call SetOctaveOptions()
augroup end

"---------------------------------------------------------------
" LATEX LIVE PREVIEWER
" --------------------------------------------------------------
let g:livepreview_previewer = 'open -a Skim'

function! SetTexOptions()
    nmap<F6> :LLPStartPreview<CR>
    nmap j gj
    nmap k gk
    set background=light 
    colorscheme hybrid_material
    :AirlineTheme papercolor
endfunction

autocmd Filetype tex call SetTexOptions()
"autocmd BufRead,BufNewFile *.tex nmap<F6> :LLPStartPreview<CR>
"autocmd BufRead,BufNewFile *.tex nmap j gj
"autocmd BufRead,BufNewFile *.tex nmap k gk
"autocmd BufRead,BufNewFile *.tex set background=light colorscheme hybrid-color

"-------------------------------------------------------------
" VIMTEX
" ------------------------------------------------------------
if has('unix')
    if has('mac')
        let g:vimtex_view_method = "skim"
        let g:vimtex_view_general_viewer
                \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
        let g:vimtex_view_general_options = '-r @line @pdf @tex'

        " This adds a callback hook that updates Skim after compilation
        let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
        function! UpdateSkim(status)
            if !a:status | return | endif

            let l:out = b:vimtex.out()
            let l:tex = expand('%:p')
            let l:cmd = [g:vimtex_view_general_viewer, '-r']
            if !empty(system('pgrep Skim'))
            call extend(l:cmd, ['-g'])
            endif
            if has('nvim')
            call jobstart(l:cmd + [line('.'), l:out, l:tex])
            elseif has('job')
            call job_start(l:cmd + [line('.'), l:out, l:tex])
            else
            call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
            endif
        endfunction
    else
        let g:latex_view_general_viewer = "zathura"
        let g:vimtex_view_method = "zathura"
    endif
elseif has('win32')

endif


let g:vimtex_fold_enable = 1
let g:latex_complete_close_braces = 1
" concealing operators
let g:tex_conceal=''
"let g:tex_conceal = 'abdmgs'

"-------------------------------------------------------------
" AIRLINE
" ------------------------------------------------------------

" enable powerline fonts
let g:airline_powerline_fonts = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" show tab number in tabline 
let g:airline#extensions#tabline#tab_nr_type = 1
" make the filename in buffer shorter, not the full path
let g:airline#extensions#tabline#fnamemod=':t'
" show buffer number in tabline
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#vimtex#left = ""
let g:airline#extensions#vimtex#right = ""

"  airline symbols dictionary
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"" unicode symbols, for multiple definitions choose one
""let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
""let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
""let g:airline_symbols.linenr = '☰'
""let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
""let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = ''
""let g:airline_symbols.maxlinenr = '㏑'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
""let g:airline_symbols.paste = 'Þ'
""let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = 'Ɇ'
"let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols, needed if powerline fonts are installed
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
"-------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------
" shortcut to start NERDTree
map <C-n> :NERDTreeToggle<CR>
" start NERDTree upon startup at move cursor to editing area
autocmd vimenter * NERDTree | wincmd p
" open NERDTree when vim startsup if no files specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree when vim startsup with directory specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Auto close NERDTree if no more files

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Show hidden files in NERDTree
let NERDTreeShowHidden=1


" -----------------------------------------------------------
" MARKDOWN PREVIEW
" -----------------------------------------------------------
autocmd BufRead,BufNewFile *.md nmap<silent><F6> <Plug>MarkdownPreview
autocmd BufRead,BufNewFile *.md nmap<silent><F5> <Plug>StopMarkdownPreview
autocmd BufRead,BufNewFile *.md nmap<silent><F6> <Plug>MarkdownPreview
autocmd BufRead,BufNewFile *.md imap<silent><F5> <Plug>StopMarkdownPreview


" -----------------------------------------------------------
" YCM AUTOCOMPLETION
" -----------------------------------------------------------
"Close popup menu upon leaving insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 


"Up and down key will perform as they are
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

"turn on autocompletion based on tag files
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1  
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
"let g:ycm_filetype_blacklist = {
                            \ 'tagbar' : 1,
                            \ 'nerdtree' : 1,
                            \ 'tex' : 1,
                            \ 'vim' : 1,
                            \}

" resolve <TAB> <S-TAB> conflict with ultisnips
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" C function autocomplete: from C-space to alt+space
let g:ycm_key_invoke_completion = '<M-;>'

set shortmess+=c



" -----------------------------------------------------------
" SNIPPET_RELATED
" -----------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-e>"
" location where snippets are saved
let g:UltiSnipsSnippetDirectories=["plugged/vim-snippets/UltiSnips"]

" function to differentiate usage of tab under ultisnip/ycm
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" Expand snippet or return
let g:ulti_expand_res = 1
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction
" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

" -----------------------------------------------------------
" INDENTLINE 
" -----------------------------------------------------------
" stop indentline from concealing quotes
" let g:indentLine_conceallevel = 0
"let g:vim_json_syntax_conceal = 0
"let g:indentLine_char = '┊'
"let g:indentLine_concealcursor = 'nc'
"let g:indentLine_setConceal = 0
"let g:indentLine_enabled = 0 
"let g:indentLine_setColors = 0
"
"
" -----------------------------------------------------------
" CONQUE-SHELL
" -----------------------------------------------------------
"  default shortcuts
"  <F9> send selected blocks to an opened conque-shell and execute
"  <F10> send current file to an opened conque-shell and execute
"  <F11> open a conque-shell and execute current file
"  user shortcuts
nnoremap \cs :ConqueTermSplit
nnoremap \cb :ConqueTermSplit bash<CR><CR>
nnoremap \cvb :ConqueTermVSplit bash<CR><CR>

" -----------------------------------------------------------
" CPP ENHANCED HIGHLIGHTING
" -----------------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"works in most cases, maybe slow on large files
let g:cpp_experimental_simple_template_highlight = 1
"faster implementation but doesn't always work
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1 "library concepts

" -----------------------------------------------------------
" NERD COMMENTER
" -----------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" -----------------------------------------------------------
" CTRLP
" -----------------------------------------------------------
" start ctrlp in buffer mode, finding files are better done by fzf
let g:ctrlp_cmd='CtrlPBuffer'


" -----------------------------------------------------------
" GRAMMAROUS
" -----------------------------------------------------------
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0, 'tex': 0,
            \ }

" -----------------------------------------------------------
" COLORSCHEME 
" -----------------------------------------------------------
" badwolf
let g:badwolf_darkgutter = 1 "make gutter darker than background


