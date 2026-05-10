let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
doautoall SessionLoadPre
silent only
silent tabonly
cd ~/.config/nvim-next
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +4 lua/config/init.lua
badd +3 lsp/lemminx.lua
badd +2 lua/plugins/colorschemes/synthweave.lua
badd +3 lua/plugins/colorschemes/void.lua
badd +5 lua/plugins/blink.lua
badd +5 lua/plugins/filetree.lua
badd +3 lua/plugins/lspconfig.lua
badd +1 lua/plugins/lualine.lua
badd +3 lua/plugins/luarocks.lua
badd +60 lua/plugins/luasnip.lua
badd +2 lua/plugins/md_render.lua
badd +3 lua/plugins/md_toc.lua
badd +3 lua/plugins/plenary.lua
badd +5 lua/plugins/smear.lua
badd +5 lua/plugins/telescope.lua
badd +5 lua/plugins/themery.lua
badd +3 lua/plugins/tmux_navigator.lua
badd +3 lua/plugins/todo_comments.lua
badd +5 lua/plugins/treesitter.lua
badd +2 lua/plugins/vim_obsession.lua
badd +7 lua/plugins/vimtex.lua
badd +4 init.lua
badd +24 lua/config/keymaps.lua
badd +11 lua/config/options.lua
badd +3 term://~/.config/nvim-next//57524:zsh
badd +1 lua/plugins/init.lua
badd +4 lua/config/autocmds.lua
badd +1 lua/config/lsp.lua
badd +11 lsp/jdtls.lua
badd +5 lsp/luals.lua
badd +6 lsp/racket_langserver.lua
badd +5 lsp/rust_analyzer.lua
badd +7 lsp/ty.lua
badd +1 lsp/texlab.lua
argglobal
%argdel
$argadd .
edit lua/config/autocmds.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt lua/config/options.lua
setlocal foldmethod=expr
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=4
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
1
sil! normal! zo
3
sil! normal! zo
17
sil! normal! zo
25
sil! normal! zo
let s:l = 20 - ((19 * winheight(0) + 27) / 55)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 20
normal! 08|
lcd ~/.config/nvim-next
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim-next/lua/config/options.lua", ":p")) | buffer ~/.config/nvim-next/lua/config/options.lua | else | edit ~/.config/nvim-next/lua/config/options.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim-next/lua/config/options.lua
endif
balt ~/.config/nvim-next/lua/config/autocmds.lua
setlocal foldmethod=expr
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=1
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
let s:l = 11 - ((10 * winheight(0) + 27) / 55)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 11
normal! 02|
lcd ~/.config/nvim-next
wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
