""--------------------------------------------------------------------------""
""                                     MYVIMRC                              ""
""--------------------------------------------------------------------------""

" My sets
set noswapfile
set noerrorbells

set tabstop=4
set shiftwidth=4
set smartindent
set expandtab

set timeoutlen=700

set nowrap
set number relativenumber
set noshowmode

set completeopt=menuone,noinsert,noselect

let mapleader=" "
set guicursor=

" Plugins
call plug#begin()
    " Web dev
    Plug 'mattn/emmet-vim'
    Plug 'ap/vim-css-color'
    Plug 'alvan/vim-closetag'

    " Writing code faster
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'

    " Snippets
    Plug 'hrsh7th/vim-vsnip'

    " Tmux
    Plug 'edkolev/tmuxline.vim'

    " Autocompletition
    Plug 'nvim-lua/completion-nvim'

    " Code Formatting
    Plug 'sbdchd/neoformat'

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Multi cursor
    Plug 'terryma/vim-multiple-cursors'

    " Syntax highlighting
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'nvim-treesitter/playground'
    Plug 'sheerun/vim-polyglot'

    " Neovim LSP
    Plug 'neovim/nvim-lspconfig'

    " Better UI
    Plug 'itchyny/lightline.vim'
    Plug 'liuchengxu/vim-which-key'

    " Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Color Schemes
    Plug 'chriskempson/base16-vim'
call plug#end()

" Mappings
nnoremap <silent> <C-[> :bprevious<CR>
nnoremap <silent> <C-]> :bnext<CR>

nnoremap <silent> <leader>r :echo "Reloaded init.vim"<CR>:source $MYVIMRC<CR>

nnoremap <silent> <leader>i :PlugInstall<CR>

nnoremap <silent> <leader>xh :nohl<CR>

nnoremap <silent> <leader>c :Commentary<CR>
vnoremap <silent> <leader>c :Commentary<CR>
nnoremap <silent> <leader>g :Git<CR>
nnoremap <silent> <leader>gp :Git push<CR>

nnoremap <silent> <leader><leader> :WhichKey '<space>'<CR>

nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>

nnoremap <silent> <leader>ft :retab<CR>

nnoremap <silent> <C-p> :Telescope find_files<CR>
nnoremap <silent> <leader>p :Telescope live_grep<CR>

nnoremap <M-k> :resize +2<CR>
nnoremap <M-j> :resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>

" Git Gutter
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'

" Status bar
let s:base00 = [ '#18181800',  0 ] " black
let s:base00_ = [ '#181818',  0 ] " black
let s:base01 = [ '#28282800', 18 ]
let s:base01_ = [ '#282828', 18 ]
let s:base02 = [ '#383838', 19 ]
let s:base03 = [ '#585858',  8 ]
let s:base04 = [ '#b8b8b8', 20 ]
let s:base05 = [ '#d8d8d8',  7 ]
let s:base06 = [ '#e8e8e8', 21 ]
let s:base07 = [ '#f8f8f8', 15 ] " white

let s:base08 = [ '#ab4642',  1 ] " red
let s:base09 = [ '#dc9656', 16 ] " orange
let s:base0A = [ '#f7ca88',  3 ] " yellow
let s:base0B = [ '#a1b56c',  2 ] " green
let s:base0C = [ '#86c1b9',  6 ] " teal
let s:base0D = [ '#7cafc2',  4 ] " blue
let s:base0E = [ '#ba8baf',  5 ] " pink
let s:base0F = [ '#a16946', 17 ] " brown

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:base00_, s:base0D ], [ s:base05, s:base02 ] ]
let s:p.insert.left     = [ [ s:base01_, s:base0B ], [ s:base05, s:base02 ] ]
let s:p.visual.left     = [ [ s:base00_, s:base09 ], [ s:base05, s:base02 ] ]
let s:p.replace.left    = [ [ s:base00_, s:base08 ], [ s:base05, s:base02 ] ]
let s:p.inactive.left   = [ [ s:base02, s:base00 ] ]

let s:p.normal.middle   = [ [ s:base07, s:base01 ] ]
let s:p.inactive.middle = [ [ s:base01, s:base00 ] ]

let s:p.normal.right    = [ [ s:base01, s:base03 ], [ s:base06, s:base02 ] ]
let s:p.inactive.right  = [ [ s:base01, s:base00 ] ]

let s:p.normal.error    = [ [ s:base07, s:base08 ] ]
let s:p.normal.warning  = [ [ s:base07, s:base09 ] ]

let s:p.tabline.left    = [ [ s:base05, s:base02 ] ]
let s:p.tabline.middle  = [ [ s:base05, s:base01 ] ]
let s:p.tabline.right   = [ [ s:base05, s:base02 ] ]
let s:p.tabline.tabsel  = [ [ s:base02, s:base0A ] ]

let g:lightline#colorscheme#base16_default_dark#palette = lightline#colorscheme#flatten(s:p)

let g:lightline = {
    \ 'colorscheme': 'base16_default_dark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

" Highlights


" Color Schemes
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

colorscheme base16-default-dark

" Neovim LSP
lua << EOF
local servers = {"tsserver", "clangd", "vimls"}
for _, lsp in ipairs(servers) do
    require'lspconfig'[lsp].setup {
        capabilities = {
            textDocument = {
                completion = {
                    completionItem = {
                        snippetSupport = true
                    }
                }
            }
        }
  }
end
EOF

" Auto close tag
let g:closetag_filenames = '*.xml,*.html,*.xhtml,*.phtml,*.php'
filetype plugin indent on

" Emmet
let g:user_emmet_expandabbr_key='<C-z>'
let g:user_emmet_install_global = 0

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Autocommands
augroup DARIO_GROUP
    " Remove all autocommands
    autocmd!

    " Enable emmet
    autocmd FileType html,css EmmetInstall

    " Trim spaces
    autocmd BufWritePre * :call TrimWhitespace()

    " Formatting
    autocmd BufWritePre *.js Neoformat
    autocmd BufWritePre *.ts Neoformat
    autocmd BufWritePre *.html Neoformat
    autocmd BufWritePre *.css Neoformat

    " Better syntax highlighting
    autocmd BufWritePre *.js TSBufEnable javascript
    autocmd BufWritePre *.ts TSBufEnable typescript
    autocmd BufWritePre *.json TSBufEnable json

    " Autocompletition
    autocmd BufEnter * lua require'completion'.on_attach()

    " xml/html autoclose tag
    autocmd StdinReadPre * let s:std_in=1
augroup END
