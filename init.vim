" source:
" https://github.com/Blacksuan19/init.nvim:noh

" ============= Vim-Plug ============== "{{{

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" =============================  插件加载设置  =====================================================
call plug#begin(expand('~/.config/nvim/plugged'))

"}}}

" ================= 外观类插件 ================== "{{{

Plug 'ryanoasis/vim-devicons'                           " 漂亮的图标 pretty icons everywhere
Plug 'luochen1990/rainbow'                              " 彩虹配对 rainbow parenthesis
Plug 'hzchirs/vim-material'                             " 颜色主题  material color themes
Plug 'gregsexton/MatchTag'                              " HTML 标签高亮现实 highlight matching html tags
Plug 'Jorengarenar/vim-MvVis'                           " 文本块移动 move visual selection
"}}}

" ================= 功能类插件================= "{{{

Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " 语法支持 LSP and more
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " 语法高亮显示
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " fzf 安装 fzf itself
Plug 'junegunn/fzf.vim'                                         " fzf 模糊查询集成 fuzzy search integration
Plug 'honza/vim-snippets'                                       " snippets 支持 actual snippets
Plug 'Yggdroot/indentLine'                                      " 显示缩进线 show indentation lines
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}          " PYTHON 语法支持 better python
Plug 'tpope/vim-commentary'                                     " 漂亮的注释 better commenting
Plug 'mhinz/vim-startify'                                       " 启动画面 cool start up screen
Plug 'tpope/vim-fugitive'                                       " GIT 支持 git support
Plug 'psliwka/vim-smoothie'                                     " 平滑滚动支持 some very smooth ass scrolling
"Plug 'wellle/tmux-complete.vim'                                 " 利用tmux 面板内容自动补全单词 complete words from a tmux panes
"Plug 'tpope/vim-eunuch'                                         " 在vim 中运行常用系统命令（删除、移动、重命名、搜索等） run common Unix commands inside Vim
Plug 'machakann/vim-sandwich'                                   " 支持更多文本对象及操作 make sandwiches
Plug 'christoomey/vim-tmux-navigator'                           " vim 和 tmux 之间无缝导航 seamless vim and tmux navigation
Plug 'stephpy/vim-yaml'                                         " YAML 语法支持
Plug 'plasticboy/vim-markdown'                                  " Markdown 语法支持
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }        " Markdown 文件预览支持
Plug 'preservim/nerdtree'                                       " NerdTree 目录树支持
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}     " ChadTree 目录树支持
Plug 'simnalamburt/vim-mundo'                                   " undo 缓冲区可视化
Plug 'skywind3000/vim-terminal-help'

call plug#end()

"}}}

" ==================== VIM 通用设置 general config ======================== "{{{

set termguicolors                                       " 透明背景 Opaque Background
set mouse=a                                             " 支持鼠标滚轮 enable mouse scrolling
set clipboard+=unnamedplus                              " 使用系统剪切板 use system clipboard by default
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent     " 制表符宽度设置 tab width
set expandtab smarttab                                  " TAB 键的行为 tab key actions
set incsearch ignorecase smartcase hlsearch             " 搜索时高亮显示 highlight text while searching
set list listchars=trail:»,tab:»-                       " 在列表模式下，使用 TAB 键浏览 use tab to navigate in list mode
set fillchars+=vert:\▏                                  " requires a patched nerd font (try FiraCode)
set wrap breakindent                                    " 启动自动换行显示 wrap long lines to the width set by tw
set encoding=utf-8                                      " text encoding
set number                                              " 显示行号 enable numbers on the left
set relativenumber                                      " 相对行号 current line is 0
set title                                               " 标签页标题显示文件名 tab title as file name
set noshowmode                                          " 关闭当前模式提醒 dont show current mode below statusline
set noshowcmd                                           " 关闭最后一条命令提醒 to get rid of display of last command
set conceallevel=2                                      " set this so we wont break indentation plugin
set splitright                                          " 默认在右侧垂直分割 open vertical split to the right
set splitbelow                                          " 默认在底部水平分割 open horizontal split to the bottom
set tw=90                                               " 90 个字符自动换行设置 auto wrap lines that are longer than that
set emoji                                               " 支持表情 enable emojis
set history=1000                                        " 最大历史记录 history limit
set backspace=indent,eol,start                          " sensible backspacing
set undofile                                            " 支持 undo 历史永久存储 enable persistent undo
set undodir=/tmp                                        " undo 历史永久存储位置 undo temp file directory
set foldlevel=0                                         " open all folds by default
set inccommand=nosplit                                  " visual feedback while substituting
set showtabline=0                                       " 总是现实 tabline always show tabline
set grepprg=rg\ --vimgrep                               " 使用 rg 作为默认检索工具 se rg as default grepper

" performance tweaks
set cursorline                                          " 是否行高亮显示，否用 nocursorline
set cursorcolumn                                        " 是否列高亮显示，否用 nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes


" Themeing
let g:material_style = 'oceanic'
colorscheme vim-material
hi Pmenu guibg='#00010a' guifg=white                    " popup menu colors
hi Comment gui=italic cterm=italic                      " italic comments
hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
hi NonText guifg=bg                                     " mask ~ on empty lines
hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold
hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words

" colors for git (especially the gutter)
hi DiffAdd  guibg=#0f111a guifg=#43a047
hi DiffChange guibg=#0f111a guifg=#fdd835
hi DiffRemoved guibg=#0f111a guifg=#e53935

" coc multi cursor highlight color
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

"}}}


" ======================== 插件设置  Plugin Configurations ======================== "{{{

"" ------------    内部插件 built in plugins
let loaded_netrwPlugin = 1                                    " diable netew
let g:omni_sql_no_default_maps = 1                      " disable sql omni completion
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
if glob('~/.python3') != ''
  let g:python3_host_prog = expand('~/.python3/bin/python')
else
  let g:python3_host_prog = systemlist('which python3')[0]
endif

""------------     coc 语言支持插件

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-pairs',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-tsserver',
            \'coc-yaml',
            \'coc-lists',
            \'coc-snippets',
            \'coc-pyright',
            \'coc-clangd',
            \'coc-prettier',
            \'coc-xml',
            \'coc-syntax',
            \'coc-git',
            \'coc-marketplace',
            \'coc-highlight',
            \'coc-sh',
            \]

""------------     缩进线插件 indentLine
let g:indentLine_char_list = ['▏', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
let g:indentLine_fileTypeExclude = ['startify']

""------------     启动画面插件 startify
let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
    \ { 'type': 'dir'       },
    \ { 'type': 'files'     },
    \ { 'type': 'sessions'  },
    \ { 'type': 'bookmarks' },
    \ { 'type': 'commands' },
    \ ]

" 常用书签 bookmark examples
let  g:startify_bookmarks =  [
    \ {'v': '~/.config/nvim'},
    \ {'d': '~/.dotfiles' }
    \ ]

" 自定义命令 custom commands
let g:startify_commands = [
    \ {'ch':  ['Health Check', ':checkhealth']},
    \ {'ps': ['Plugins status', ':PlugStatus']},
    \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
    \ {'uc': ['Update coc Plugins', ':CocUpdate']},
    \ {'h':  ['Help', ':help']},
    \ ]

" 自定义 BANNER  custom banner

let startify_custom_header = [
 \ '',
 \ '                                                    ▟▙            ',
 \ '                                                    ▝▘            ',
 \ '            ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '            ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '            ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '            ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '            ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \ '',
 \ '',
 \]

" ------------  彩虹插件设置  rainbow brackets
let g:rainbow_active = 1

" ------------    tmux navigator
" let g:tmux_navigator_no_nappings = 1

"" ------------ Semshi 插件设置 semshi settings

let g:semshi#error_sign	= v:false                       " let ms python lsp handle this

""------------ FZF 插件设置
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"


"" --------------- 内置终端插件

"}}}

" ======================== 自定义命令 Commands ============================= "{{{

au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au FileType help wincmd L                               " open help in vertical split
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
au CursorHold * silent call CocActionAsync('highlight') " highlight match on cursor hold

" enable spell only if file type is normal text
let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']
autocmd BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif


" coc completion popup
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" startify if no passed argument or all buffers are closed
augroup noargs
    " startify when there is no open buffer left
    autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif

    " open startify on start if no argument was passed
    autocmd VimEnter * if argc() == 0 | Startify | endif
augroup END

" fzf if passed argument is a folder
augroup folderarg
    " change working directory to passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'cd' fnameescape(argv()[0])  | endif

    " start startify (fallback if fzf is closed)
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | Startify  | endif

    " start fzf on passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'Files ' fnameescape(argv()[0]) | endif
augroup END

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" python renaming
autocmd FileType python nnoremap <leader>rn :Semshi rename <CR>

" format with available file format formatter
command! -nargs=0 Format :call CocAction('format')

" organize imports
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" files in fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

" advanced grep
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

"}}}

" ================== 自定义函数 Custom Functions ===================== "{{{

" advanced grep(faster with preview)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" startify file icons
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" check if last inserted char is a backspace (used by coc pmenu)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"}}}

" ======================== 自定义快捷键 Custom Mappings ====================== "{{{

"" =======================  基础快捷键设置 =======================================================

"leader 键设置，默认为 ,
let mapleader=","

" 正常模式下，将<;> 键映射到 <:>
" nnoremap ; :

" 正常模式下，<Tab> 键的定义
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" 正常模式下， <Enter> 键的定义
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" 正常模式下的<退出> 快捷键
noremap <C-q> :q<CR>

"  ===================  普通模式下，回车键行为为添加新行 =========================================
" =================   普通和可视模式下，删除和粘贴使用的寄存器 ===================================
"nnoremap d "_d
"vnoremap d "_d
"vnoremap p "_dP
"nnoremap x "_x

" ============================ 可视模式下模拟 Windows 的 copy, cut ==============================
vnoremap <LeftRelease> "+y<LeftRelease>
vnoremap <C-c> "+y<CR>
vnoremap <C-x> "+d<CR>


" ============================ 普通和编辑模式下，使用 ctrl + {h,j,k,l} 进行窗口切换 =============

inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>


""  ===========  FZF 搜索窗口快捷键 =================================================================

nnoremap <silent> <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>c :Commands<CR>
nmap <leader>t :BTags<CR>
nmap <leader>/ :Rg<CR>
nmap <leader>gc :Commits<CR>
nmap <leader>gs :GFiles?<CR>
nmap <leader>sh :History/<CR>



"====================  <Fn> Button Configuations ===============================================

" <F1> -- 在任何模式下，打开快捷键查询窗口
nmap <F1> <plug>(fzf-maps-n)
imap <F1> <plug>(fzf-maps-i)
vmap <F1> <plug>(fzf-maps-x)

" trim white spaces
"nnoremap <F2> : let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" <F2> -- 打开 undo 缓冲区历史窗口

nnoremap <F2> :MundoToggle<CR>

" <F3> --  打开 CHADTree 窗口
nnoremap <F3> :CHADopen<CR>

" <F4> -- 打开终端

let g:terminal_key <F4>


nnoremap <F4> :MundoToggle<CR>
nnoremap <F5> :MundoToggle<CR>
nnoremap <F6> :Startify<CR>


"" =================== COC Shortcuts ============================================================

" use tab to navigate snippet placeholders
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" multi cursor shortcuts
"nmap <silent> <C-a> <Plug>(coc-cursors-word)
"xmap <silent> <C-a> <Plug>(coc-cursors-range)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" other stuff
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>o :OR <CR>

" jump stuff
nmap <leader>jd <Plug>(coc-definition)
nmap <leader>jy <Plug>(coc-type-definition)
nmap <leader>ji <Plug>(coc-implementation)
nmap <leader>jr <Plug>(coc-references)

" other coc actions
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>a <Plug>(coc-codeaction-line)
xmap <leader>a <Plug>(coc-codeaction-selected)


" =========== GIT Shortcuts (fugitive mappings ) ==================================================

nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gb :Git blame<CR>

" =========== TMUX Shortcuts( tmux navigator ) ====================================================

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>

"}}}

" ================   其他的 <Leader> 快捷键 =============================================================
"
nmap <leader>q :bd<CR>
nmap \ <leader>q

" 重新加载  init.vim 配置
nmap <leader>r :so ~/.config/nvim/init.vim<CR>  "reload init.vim

" 写文件
nmap <leader>w :w<CR>

" 格式化文件
map <leader>s :Format<CR>

" 安装插件
noremap <leader>e :PlugInstall<CR>

nnoremap <leader>v :CHADopen<CR>

" Markdown 文件预览
au FileType markdown nmap <leader>m :MarkdownPreview<CR>

" 切换终端窗口


" ======================== 状态栏设置 =============================================== "{{{
source ~/.config/nvim/statusline.vim

"}}}
