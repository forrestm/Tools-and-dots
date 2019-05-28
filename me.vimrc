set number
"set relativenumber
"set so=10
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
""""""""""""""""""""""""""""""""""""""""
set omnifunc=syntaxcomplete#Complete
Plug 'lervag/vimtex'

"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16_tomorrow'
set laststatus=2
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

"""BASIC TOOLS
"Navigating with guides
:inoremap <space><space> <esc>/<++><enter>"_c4l
:vnoremap <space><space> <esc>/<++><enter>"_c4l
:map <space><space> <esc>/<++><enter>"_c4l
:inoremap ;gui <++>
"For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
:inoremap jk <esc>
:inoremap <C-l> <Space><Space>
"""END

"set nocompatible
"filetype plugin on

"Mulitiple Cursors
Plug 'terryma/vim-multiple-cursors'

"""LATEX
let g:tex_flavor = "latex"
autocmd FileType tex :inoremap ;em \emph{}<Space><++><Esc>T{i
autocmd FileType tex :inoremap ;bf \textbf{}<Space><++><Esc>T{i
autocmd FileType tex :inoremap ;it \textit{}<Space><++><Esc>T{i
autocmd FileType tex :inoremap ;ct \textcite{}<Space><++><Esc>T{i
autocmd FileType tex :inoremap ;cp \parencite{}<Space><++><Esc>T{i
autocmd FileType tex :inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex :inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex :inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex :inoremap ;li <Enter>\item<Space>
autocmd FileType tex :inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex :inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex :inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex :inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex :inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex :inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex :inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex :inoremap ;beg \begin{%DELRN%}<Enter><++><Enter>\end{%DELRN%}<Enter><Enter><++><Esc>4kfR:MultipleCursorsFind<Space>%DELRN%<Enter>c
autocmd FileType tex :inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex :nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex :inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex :inoremap ;bt {\blindtext}
autocmd FileType tex :inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
"""END

"Markdown
autocmd Filetype markdown inoremap ;b ****<Space><++><Esc>F*hi
autocmd Filetype markdown inoremap ;s ~~~~<Space><++><Esc>F~hi
autocmd Filetype markdown inoremap ;e **<Space><++><Esc>F*i
autocmd Filetype markdown inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ;i ![](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;a [](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;l --------<Enter>

"Getting iTerm to change cursors when in Insert Mode
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"Theme Settings
let base16colorspace=256
colorscheme base16-eighties

"Turn off the Bell
set vb t_vb=

"Spaces are best
:set expandtab
:set tabstop=4
:set cindent

syntax on

"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
"Spell-check set to F6
map <F6> :setlocal spell! spelllang=en_us<CR>
