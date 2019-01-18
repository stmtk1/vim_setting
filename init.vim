set number
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/Align'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'itchyny/lightline.vim'
Plug 'thinca/vim-quickrun'
"Color Scheme
Plug 'nanotech/jellybeans.vim'
Plug 'Marfisc/vorange'
"YAML
Plug 'stephpy/vim-yaml'
"C++
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'stmtk1/vimForComp'
"Scala
Plug 'derekwyatt/vim-scala'
"HTML
Plug 'slim-template/vim-slim'
Plug 'mattn/emmet-vim'
Plug 'nicklasos/vim-jsx-riot'
"JavaScript
Plug 'othree/yajs.vim'
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
"snipMate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'Shougo/vimshell'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'kovisoft/slimv'
" javascript
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', {'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', {'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'javascript.jsx'] }
Plug 'maxmellon/vim-jsx-pretty', {'for': ['javascript', 'javascript.jsx']}
Plug 'ternjs/tern_for_vim', {'for': ['javascript', 'javascript.jsx'], 'do' : 'npm install' }

"html
Plug 'othree/html5.vim'

"tex
Plug 'lervag/vimtex'

"SATySFi
Plug 'qnighy/satysfi.vim'

call plug#end()

function! EnableJavascript()
    let g:used_javascript_libs = 'jquery, underscore, react, flux, jasmine, d3'
    let b:javascript_lib_use_jquery = 1
    let b:javascript_lib_use_underscore = 1
    let b:javascript_lib_use_react = 1
    let b:javascript_lib_use_flux = 1
    let b:javascript_lib_use_jasmine = 1
    let b:javascript_lib_use_d3 = 1
endfunction

augroup MyVimrc
    autocmd!
augroup END

autocmd MyVimrc FileType javascript, javascript.jsx call Enablejavascript()


colorscheme vorange
"colorscheme peachpuff
"colorscheme jellybeans
let g:deoplete#enable_at_startup = 1

inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap \" \"\"<Left>
inoremap ' ''<Left>
let g:latex_latexmk_options = '-pdf'

source ~/.config/nvim/autoload/vimForComp.vim
    " this one is which you're most likely to use?
    "autocmd BufRead,BufNewFile *.ext,*.ext3|<buffer[=N]> 
"augroup end
"
