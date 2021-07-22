" My new init.vim

" Global
set guicursor=
set termguicolors
set completeopt=menuone,noinsert,noselect
set updatetime=100
set timeoutlen=300
set noshowmode

" Local to window
set number relativenumber
set nowrap

" Local to buffer
set tabstop=4
set shiftwidth=4
set noswapfile
set expandtab

let mapleader=" "

call plug#begin()

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'bignimbus/pop-punk.vim'

call plug#end()


lua <<EOF
local lspconfig = require('lspconfig')
local completion = require('completion')

local lsp_servers = {"vimls", "tsserver", "pyright", "clangd"}

for index, server in ipairs(lsp_servers) do
    lspconfig[server].setup{
        on_attach=completion.on_attach
    }
end
EOF

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

function GitBranch()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?''.l:branchname.'':''
endfunction

hi StatusSep guifg=#d70061 ctermfg=161
set statusline=%#PMenuSel#%{toupper(g:currentmode[mode()])}\ %#StatusSep#\ %#LineNR#\ %#CursorLineNR#\ %F%h\ %{GitBranch()}\ %=\ %l:%c\ \%m%r%h%w%y

colorscheme pop-punk
hi! Normal guibg=none ctermbg=none
hi! LineNR guibg=none ctermbg=none

" Mappings
nnoremap <silent> <leader>gg :Git<CR>
nnoremap <silent> <leader>gp :Git push<CR>

nnoremap <silent> <leader>t :term<CR>

nnoremap <silent> <leader>c :Commentary<CR>

nnoremap <silent> <C-p> :Telescope find_files<CR>

nnoremap <silent> <leader>ll :Lspsaga show_line_diagnostics
