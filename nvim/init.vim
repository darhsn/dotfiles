" Global
set guicursor=
set termguicolors
set completeopt=menuone,noinsert,noselect
set updatetime=100
set timeoutlen=300

" Local to window
set number relativenumber
set nowrap

" Local to buffer
set tabstop=4
set shiftwidth=4
set noswapfile
set expandtab

let mapleader=" "
let g:colorscheme="dark"

call plug#begin()
    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " LSP & Completition
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'

    " Surrounding utils
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'alvan/vim-closetag'

    " VimWiki
    Plug 'vimwiki/vimwiki'

    " WebDev
    Plug 'ap/vim-css-color'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Comment line
    Plug 'tpope/vim-commentary'

    " Tmux
    Plug 'preservim/vimux'

    " Colorscheme
    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'fcpg/vim-fahrenheit'

    " Formatting
    Plug 'sbdchd/neoformat'
call plug#end()

" LSP
lua <<EOF
local lspconfig = require('lspconfig')
local completion = require('completion')

local lsp_servers = {"vimls", "clangd", "phpactor", "tsserver"}

for index, server in ipairs(lsp_servers) do
    lspconfig[server].setup{
        on_attach=completion.on_attach
    }
end
EOF

" Colorscheme
if g:colorscheme == "gruvbox"
    let g:gruvbox_contrast_dark = "hard"
    let g:gruvbox_italic = 1
    colorscheme gruvbox
elseif g:colorscheme == "base16"
    colorscheme base16-default-dark
    hi Comment cterm=italic gui=italic
elseif g:colorscheme == "nord"
    let g:nord_italic = 1
    let g:nord_italic_comments = 1
    colorscheme nord
elseif g:colorscheme == "onedark"
    let g:onedark_terminal_italics = 1
    colorscheme onedark
elseif g:colorscheme == "dark"
    colorscheme fahrenheit
endif

" Git gutter
let g:gitgutter_map_keys = 0

" Statusline
let g:currentmode = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }

set statusline=%{toupper(g:currentmode[mode()])}\ %#Todo#%F%h\ %#Type#%{fugitive#statusline()}\ %=\ %#Function#LN\ %l\/%L\ %#Number#C\ %c%V\ %#Statement#%P\ %#Indentifier#\%m%r%h%w%y

" Functions
fun! TrimSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

fun TmuxGitPush()
    VimuxRunCommand "clear; git push; exit"
endfun

fun TmuxMake(command)
    VimuxRunCommand "clear; make " . a:command . "; read -p \"Program finished with $?, Press enter to continue...\" && exit"
endfun

fun BufferAdd()
    let buffer = input("Buffer to add => ")
    if buffer == ""
        return 0
    else
        exec "badd " . buffer
        bnext
    endif
endfunction

" Mappings
nnoremap <silent> <leader>c :Commentary<CR>
vnoremap <silent> <leader>c :Commentary<CR>

nnoremap <silent> <leader>ir :source $MYVIMRC<CR>
nnoremap <silent> <leader>ie :edit $MYVIMRC<CR>

nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pU :PlugUpgrade<CR>

nnoremap <silent> <leader>gg :Git<CR>
nnoremap <silent> <leader>gp :call TmuxGitPush()<CR>
nnoremap <silent> <leader>gb :Git blame<CR>

nnoremap <silent> <leader>ghn :GitGutterNextHunk<CR>
nnoremap <silent> <leader>ghN :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>ghp :GitGutterPreviewHunk<CR>
nnoremap <silent> <leader>ghs :GitGutterStageHunk<CR>
nnoremap <silent> <leader>ghu :GitGutterUndoHunk<CR>

nnoremap <silent> <leader>mi :call TmuxMake("install")<CR>
nnoremap <silent> <leader>mt :call TmuxMake("test")<CR>
nnoremap <silent> <leader>mc :call TmuxMake("clean")<CR>
nnoremap <silent> <leader>mm :call TmuxMake("")<CR>

nnoremap <silent> <leader>tf :Telescope find_files<CR>
nnoremap <silent> <leader>tg :Telescope git_files<CR>

nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>ba :call BufferAdd()<CR>
nnoremap <silent> <C-h> :bprev<CR>
nnoremap <silent> <C-l> :bnext<CR>

" Auto commands
augroup DARIO_GROUP
    autocmd!
    autocmd BufWrite,BufWritePre * :call TrimSpace()
    autocmd BufWrite,BufWritePre * :retab
augroup END

augroup FORMATTER
    autocmd BufWritePre *.js silent! Neoformat
    autocmd BufWritePre *.ts silent! Neoformat
    autocmd BufWritePre *.html silent! Neoformat
    autocmd BufWritePre *.css silent! Neoformat
    autocmd BufWritePre *.c silent! Neoformat
    autocmd BufWritePre *.h silent! Neoformat
augroup END
