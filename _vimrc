" URL: http://vim.wikia.com/wiki/Example_vimrc
" vim: foldmethod=marker
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"## Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Enable syntax highlighting
syntax on
" }}}1


" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
" }}}1


" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
"set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse+=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number
set numberwidth=1 

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Set 'paste' and 'nopaste'
nmap ,, :set paste<CR>
nmap ,q :set nopaste<CR>
" }}}1


" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2
" }}}1


" Mappings {{{1
" Set leader key
let g:mapleader='\'

" Search realated mappings {{{2
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Search selected text
vnoremap * y/\V<C-R>=escape(@@,"/\\")<CR><CR>

" Map <C-Q>l (redraw screen) to also turn off search highlighting until the
" next search
"nnoremap <C-Q>l :nohl<CR><C-Q>l
"nnoremap <CR> :nohlsearch<CR><CR>
" }}}2

" Naviation mappings {{{2
" Easy movement between windows
set winminheight=0
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <c-w>h
nmap <C-l> <c-w>l
nmap q <C-W>c

" Make the navigation on insert mode easier
imap <C-j> <down>
imap <C-k> <up>
imap <C-B> <Left>
imap <C-F> <Right>
imap <C-D> <Del>
imap <C-A> <Home>
imap <C-BS> <C-O>B<C-O>dE
inoremap <C-E> <C-R>=col('.') == col('$') ? "\<lt>C-E>" : "\<lt>End>"<CR>

" Following key maps will make command mode's navigation easier
cnoremap <C-A> <Home>
cnoremap <C-B> <left>
cnoremap <C-F> <right>
cnoremap <C-X> <Del>

" Following key maps will make increase/decrease the width/height of window easier
nmap - <C-W>-
nmap = <C-W>+
nmap _ 5<C-W><
nmap + 5<C-W>>

" Mappings for quickfix mode 
nnoremap <xF4>   :cnext \| norm zz<CR>
nnoremap <S-xF4> :cprev \| norm zz<CR>
noremap <C-F4>   :cnfile <CR>
nnoremap <S-C-F4> :cpfile <CR>

" Make it easy to upload/reload .vimrc
if has("gui_running")
  nmap ,s :source $HOME/.vimrc \| source $HOME/.gvimrc<CR>
else
  nmap ,s :source $HOME/.vimrc<CR>
endif
nmap ,v :e $HOME/.vimrc<CR> 
"}}}2

" Folder mappings{{{2
nnoremap <leader><SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

augroup folder
  autocmd!
  autocmd BufReadPost	*.go,*.js,*.coffee  setlocal foldmethod=syntax nofoldenable foldnestmax=3
augroup END
" }}}2

" Shell related TODO{{{2
" Ctrl_W e opens up a vimshell in a vertically split window
" Ctrl_W E opens up a vimshell in a vertically split window
" The shell window will be auto closed after termination
nmap <C-W>e :new \| vimshell bash<CR>
nmap <C-W>E :vnew \| vimshell bash<CR>
" }}}2

" Shift Text and indent http://vim.wikia.com/wiki/Shifting_blocks_visually {{{2
vnoremap > >gv
vnoremap < <gv
inoremap <S-Tab> <C-D>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" }}}2

" Map Q to q, for it's relly a rare used {{{2
nnoremap Q q
"}}}2

" Use space to trigger command mode {{{2
nnoremap <SPACE> :
"}}}2

" Copy, Paste related {{{2
" The default delete is sucking, it will recover the register  
nnoremap <leader>d "_d
vnoremap <leader>d "_d
"vnoremap <leader>p "_dP
" copy and paste text accross different vim process
vnoremap <leader>y "+y
vnoremap <leader>x "+x
nnoremap <leader>p "+p

" }}}2

" Saeve file{{{2
"http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %
" }}}2

"}}}1


" File options {{{1
" Dont bother me with swap files{{{2
set noswapfile
" }}}2
"}}}1


