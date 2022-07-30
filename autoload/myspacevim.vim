function! myspacevim#before() abort
  set tags=./.tags;,.tags
  let g:mapleader = ','

  let g:neoformat_cpp_clangformat = {
      \ 'exe': "clang-format",
      \ 'args': ['--style=Google'],
      \ }
  let g:neoformat_enabled_cpp = ['clangformat']
"
  let g:neomake_cpp_clang_maker = {
      \ 'exe': 'clang'
      \ }
  let g:neomake_cpp_enabled_makers = ["cpplint"]
  let g:neomake_cpp_cpplint_maker = {
      \ 'args': ''
      \ }
  let g:spacevim_filetree_direction = 'left'
"
  let g:gutentags_modules = ['ctags']
  " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
  let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"
  " 所生成的数据文件的名称
  let g:gutentags_ctags_tagfile = '.tags'
"
  " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
  let s:vim_tags = expand('~/.cache/tags')
  let g:gutentags_cache_dir = s:vim_tags
"
  " 配置 ctags 的参数
  let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
  let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
  let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"
  " 检测 ~/.cache/tags 不存在就新建
  if !isdirectory(s:vim_tags)
     silent! call mkdir(s:vim_tags, 'p')
   endif
endfunction

function! myspacevim#after() abort
  "保存文件
  nnoremap <Leader>w  :w<CR>
  " 选择全文
  noremap <M-a> <Esc>ggVG<CR>
  " 退出
  nnoremap  qw    :wq<CR>
  nnoremap  qq    :q!<CR>
  " 插入模式下移动光标
  inoremap <C-k> <Up>
  inoremap <C-h> <Left>
  inoremap <C-l> <Right>
  inoremap <C-j> <Down>
  " 向后删除 *为向前删除，shell通用
  inoremap <C-d> <Delete>
  " coc-smartf配置，press <esc> to cancel.
  nmap f <Plug>(coc-smartf-forward)
  nmap F <Plug>(coc-smartf-backward)
  nmap ; <Plug>(coc-smartf-repeat)
  nmap , <Plug>(coc-smartf-repeat-opposite)
  augroup Smartf
    autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=pink
    autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
  augroup end
"
  set signcolumn=yes

endfunction
