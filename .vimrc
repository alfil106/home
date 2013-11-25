"http://www.vim.org/scripts/script.php?script_id=2332
"Add this to your vimrc:

call pathogen#infect()

"Now any plugins you wish to install can be extracted to a subdirectory under ~/.vim/bundle, and they will be added to the 'runtimepath'. 



set nu
"set autoindent
"set statusline=%F%m%r%h%w\ [type=%Y]\ [%p%%]\ [len=%L %c]
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"set statusline=%<%f\ [type=%Y]\ %h%m%r%=%-10.(%l,%c%V%)\ [len=%L]

hi StatusLine ctermbg=white ctermfg=black
"set statusline=[PATH=%F]\ [BUFFER=%N]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline=[PATH=%F]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\  [POS=%04l,%04v][%p%%]\ [LEN=%L]

set statusline=[PATH=%F]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " Always show the statusline on the 2nd last row

"Mouse and backspase
"set mouse=a "Activa el mouse con Alt-Gr :D
set bs=2

"Hilight trailing whitespace
:highlight TrailWhitespace ctermbg=red ctermfg=white guibg=red
:match TrailWhitespace /\s\+$\| \+\ze\t/

"Remove trailing whitespace
map <Leader><Space> :%s/\s\+$//g<CR>

"Run Perl script
nmap <F5> :!perl %<CR>

"Run python script
nmap <F6> :!python2 %<CR>

"Run Python Code from Vim ???
nmap <F7> :w <CR>!clear <CR>:!python2 % <CR>



"absolute line numbers in insert mode, relative in other mode
"au InsertEnter * :set nu
"au InsertLeave * :set rnu

"Show Tabs and Carriage Returns
set list
set listchars=tab:▸\ ,eol:¬

vnoremap < <gv "better indentation
vnoremap > >gv "better indentation

set history=700
set undolevels=700

"Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

set t_Co=256
"?? color wombat256mod

set tw=79
"set nowrap "!A mi no me agrada :S
set fo-=t "dont't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=white

"easier formatting of paragraphs
vmap Q gq
vmap Q gqap

"Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

"http://blog.desdelinux.net/como-ponerle-colores-a-las-sintaxis-en-vim/
"colorscheme rainbow_breeze

set expandtab "cambia los tabs por espacios
set ts=2 "un tab son 2 espacios
set spell "activa el corrector ortográfico, por defecto está el idioma inglés.
set spelllang=es,en "escoge el idioma español e inglés para el corrector ortográfico, se pueden poner más idiomas separados por comas.

"http://es.softuses.com/17618
au FileType python setl sw=2 sts=2 et




"http://masvale-manya.blogspot.mx/2011/03/vim-como-python-ide-ii.html
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
vnoremap ( s()<Esc>P
vnoremap [ s[]<Esc>P
vnoremap { s{}<Esc>P
vnoremap  '  s''<Esc>P<Right>
vnoremap  "  s""<Esc>P<Right>
vnoremap  `  s``<Esc>P<Right>
inoremap        '  '<Esc>:call QuoteInsertionWrapper("'")<CR>a
inoremap        "  "<Esc>:call QuoteInsertionWrapper('"')<CR>a
inoremap        `  `<Esc>:call QuoteInsertionWrapper('`')<CR>a

function! QuoteInsertionWrapper (quote)
  let     col     = col('.')
  if getline('.')[col-2] !~ '\k' && getline('.')[col] !~ '\k'
    normal ax
    exe "normal r".a:quote."h"
  end
endfunction    " ----------  end of function QuoteInsertionWrapper


set pastetoggle=<F8> "Cuando pegamos algo desde fuera de vim normalmente se identa y has de ir eliminando las sangrías