" Autocmds {{{1
" Load Golang plugin"{{{2
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
"}}}2

"auto format when saving files {{{2

" Golang (*.go)  file will be gofmt when saving file {{{3
au BufWritePost *.go :silent Fmt
"}}}3

" Javascript (*.js) file will be formated when saving file {{{3
" autocmd BufWritePost *.js :call g:Jsbeautify()
"}}}3
"}}}2

" Use 8 spaces as indent for Golang {{{2
autocmd FileType go,coffee setlocal et sta shiftwidth=8 softtabstop=8 | set expandtab
" }}}2

set autoread
" }}}1


" Plugin Related {{{1
" Use Vunble {{{2
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
source ~/.vim/VundleFile
filetype plugin indent on
"}}}2

" Settings for comments.vim {{{2
let g:comments_map_keys = 0
" key-mappings for comment line in normal mode
noremap  <silent> <C-c> :call CommentLine()<CR>
" key-mappings for range comment lines in visual <Shift-V> mode
vnoremap <silent> <C-c> :call RangeCommentLine()<CR>
" key-mappings for un-comment line in normal mode
noremap  <silent> <C-x> :call UnCommentLine()<CR>
" key-mappings for range un-comment lines in visual <Shift-V> mode
vnoremap <silent> <C-x> :call RangeUnCommentLine()<CR>
" }}}2

" Settings for current_func_info.vim {{{2
noremap <C-@>f  :echo cfi#format("%s\n", "")<CR>
" }}}2

" Open directory with NERDTree {{{2
autocmd VimEnter * call OpenWithNERDTree()

function! OpenWithNERDTree()
  if 0 == argc()
    NERDTree
  endif
endfunction
" }}}2

" Trigger Dash {{{2
nmap <silent> ,d <Plug>DashSearch
"}}}2

" Settings for FuzzyFinder {{{2
nnoremap <C-P>  :FufCoverageFile!<cr>
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(tmp|log|db/migrate|vendor)'
let g:fuf_enumeratingLimit = 5000
let g:fuf_coveragefile_prompt = '=>'
" }}}2

" Ack Mappings {{{2
" high light search result
let g:ackhighlight = 1

nmap <C-A> :call AckWord()<CR>
vmap <C-A> :call AckWordV()<CR>
nmap <C-@>l :call AckDoubleQuote()<CR>

function! AckWord() "{{{3
  let l:cWord = expand("<cword>")
  if empty(l:cWord)
    echo "Please selece a word"
  else
    exe ":Ack"  l:cWord
  endif 
endfunction
"}}}3

function! AckWordV() "{{{3
   let l:selectedText = s:get_visual_selection()
   let l:wds = split(l:selectedText, " ")
	 let joinedWords = join(l:wds)
	 let searchText = "\"".joinedWords."\""
   exe ":Ack"  searchText
endfunction
"}}}3

function! AckDoubleQuote() "{{{3
	let l:curLine = getline(".")
	if empty(l:curLine)
		echo "empty line"
		return
	endif 
	let l:arr = matchstr(l:curLine, '[\"].*\"')
	let l:matchedText = l:arr[1:-2]
	if l:matchedText != ""
   	exe ":Ack"  l:matchedText
	else
		let l:arr2 = matchstr(l:curLine, "[\'].*\'")
		let l:matchedText2 = l:arr2[1:-2]
		if l:matchedText2 != ""
			exe ":Ack"  l:matchedText2
		endif
	endif
endfunction
"}}}3

function! s:get_visual_selection() "{{{3
	 " Why is this not a built-in Vim script function?!
	 let [lnum1, col1] = getpos("'<")[1:2]
	 let [lnum2, col2] = getpos("'>")[1:2]
	 let lines = getline(lnum1, lnum2)
	 let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ?  1 : 2)]
	 let lines[0] = lines[0][col1 - 1:]
	 return join(lines, "\n")
endfunction
"}}}3
" }}}2

" Settings for YouCompleteMe{{{2
"set completeopt=menuone
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_strings = 0
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-N>']
let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_filetype_whitelist = { 
      "\ 'cpp' : 1,
      "\ 'c' : 1,
      "\ 'go' : 1,
      "\ 'js' : 1,
"\}

let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
\}

" }}}2
"
" Settings for Syntastic{{{2
let g:syntastic_check_on_wq=0
" }}}2

" Mappings for HexHighlight{{{2
nmap <leader>hl          <Plug>ToggleHexHighlight
nmap <leader>hs   <Plug>ToggleSchemeHighlight
" }}}2

" Mappings for Tagbar{{{2
nmap <leader>t :TagbarToggle<CR>

"Go {{{3
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }
"}}}3

"CoffeeScript {{{3
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagstype' : 'coffee',
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'o:object',
        \ 'v:variables',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" Posix regular expressions for matching interesting items. Since this will 
" be passed as an environment variable, no whitespace can exist in the options
" so [:space:] is used instead of normal whitespaces.
" Adapted from: https://gist.github.com/2901844
let s:ctags_opts = '
  \ --langdef=coffee
  \ --langmap=coffee:.coffee
  \ --regex-coffee=/(^|=[ \t])*class ([A-Za-z_][A-Za-z0-9_]+\.)*([A-Za-z_][A-Za-z0-9_]+)( extends ([A-Za-z][A-Za-z0-9_.]*)+)?$/\3/c,class/
  \ --regex-coffee=/^[ \t]*(module\.)?(exports\.)?@?(([A-Za-z][A-Za-z0-9_.]*)+):.*[-=]>.*$/\3/m,method/
  \ --regex-coffee=/^[ \t]*(module\.)?(exports\.)?(([A-Za-z][A-Za-z0-9_.]*)+)[ \t]*=.*[-=]>.*$/\3/f,function/
  \ --regex-coffee=/^[ \t]*(([A-Za-z][A-Za-z0-9_.]*)+)[ \t]*=[^->\n]*$/\1/v,variable/
  \ --regex-coffee=/^[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)[ \t]*=[^->\n]*$/\1/f,field/
  \ --regex-coffee=/^[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+):[^->\n]*$/\1/f,static field/
  \ --regex-coffee=/^[ \t]*(([A-Za-z][A-Za-z0-9_.]*)+):[^->\n]*$/\1/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?/\3/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){0}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){1}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){2}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){3}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){4}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){5}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){6}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){7}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){8}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){9}/\8/f,field/'

