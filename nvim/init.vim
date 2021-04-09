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

set nowrap
set number relativenumber
set noshowmode
set completeopt=menuone,noinsert,noselect
set guicursor=

let mapleader=" "
set timeoutlen=400
set mouse=a

let g:colorscheme="gruvbox"

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

    " Vim wiki
    Plug 'vimwiki/vimwiki'

    " Better UI
    Plug 'liuchengxu/vim-which-key'
    Plug 'romgrk/barbar.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/tagbar'

    " Tmux integration
    Plug 'edkolev/tmuxline.vim'
    Plug 'preservim/vimux'

    " Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Color Schemes
    Plug 'joshdick/onedark.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
    Plug 'dtinth/vim-colors-dtinth256'
call plug#end()

" Mappings
nnoremap <silent> <C-h> :BufferPrevious<CR>
nnoremap <silent> <C-l> :BufferNext<CR>

nnoremap <silent> <leader>r :echo "Reloaded init.vim"<CR>:source $MYVIMRC<CR>

nnoremap <silent> <leader>i :PlugInstall<CR>

nnoremap <silent> <leader>xh :nohl<CR>

nnoremap <silent> <leader>c :Commentary<CR>
vnoremap <silent> <leader>c :Commentary<CR>

inoremap <silent> <C-j> <C-n>
inoremap <silent> <C-k> <C-p>

nnoremap <silent> <leader>g :Git<CR>
nnoremap <silent> <leader>gp :call GitPush()<CR>

nnoremap <silent> <leader>l :lua vim.lsp.buf.document_symbol()<CR>

nnoremap <silent> <leader><leader> :WhichKey '<space>'<CR>

nnoremap <silent> <leader>t :TagbarToggle<CR>

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

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

" Color Schemes
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

if g:colorscheme == "gruvbox"
    let g:gruvbox_contrast_dark = "hard"
    let g:gruvbox_italic = 1
    colorscheme gruvbox
elseif g:colorscheme == "base16"
     colorscheme base16-default-dark
    hi Comment cterm=italic
elseif g:colorscheme == "nord"
    let g:nord_italic = 1
    let g:nord_italic_comments = 1
    colorscheme nord
elseif g:colorscheme == "onedark"
    let g:onedark_terminal_italics = 1
    colorscheme onedark
endif

" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Tmuxline
let g:tmuxline_separators = {
    \ 'left': '',
    \ 'left_alt': ' ',
    \ 'right' : '',
    \ 'right_alt' : ' ',
    \ 'space' : ' '}

" Neovim LSP
lua << EOF
local servers = {"tsserver", "clangd", "vimls", "gopls"}
for _, lsp in ipairs(servers) do
    require'lspconfig'[lsp].setup {
    }
end
EOF

" Telescope
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                [ "<C-q>" ] = actions.send_to_qflist
            },
        },
    }
}
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

fun! GitPush()
    VimuxRunCommand "clear; git push; exit"
endfun

" Autocommands
augroup DARIO_GROUP
    autocmd!

    " Trim spaces
    autocmd BufWritePre * :call TrimWhitespace()

    " Autocompletition
    autocmd BufEnter * lua require'completion'.on_attach()
augroup END

augroup WEB_DEV
    autocmd FileType html,css EmmetInstall
    autocmd StdinReadPre * let s:std_in=1
augroup END

augroup FORMATTER
    autocmd BufWritePre *.js Neoformat
    autocmd BufWritePre *.ts Neoformat
    autocmd BufWritePre *.html Neoformat
    autocmd BufWritePre *.css Neoformat
    autocmd BufWritePre *.c Neoformat
    autocmd BufWritePre *.h Neoformat
augroup END

augroup NVIM_TREESITTER
    autocmd BufWritePre *.js TSBufEnable javascript
    autocmd BufWritePre *.ts TSBufEnable typescript
    autocmd BufWritePre *.json TSBufEnable json
    autocmd BufWritePre *.c TSBufEnable c
    autocmd BufWritePre *.h TSBufEnable c
augroup END
