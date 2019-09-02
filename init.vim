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
set hidden
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-solarized8'
Plug 'vim-scripts/Align'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'itchyny/lightline.vim'
Plug 'thinca/vim-quickrun'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
"Color Scheme
Plug 'nanotech/jellybeans.vim'
Plug 'Marfisc/vorange'
"YAML
Plug 'stephpy/vim-yaml'
"Kotlin
Plug 'udalov/kotlin-vim'
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

" Vue.js
Plug 'posva/vim-vue'
"html
Plug 'othree/html5.vim'

"tex
Plug 'lervag/vimtex'

"SATySFi
Plug 'qnighy/satysfi.vim'

" Rust
Plug 'rhysd/rust-doc.vim'

" MarkDown
Plug 'gabrielelana/vim-markdown'
Plug 'greyblake/vim-preview'

" Stylus
Plug 'iloginow/vim-stylus'

" Elm
Plug 'elmcast/elm-vim'
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

autocmd MyVimrc FileType javascript, call EnableJavascript()


"colorscheme vorange
"colorscheme peachpuff
"colorscheme jellybeans
set background=dark
colorscheme solarized8

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
let mapleader = "\<Space>"

nnoremap <silent><C-e> :NERDTreeToggle<CR>


" for coc
command! -nargs=* Prettier :CocCommand prettier.formatFile " for coc-prettier plugin
command! -nargs=* Format :call CocAction('format')

augroup mygroup
    autocmd!
    autocmd FileType   typescript,json    setlocal formatexpr=CocAction('formatSelected')
    autocmd User       CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    autocmd CursorHold *                  silent call CocActionAsync('highlight')
augroup end


nnoremap <silent>       K                :call <SID>show_documentation()<CR>
nnoremap <silent>       <C-L>            :noh<CR>
inoremap <silent><expr> <TAB>            pumvisible() ? "\<C-N>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
inoremap <silent><expr> <C-Space>        coc#refresh()
inoremap <expr>         <S-Tab>          pumvisible() ? "\<C-P>" : "\<C-H>"
inoremap <expr>         <CR>             pumvisible() ? "\<C-Y>" : "\<C-g>u\<CR>"
nnoremap <silent>       <Space>ff        :<C-U>Format<CR>
nmap     <silent>       <Space>rn        <Plug>(coc-rename)
nmap                    <Space>fs        <Plug>(coc-format-selected)
xmap                    <Space>fs        <Plug>(coc-format-selected)
nmap                    <Space>a         <Plug>(coc-codeaction)
nmap                    <Space>q         <Plug>(coc-fix-current)
nmap                    <Space>r         <Plug>(coc-refactor)
nnoremap <silent>       <Space><Space>d  :<C-U>CocList diagnostics<CR>
nnoremap <silent>       <Space><Space>   :<C-U>CocList<CR>
nmap     <silent>       <Space>dd        <Plug>(coc-diagnostic-info)
nmap     <silent>       <Space>dk        <Plug>(coc-diagnostic-prev-error)
nmap     <silent>       <Space>dj        <Plug>(coc-diagnostic-next-error)
nmap     <silent>       <Space>dp        <Plug>(coc-diagnostic-prev-error)
nmap     <silent>       <Space>dn        <Plug>(coc-diagnostic-next-error)

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! s:show_documentation()
    if(index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