let $CTAGS = substitute(s:ctags_opts, '\v\([nst]\)', '\\', 'g')
"}}}3

" }}}2

" }}}1


" Color related {{{1
if !has("gui_running")
  set t_Co=256 " enable 256 colors refs: http://vim.wikia.com/wiki/256_colors_in_vim
endif
"colorscheme yesterday
colorscheme last-night
"colorscheme desert

" MiniBufExpl Colors {{{2
 hi MBENormal               guifg=#808080 guibg=fg
 hi MBESelecting            guifg=#BEEF13 guibg=fg
 hi MBEChanged              guifg=#CD5907 guibg=fg
 hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
 hi MBEVisibleChanged       guifg=#F1266F guibg=fg
 hi MBEVisibleActiveNormal  guifg=#FF7B29 guibg=fg
 hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
" }}}2
" }}}1


" Font related {{{1
if has("gui_running")
  set guifont=Monaco:h14
endif
" }}}1


" Customlize Related {{{1
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

" GenTag {{{2
nmap <C-\> :call GenTags()<CR>

function! GenTags()
  let s:r0 = system("rm ./tags")
  if empty(s:r0)
    echo "old tags removed"
  else
    "echoerr s:r0
  endif

  let s:r1 = system("ctags -aR --languages=go ../../../")
  if empty(s:r1)
    echo "Tag gernated"
  else
    "echoerr s:r1
  endif
endfunction

" SwirchRoot {{{2
nmap <leader>cd :call SwitchRoot()<CR>

function! SwitchRoot()
  let cp = expand("%:p:h")
  let paths = split(cp, "/")
  let to_path = ""
  let root_map = {"github.com":2, "labix.org":3, "launchpad.net": 1}
  for r in ["github.com", "labix.org", "launchpad.net"]
    let i = index(paths, r)
    if i == -1
      continue
    endif
    let j = 0
    while j <= i+root_map[r]
      let to_path .= "/".paths[j]
      let j += 1
    endwhile
  endfor
  if to_path != ""
    let cmd="lcd ".to_path
    execute cmd
    call nerdtree#closeTreeIfOpen()
    call NERDTreeCWD()
    execute "normal \<C-l>"
    execute "normal \<C-j>"
  endif
endfunction

" }}}1


" Project Configurations "{{{1
" Jump to template file for Qortex Project {{{2
nmap <C-@>j :call JumpToTemplate()<CR>
function! JumpToTemplate()
  let l:curLine = getline(".")
  if empty(l:curLine)
    echo "empty line"
    return
  endif 
  let l:arr = matchstr(l:curLine, '\".*\"')

  let l:fn = "templates/".l:arr[1:-2].".html"
  if filewritable(l:fn)
    exec('e '.l:fn)
    return
  endif

  let l:paths = split(l:fn, "\/")	
  let l:alternateFile = (join(l:paths[:-2], "/")).'/_'.split(l:fn, "\/")[-1]
  if filewritable(l:alternateFile)
    exec('e '.l:alternateFile)
    return
  endif
endfunction
" }}}2

" Load Workspace 
let s:WorkspaceFileName = "workspace.vim"

function! GetWorkspaceFileName()
  let s:current_dir=getcwd()
  let s:root_dir='/'
  let l:workspace_file_full_path="/"
  while s:current_dir != s:root_dir
    let s:tmp_string=s:current_dir . "/" . s:WorkspaceFileName
    if filereadable(s:tmp_string)
      let l:workspace_file_full_path=s:tmp_string
      break
    endif
    let s:index=strridx(s:current_dir, "/")
    " if s:current_dir==”/home”, s:index will == 0, but strpart() needs
    " length == at least 1 to get ‘/’
    if s:index == 0
      let s:index=1
    endif
    " cut string, remove the characters after last '/'
    let s:current_dir=strpart(s:current_dir, 0, s:index)
  endwhile
  "return the full path of workspace file if succeeds, otherwise '/'
  return l:workspace_file_full_path
endfunction

" get full path of workspace file
let s:workspace_file_full_path=GetWorkspaceFileName()

if filereadable(s:workspace_file_full_path)
  exec 'source' . s:workspace_file_full_path
endif

" }}}1

