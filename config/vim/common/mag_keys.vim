"===========================  Michael's Keyboard Mappings ============================= "
" Keys marked ** are not available in the terminal, because the terminal does not pass through the escape sequence


"noremap <d-3> :w


autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <esc>   <Plug>(unite_exit)
endfunction

function! ToggleLinenums()
  if &relativenumber == 1
     set norelativenumber
     set nonumber
  elseif &number == 1
     set relativenumber
  else
     set norelativenumber
     set number
  endif
endfunction

" toggles the existence of text on a line
" if true_pattern matches
"     replace true_pattern with true_replacement
" else
"     replace false_pattern with false_replacement
function! ToggleText(true_pattern, true_replacement, false_pattern, false_replacement)

    let curr_line = getline('.')
    if curr_line =~ a:true_pattern
       " echo "found " . a:true_pattern . "; sub: " . a:true_pattern . " with " . a:true_replacement
       let curr_line = substitute(curr_line, a:true_pattern, a:true_replacement, '')
    else
       " echo "not found " . a:true_pattern . "; sub: " . a:false_pattern . " with " . a:false_replacement
       let curr_line = substitute(curr_line, a:false_pattern, a:false_replacement, '')
    endif
    call setline('.', curr_line)
endfunction

" CAPS-SHIFT-;
" toggles whether or not the _ character is considered a word
function! ToggleUnderscoreIsKeyword()
    if &isk =~ '_'
        echo "Underscore removed from word characters"
        :set isk-=_
    else
        echo "Underscore added to word characters"
        :set isk+=_
    endif
endfunction

" no equivalent working shortcut on mac
:noremap <silent> <S-F22> :call ToggleUnderscoreIsKeyword()<CR>
:inoremap <silent><S-F22> <esc>:call ToggleUnderscoreIsKeyword()<CR><right>gi

" CAPS+CTRL+3 (C-F35) **
" - write file
:noremap <C-F35> :w<CR>
:inoremap <C-F35> <Esc> :w<CR>g<insert>
" mac: cmd+3
noremap <d-3> :w<cr>
inoremap <d-3> <esc> :w<cr>g<insert>

" CAPS+CTRL+SHIFT+3 (C-S-F35) **
" - write and quit file
:noremap <C-S-F35> :w<bar>Bdelete<CR>
:inoremap <C-S-F35> <esc>:w<bar>Bdelete<CR>
" mac CAPS-CMD-3  (does not work)
:noremap <D-£> :w<bar>Bdelete<CR>
:inoremap <D-£> <esc>:w<bar>Bdelete<CR>

" CAPS-; (F22, esc 42)
" - go to vim command line
map <F22> :
map <esc>[42~ :
inoremap <F22> <Right><Esc>:
inoremap <esc>[42~ : <Right><Esc>:
" mac CAPS-; (Option_L+;)
map … :
inoremap … <right><esc>:


" - replace do with :focus => true do
"   this is for ruby testing
map <silent> <S-A-F4> :call ToggleFocusTrue()<CR>
:inoremap <silent> <S-A-F4> <Esc>:call ToggleFocusTrue()<CR><insert>
" mac <C-S-F4>
map <silent> <C-S-F4> :call ToggleFocusTrue()<CR>
:inoremap <silent> <C-S-F4> <Esc>:call ToggleFocusTrue()<CR><insert>

" S-A-F4
" - replace do with :skip => true do
"   this is for ruby testing
map <silent> <S-A-F5> :call ToggleSkipTrue()<CR>
:inoremap <silent> <S-A-F5> <Esc>:call ToggleSkipTrue()<CR><insert>
"mac <C-S-F5>
map <silent> <C-S-F5> :call ToggleSkipTrue()<CR>
:inoremap <silent> <C-S-F5> <Esc>:call ToggleSkipTrue()<CR><insert>

" C-Y
" CAPS-Y (F16)
" - delete line
map <silent> <C-Y> dd
map <silent> <F16> dd
map <silent> <esc>[36~ dd
:inoremap <silent> <C-Y> <Esc>ddg<insert>
:inoremap <silent> <F16> <Esc>ddg<insert>
:inoremap <silent> <esc>[36~ <esc>ddg<insert>
" mac CAPS+y (Option_L+Y)
map <silent> ¥ dd
:inoremap <silent> ¥ <Esc>ddg<insert>



" C-T
" CAPS-T (F15)
" - delete word
" --- special logic to join lines: delete char first
map <silent> <C-T> :call MAG_delword()<CR>g<esc>
map <silent> <F15> :call MAG_delword()<CR>g<esc>
map <silent> <esc>[35~ :call MAG_delword()<CR>g<esc>
:inoremap <silent> <F15> <Right><Esc>:call MAG_delword()<CR>gi<left>
:inoremap <silent> <C-T> <Right><Esc>:call MAG_delword()<CR>gi<left>
:inoremap <silent> <esc>[35~ <Right><Esc>:call MAG_delword()<CR>gi<left>
" mac CAPS-T (Option_L+T)
map <silent> † :call MAG_delword()<CR>g<esc>
:inoremap <silent> † <Right><Esc>:call MAG_delword()<CR>gi<left>

function! MAG_delword()
    let pos    = getpos(".")
    let curcol = col(".")
    let eol    = col("$")
    if curcol >= eol
       join
    else 
       normal dw
    endif
    call setpos(".", pos)
endfunction


" F4 (mac/linux)
" - one window 
map <silent> <F4> :only<CR>
:inoremap <silent> <F4> <Esc>:only<CR>g<insert>


"begfile"
"F14 - CAPS-W
map <silent> <F14><Up> gg
:inoremap <silent> <F14><Up> <Esc>gg<insert>
" mac caps-W (Option_L+W)
map <silent> ∑<Up> gg
:inoremap <silent> ∑<Up> <Esc>gg<insert>



"endfile"
"F14 - CAPS-W                                                                                


" - replace do with :focus => true do
"   this is for ruby testing

map <silent> <S-A-F4> :call ToggleFocusTrue()<CR>
:inoremap <silent> <S-A-F4> <Esc>:call ToggleFocusTrue()<CR><insert>

" S-A-F4
" - replace do with :skip => true do
"   this is for ruby testing
map <silent> <S-A-F5> :call ToggleSkipTrue()<CR>
:inoremap <silent> <S-A-F5> <Esc>:call ToggleSkipTrue()<CR><insert>


" C-Y
" CAPS-Y (F16)
" - delete line
map <silent> <C-Y> dd
map <silent> <F16> dd
map <silent> <esc>[36~ dd
:inoremap <silent> <C-Y> <Esc>ddg<insert>
:inoremap <silent> <F16> <Esc>ddg<insert>
:inoremap <silent> <esc>[36~ <esc>ddg<insert>

" C-T
" CAPS-T (F15)
" - delete word
" --- special logic to join lines: delete char first
map <silent> <C-T> :call MAG_delword()<CR>g<esc>
map <silent> <F15> :call MAG_delword()<CR>g<esc>
map <silent> <esc>[35~ :call MAG_delword()<CR>g<esc>
:inoremap <silent> <F15> <Right><Esc>:call MAG_delword()<CR>gi<left>
:inoremap <silent> <C-T> <Right><Esc>:call MAG_delword()<CR>gi<left>
:inoremap <silent> <esc>[35~ <Right><Esc>:call MAG_delword()<CR>gi<left>

function! MAG_delword()
    let pos    = getpos(".")
    let curcol = col(".")
    let eol    = col("$")
    if curcol >= eol
       join
    else 
       normal dw
    endif
    call setpos(".", pos)
endfunction


" F4
" - one window
map <silent> <F4> :only<CR>
:inoremap <silent> <F4> <Esc>:only<CR>g<insert>


"begfile"
"F14 - CAPS-W
map <silent> <F14><Up> gg
:inoremap <silent> <F14><Up> <Esc>gg<insert>

"endfile"
"F14 - CAPS-W                                                                                


" F10 
" - split horizontally 
map <silent> <F10> :sp<CR>:wincmd w<CR>
:inoremap <silent> <F10> <Esc> :sp<CR>:wincmd w<CR>g<insert>

" C-F10 ** 
" - split vertically
map <silent> <C-F10> :vsp<CR>:wincmd w<CR>
:inoremap <silent> <C-F10> <Esc> :vsp<CR>:wincmd w<CR>g<insert>

" F2
" - search next
map <silent> <F2> n
:inoremap <silent> <F2> <Right><Esc>n<insert>

" Shift-F2
" - search next backwards
map <silent> <S-F2> N
:inoremap <silent> <S-F2> <Esc>N<insert>

" C-F3
" - start replace
map <C-F3> :%s@\v@@gc<Left><Left><Left><Left>
inoremap <C-F3> <Right><Esc>:%s@\v@@gc<Left><Left><Left><Left>
vnoremap <C-F3> :s@\%V\v@@gc<Left><Left><Left><Left>

" M-F3
" - start replace 
map <M-F3> :%s@\v<C-R>"@@gc<Left><Left><Left>
inoremap <M-F3> <Right><Esc>:%s@<C-R>"\v@@gc<Left><Left><Left>
vnoremap <M-F3> :s@\%V\v<C-R>"@@gc<Left><Left><Left>

" caps-s-s
map <F19><F19> :UniteResume<cr>
inoremap <F19><F19> <esc>:UniteResume<cr>
" osx caps-s-s
map ßß :UniteResume<cr>
inoremap  ßß <esc>:UniteResume<cr>

" caps-s-j
map <F19><Left> :Unite jump<cr>
inoremap <F19><Left> <esc>:Unite jump<cr>

" caps-s-h
map <F19><F21> :Unite help<cr>
inoremap <F19><F21> <esc>:Unite help<cr>

" caps-s-t
map <F19><F15> :Unite tmuxcomplete<cr>
inoremap <F19><F15> <esc>:Unite tmuxcomplete<cr>

" caps-s-q - Quickfix candidates
map <F19>q :Unite qf<cr>
inoremap <F19>q <esc>:Unite qf<cr>

" caps-s-t - Unite tags
map ß† :Unite tag<cr>
inoremap ß† <esc>:Unite tag<cr>

" Rails navigation - not used - mapping conflicts.  find new mapping
" " caps-c-c
" map <F26><F26> :Unite rails/controller<cr>
" inoremap <F26><F26> <esc>:Unite rails/controller<cr>
" 
" " caps-c-m
" map <F26><Insert> :Unite rails/model<cr>
" inoremap <F26><Insert> <esc>:Unite rails/model<cr>
" 
" " caps-c-v
" map <F26><F27> :Unite rails/view<cr>
" inoremap <F26><F27> <esc>:Unite rails/view<cr>
" 
" " caps-c-s
" map <F26><F19> :Unite rails/spec<cr>
" inoremap <F26><F19> <esc>:Unite rails/spec<cr>

" caps-c-l - not used - mapping conflicts.  find new mapping
" map <F26><Right> :Rlog<cr>
" inoremap <F26><Right> <esc>:Rlog<cr>


" less RSI-inducing access to [ and ]
map <F25> [
map <F26> ]
map <c-F25> {
map <c-F26> }

map <F25>' <Plug>(IndentWisePreviousEqualIndent)
map <F26>' <Plug>(IndentWiseNextEqualIndent)


map [0 <Plug>(IndentWisePreviousEqualIndent)
map ]0 <Plug>(IndentWiseNextEqualIndent)

map [- <Plug>(IndentWisePreviousLesserIndent)
map ]- <Plug>(IndentWiseNextLesserIndent)

map [= <Plug>(IndentWisePreviousGreaterIndent)
map ]= <Plug>(IndentWiseNextGreaterIndent)

map <F26>' <Plug>(IndentWiseNextEqualIndent)


" osx
" caps+x
map ≈ [
imap ≈ <esc>[
" caps+c
map ç ]
imap ç <esc>[
" shift-opt+x
map ˛ {
imap ˛ <esc>{
" shift-opt+c
map Ç }
imap Ç <esc>}


" osx caps+x then caps+0
map ≈' <Plug>(IndentWisePreviousEqualIndent) 
imap ≈' <Plug>(IndentWisePreviousEqualIndent) 
" osx caps+c then caps+0
map ç' <Plug>(IndentWiseNextEqualIndent) 
imap ç' <Plug>(IndentWiseNextEqualIndent) 

" vnoremap <s-f3> "hy:s@<C-r>h@@g<left><left>

" A-F2 Ack grep word under cursor
" map <A-F2> :Ack<CR>
" inoremap <A-F2> <Esc> :Ack<CR>

" S-A-F2 Ack grep word 
" map <S-A-F2> :Ack  <Left>
" inoremap <S-A-F2> <Esc> :Ack  <Left>


function! EscapeSearchText(text)
  " shell escape characters
  let escaped = shellescape(a:text)

  " escape spaces
  let escaped = substitute(escaped, ' ', '\\ ', 'g')

  " remove single quote at beginning and end
  return strpart(escaped, 1, strlen(escaped) - 2)
endfunction

function! ExecuteGlobalGrep(text)
    let history_command = "GlobalGrep " . a:text
    echo history_command
    call histadd("cmd", history_command)
    let cmd = "Unite grep:.::" . EscapeSearchText(a:text)
    execute cmd
endfunction

:command! -nargs=1 GlobalGrep call ExecuteGlobalGrep(<f-args>)

" S-A-F2 Global Grep
" map <S-A-F2> :Unite grep:.::
" inoremap <S-A-F2> <Esc> :Unite grep:.::
map <S-A-F2> :GlobalGrep 
inoremap <S-A-F2> <Esc> :GlobalGrep 

" A-F2 Global Grep word under cursor
" map <A-F2> yiw:Unite grep:.::"<cr>
" inoremap <A-F2> <esc>yiw:Unite grep:.::"<cr>
map <A-F2> :GlobalGrep <cr>
inoremap <A-F2> <esc>:GlobalGrep <cr>

" A-F2 Global Grep selected text
" map <A-F2> yiw:Unite grep:.::"<cr>
" inoremap <A-F2> <esc>yiw:Unite grep:.::"<cr>
vmap <A-F2> y:GlobalGrep "<cr>

" A-F2 Unite ag word under cursor but no <cr> (this allows to save in history)
" map <A-F1> yiw:Unite grep:.::"
" inoremap <A-F1> <esc>yiw:Unite grep:.::"

" S-A-F2 search for word under cursor
map <C-F2> yiw/"<cr>
inoremap <C-F2> <esc>yiw/"<cr>

" caps-s-b Unite grep buffers
map <F26><F28> :Unite grep:$buffers::
inoremap <F26><F28> <Esc> :Unite grep:.::

" caps-s-g - Unite compressview
map <F19><F20> :Unite grep:%::
inoremap <F19><F20> <esc>:Unite grep:%::

" caps-s-f - Unite compressview - word at cursor
map <F19><End> yiw:Unite grep:%::"<cr>
inoremap <F19><End> <esc>yiw:Unite grep:%::"<cr>


" A-F2 Unite ag word under cursor
map <S-C-F2> yiw:Unite grep:$buffers::"<cr>
inoremap <S-C-F2> <esc>yiw:Unite grep:.::"<cr>


" C-S-F2 LustyBufferGrep 
" map <C-S-F2> :LustyBufferGrep<CR>
" inoremap <C-S-F2> <Esc> :LustyBufferGrep<CR>


" F3
" - switch to next window 
map <silent> <F3> :wincmd w<CR>
:inoremap <silent> <F3> <Esc>:wincmd w<CR><insert>

" shift-F3
" - switch to previous window 
map <silent> <S-F3> :wincmd W<CR>
:inoremap <silent> <S-F3> <Esc>:wincmd W<CR><insert>

" make windows equal in size
" osx cmd-+ (caps+cmd =)
map <d-+> :wincmd =<cr>
imap <d-+> <esc>:wincmd =<cr><insert>

" CAPS-SHIFT-H
" - switch to Alternate file
" - in rails files switches between a class and its unit test
noremap <S-F21> :A<cr>
inoremap <S-F21> <esc>:A<cr>

function! ToggleFocusTrue()
    :call ToggleText(',\s*:focus\s*=>\s*true\s*do\s*$', ' do', '\s*do\s*$', ', :focus => true do')
endfunction

function! ToggleSkipTrue()
    :call ToggleText(',\s*:skip\s*=>\s*true\s*do\s*$', ' do', '\s*do\s*$', ', :skip => true do')
endfunction


" S-A-F4
" - replace do with :focus => true do
"   this is for ruby testing

map <silent> <S-A-F4> :call ToggleFocusTrue()<CR>
:inoremap <silent> <S-A-F4> <Esc>:call ToggleFocusTrue()<CR><insert>

" S-A-F4
" - replace do with :skip => true do
"   this is for ruby testing
map <silent> <S-A-F5> :call ToggleSkipTrue()<CR>
:inoremap <silent> <S-A-F5> <Esc>:call ToggleSkipTrue()<CR><insert>


" C-Y
" CAPS-Y (F16)
" - delete line
map <silent> <C-Y> dd
map <silent> <F16> dd
map <silent> <esc>[36~ dd
:inoremap <silent> <C-Y> <Esc>ddg<insert>
:inoremap <silent> <F16> <Esc>ddg<insert>
:inoremap <silent> <esc>[36~ <esc>ddg<insert>

" C-T
" CAPS-T (F15)
" - delete word
" --- special logic to join lines: delete char first
map <silent> <C-T> :call MAG_delword()<CR>g<esc>
map <silent> <F15> :call MAG_delword()<CR>g<esc>
map <silent> <esc>[35~ :call MAG_delword()<CR>g<esc>
:inoremap <silent> <F15> <Right><Esc>:call MAG_delword()<CR>gi<left>
:inoremap <silent> <C-T> <Right><Esc>:call MAG_delword()<CR>gi<left>
:inoremap <silent> <esc>[35~ <Right><Esc>:call MAG_delword()<CR>gi<left>

function! MAG_delword()
    let pos    = getpos(".")
    let curcol = col(".")
    let eol    = col("$")
    if curcol >= eol
       join
    else 
       normal dw
    endif
    call setpos(".", pos)
endfunction


" F4
" - one window
map <silent> <F4> :only<CR>
:inoremap <silent> <F4> <Esc>:only<CR>g<insert>


"begfile"
"F14 - CAPS-W
map <silent> <F14><Up> gg
:inoremap <silent> <F14><Up> <Esc>gg<insert>

"endfile"
"F14 - CAPS-W
map <silent> <F14><Down> G
:inoremap <silent> <F14><Down> <Esc>G<insert>
" mac CAPS-W (Option_L+W)
map <silent> ∑<Down> G
:inoremap <silent> ∑<Down> <Esc>G<insert>



"F14 - F19 CAPS-W S
map <silent> <F14><F19> w
:inoremap <silent> <F14><F19> <Esc>wg<insert>
" mac CAPS-WS (Option_L+W)
map <silent> ∑ß w
:inoremap <silent> ∑ß <Esc>wg<insert>


"F14 - F14 CTRL-W CTRL-W prev position
map <silent> <F14><F14> ``
:inoremap <silent> <F14><F14> <Esc>``<insert>
" mac CAPS-WS (Option_L+W)
map <silent> ∑∑ ``
:inoremap <silent> ∑∑ <Esc>``<insert>

" Bubble text up/down (a.k.a. slide line up/down)
"
"slide line up - should work for hjkl or ijkl cursors
" map <silent> <C-S-Up> dd<up>P
" inoremap <silent> <C-S-Up> <esc>dd<up>Pg

"slide line down"
" map <silent> <C-S-Down> ddp
" inoremap <silent> <C-S-Down> <esc>ddpg<insert>


" Bubble single lines (using unimpaired.vim)
nmap <C-Up> [e
inoremap <C-Up> <ESC><ESC>[ei
nmap <C-Down> ]e
inoremap <C-Down> <ESC><ESC>]ei

" OSX: Bubble single lines (using unimpaired.vim)
nmap <D-Up> [e
inoremap <D-Up> <ESC><ESC>[ei
nmap <D-Down> ]e
inoremap <D-Down> <ESC><ESC>]ei

" Bubble multiple lines (using unimpaired.vim)
vmap <C-Up> [egv
vmap <C-Down> ]egv

" OSX: Bubble multiple lines (using unimpaired.vim)
vmap <D-Up> [egv
vmap <D-Down> ]egv


"F17 - CAPS-P - line block, yank to register z
map <silent> <F17> V
:inoremap <silent> <F17> <Esc>V
" :vnoremap <silent> <F17> "zy
" :vnoremap <silent> <F17> V:'<,'>yank z<CR>
:vnoremap <silent> <F17> "zy<ESC>gv<ESC>
" mac CAPS-P (Option_L+P)
map <silent> π V
:inoremap <silent> π <Esc>V
:vnoremap <silent> π "zy<ESC>gv<ESC>


"S-F17 - CAPS-P - rectangle block
map <silent> <S-F17> <C-V>
:inoremap <silent> <S-F17> <Right><Esc><C-V>
"mac S-CAPS-P (S-Option_L+P) 
map <silent> ∏ <C-V>
:inoremap <silent> ∏ <Right><Esc><C-V>


"F23 : CAPS-' - paste above from register z
map <silent> <F23> "zP
:inoremap <silent> <F23> <Right><Esc>"zP<insert>

"F21 : CAPS-H - paste above from register z
map <silent> <F21> "zP
" :inoremap <silent> <F21> <Right><Esc>"zP<insert>
:inoremap <silent> <F21> <C-R>z
" mac: CAPS-H (Option_L+H)
map <silent> ˙ "zP
:inoremap <silent> ˙ <C-R>z

"paste from system clipboard (on mac use command-v)
noremap <silent> <S-Insert> "+P
vnoremap <silent> <S-Insert> "+P
inoremap <silent> <S-Insert> <Esc>"+pa

"yank to system clipboard (on mac use command-c)
noremap <silent> <C-Insert> "+y
vnoremap <silent> <C-Insert> "+y
inoremap <silent> <C-Insert> <Esc>"+y<insert>

" experimental - not used on mac
"C-F23 : CAPS-CTRL-' - paste above from register z, removing original range
map <silent> <C-F23> "zPi<Esc>gvdg<insert><Esc>
:inoremap <silent> <C-F23> <Right><Esc>"zPi<Esc>gvdg<insert>




map <silent> <F9> :set invcursorcolumn<CR>
:inoremap <silent> <F9> <Esc>:set invcursorcolumn<CR>g<insert>

map <silent> <C-F9> :set invcursorline<CR>
:inoremap <silent> <C-F9> <Esc>:set invcursorline<CR>g<insert>

"CAPS-, (unshifted <) shift last marked block left one shiftwidth"
noremap <silent> <F30> a<Esc>:'<,'><<CR>g<insert><Esc>
:vnoremap <silent> <F30> <<CR>
:inoremap <silent> <F30> <Esc>:'<,'><<CR><insert>
" mac CAPS-, (unshifted <)
noremap <silent> ≤ a<Esc>:'<,'><<CR>g<insert><Esc>
:vnoremap <silent> ≤ <<CR>
:inoremap <silent> ≤ <Esc>:'<,'><<CR><insert>


"shift last marked block left four shiftwidths"
noremap <silent> <C-F30> a<Esc>:'<,'><<<<<CR>g<insert><Esc>
:vnoremap <silent> <C-F30> <<<<<CR>
:inoremap <silent> <C-F30> <Esc>:'<,'><<<<<CR>g<insert>
" mac S-CAPS-, (S-OPTION_L-,)
noremap <silent> ¯ a<Esc>:'<,'><<<<<CR>g<insert><Esc>
:vnoremap <silent> ¯ <<<<<CR>
:inoremap <silent> ¯ <Esc>:'<,'><<<<<CR>g<insert>

" CAPS-. (unshifted >)
"shift last marked block right one shiftwidth"
noremap <silent> <F31> a<Esc>:'<,'>><CR>g<insert><Esc>
:vnoremap <silent> <F31> ><CR>
:inoremap <silent> <F31> <Esc>:'<,'>><CR><insert>
" mac CAPS-. (unshifted >)
noremap <silent> ≥ a<Esc>:'<,'>><CR>g<insert><Esc>
:vnoremap <silent> ≥ ><CR>
:inoremap <silent> ≥ <Esc>:'<,'>><CR><insert>

"shift last marked block right four shiftwidths"
noremap <silent> <C-F31> a<Esc>:'<,'>>>>><CR>g<insert><Esc>
:vnoremap <silent> <C-F31> >>>><CR>
:inoremap <silent> <C-F31> <Esc>:'<,'>>>>><CR>g<insert>
" mac S-CAPS-. (S-OPTION_L-.)
noremap <silent> ˘ a<Esc>:'<,'>>>>><CR>g<insert><Esc>
:vnoremap <silent> ˘ >>>><CR>
:inoremap <silent> ˘ <Esc>:'<,'>>>>><CR>g<insert>

""NERD Commenter commands"
"" :vnoremap <F29> :NERD_com-toggle-comment<CR>
"let NERD_com_line_toggle_map="<F29>"
"let NERD_space_delim_filetype_regexp="^[^m][^a]" "add whitespace for all comments except mail (>)
"" let NERD_space_delim_filetype_regexp="." "add whitespace for all comments except mail (>)

" TComment options
set commentstring=#\ %s
"Caps-N
noremap <F29> :TComment<CR>
inoremap <F29> <Esc>:TComment<CR>g<insert>

" mac caps-n
"noremap  ˜ :TComment<CR>
"noremap ˜ <Esc>:TComment<CR>g<insert>
noremap <S-F15> :TComment<CR>
inoremap <S-F15> <Esc>:TComment<CR>g<insert>

" xnoremap <silent> av :<C-u>call TextObjWordBasedColumn("aw")<cr>
" xnoremap <silent> aV :<C-u>call TextObjWordBasedColumn("aW")<cr>
" xnoremap <silent> iv :<C-u>call TextObjWordBasedColumn("iw")<cr>
" xnoremap <silent> iV :<C-u>call TextObjWordBasedColumn("iW")<cr>
" onoremap <silent> av :call TextObjWordBasedColumn("aw")<cr>
" onoremap <silent> aV :call TextObjWordBasedColumn("aW")<cr>
" onoremap <silent> iv :call TextObjWordBasedColumn("iw")<cr>
" onoremap <silent> iV :call TextObjWordBasedColumn("iW")<cr>

"Shift-Caps-N - mark a task as done by changing - into x, and moving to the next task
noremap <silent> <S-F29> :s@\v^(\s*)-@\1x@<CR>/\v^(\s*)-<CR>
inoremap <silent> <S-F29> <esc>:s@\v^(\s*)-@\1x@<CR><down>/\v^(\s*)-<CR>gi
" mac shift-caps-n (does not work because S-F15 is already Option_L+)
" (note this can be fixed - can switch back to F15 for commenting in system
" the reason it was S-F15 was because F15 on its own triggered brightness increase, but this
" can be disabled in macos system preferences) 
" noremap <silent> <S-F15> :s@\v^(\s*)-@\1x@<CR>/\v^(\s*)-<CR>
" inoremap <silent> <S-F15> <esc>:s@\v^(\s*)-@\1x@<CR><down>/\v^(\s*)-<CR>gi
 

" caps-s-d
map <silent> <F19><home> :Unite outline<CR>
inoremap <silent> <F19><home> <esc>:Unite outline<CR>
" OSX
map ß<Home>  <esc>:Unite outline<CR> 
inoremap ß<Home> <esc>:Unite outline<CR> 

"disable folds
" caps-s-pageup (no mac equiv)
map <F19><PageUp> zi
:inoremap <F19><PageUp> <Esc>zig<insert>

"open fold (no mac equiv)
" noremap <M-Right>   zo
" inoremap <M-Right>  <Esc>zo<insert>

"close fold (no mac equiv)
" noremap <M-Left>   zc
" inoremap <M-Left>  <Esc>zc

" vim outline checkbox toggle (no mac equiv)
" Caps-alt-n
noremap <M-F29> :call SwitchBox()       <bar>call CalculateMyBranch(line("."))<cr>
inoremap <M-F29> <Esc>:call SwitchBox()       <bar>call CalculateMyBranch(line("."))<cr><insert>

" vim outline checkbox toggle (no mac equiv)
" OSX: Caps-shift-n
"noremap <S-F15> :call SwitchBox()       <bar>call CalculateMyBranch(line("."))<cr>
"inoremap <S-F15> <Esc>:call SwitchBox()       <bar>call CalculateMyBranch(line("."))<cr><insert>

" map + zo
" map _ zo
" map = zo
"close fold
" map - zc


"alias for getting all diffs from the other side and turning off diffmode
:cab dga 1,$+1diffget || diffoff!


" copy from REMOTE
map <leader>dor :diffget REMOTE

" copy from LOCAL
map <leader>dol :diffget LOCAL

" copy from BASE
map <leader>dob :diffget BASE



"Align commands"
"Select indented block (from http://www.vim.org/tips/tip.php?tip_id=1269)
function! IndTxtObj(inner) 
  let curcol = col(".") 
  let curline = line(".") 
  let lastline = line("$") 
  let i = indent(line(".")) 
  if getline(".") !~ "^\\s*$" 
    let p = line(".") - 1 
    let nextblank = getline(p) =~ "^\\s*$" 
    while p > 0 && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner)))) 
      - 
      let p = line(".") - 1 
      let nextblank = getline(p) =~ "^\\s*$" 
    endwhile 
    normal! 0V 
    call cursor(curline, curcol) 
    let p = line(".") + 1 
    let nextblank = getline(p) =~ "^\\s*$" 
    while p <= lastline && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner)))) 
      + 
      let p = line(".") + 1 
      let nextblank = getline(p) =~ "^\\s*$" 
    endwhile 
    normal! $ 
  endif 
endfunction

onoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR> onoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR> vnoremap <silent>ai <Esc>:cal IndTxtObj(0)<CR><Esc>gv 
vnoremap <silent>ii <Esc>:cal IndTxtObj(1)<CR><Esc>gv


"perltidy : caps + s , t
:vnoremap <silent> <F19><F15> :!perltidy -l=158 -ci=0 -q -<CR>

" CAPS S-g - BufferSaurus search
map <F19><PageUp> :Bsgrep  <left>
inoremap <F19><PageUp> <esc>:Bsgrep  <left>

" CAPS S-r - BufferSaurus replace
map <F19><PageDown> :Bsreplace<cr>
inoremap <F19><PageDown> <esc>:Bsreplace<cr>

" CAPS S-y - Unite yank
map <F19><F16> :Unite history/yank<cr>
inoremap <F19><F16> <esc>:Unite history/yank<cr>

" CAPS S-y - Unite yank (OSX)
map ß¥ :Unite history/yank<cr>
inoremap ß¥ <esc>:Unite history/yank<cr>

" CAPS S-w - Unite history/search
map <F19><F14> :Unite history/search<cr>
inoremap <F19><F14> <esc>:Unite history/search<cr>

" CAPS S-c - Unite history/command
map <F19><F26> :Unite history/command<cr>
inoremap <F19><F26> <esc>:Unite history/command<cr>

" CAPS S-m - Unite mark
map <F19><Insert> :Unite mark<cr>
inoremap <F19><Insert> <esc>:Unite mark<cr>


"MRU - CAPS V-L
" changed MRU to unite
" map <silent> <F27><Right> :MRU<CR>
" :inoremap <silent> <F27><Right> <Esc>:MRU<CR>
" let MRU_Max_Entries = 200

"MRU - CAPS V-Right
map <silent> <F27><Right> :Unite file_mru<CR>
:inoremap <silent> <F27><Right> <Esc>:Unite file_mru<CR>
" mac caps v-l (option_l v-l)
map <silent> √<Right> :Unite file_mru<CR>
:inoremap <silent> √<Right> <Esc>:Unite file_mru<CR>

" changed TinyBufferExplorer to Unite
"TinyBufferExplorer - CAPS-V-J
" let g:TBE_bufferLineFormat = '{%} {+} {custom}'
" let g:TBE_mruMax = 200
" function! g:TBE_custom_format(path)
"     let path = a:path
" 
"     let path = substitute(path, $HOME, '~', '')
"     let path = substitute(path, '/mnt/data\~', '~', '')
"     
"     let path = substitute(path, '/home/var_www/', '/var/www/', '')
" 
"     let path = substitute(path, '\~/links/wilder-dev', 'DEV:', '')
"     let path = substitute(path, '\~/links/wilder-web', 'WEB:', '')
"     let path = substitute(path, '\~/links/wilder-fgg', 'FGG:', '')
"     let path = substitute(path, '\~/links/wilder.ca', 'WILDER.CA:', '')
"     let path = substitute(path, '\~/links/orpheus', 'ORPHEUS:', '')
"     let path = substitute(path, '\~/links/windata', 'windata:', '')
"     let path = substitute(path, '\~/links', '*REMOTE:', '')
"     let path = substitute(path, '/var/www/emerald4/mgraham/', '[emerald-mgraham]', '')
"     let path = substitute(path, '/var/www/emerald4/stable/', '[emerald-stable]', '')
"     let path = substitute(path, 'local/checkout', '...', '')
"     let path = substitute(path, 'wcm-shared/app-lib/WCM4/', '[WCM4]', '')
"     let path = substitute(path, 'wcm-shared/template/', '[WCM4/template]', '')
"     
"     let path = substitute(path, '\~/stuff/versioned/gtd', '[GTD]', '')
"     
"     
"     let path = substitute(path, '/var/www/php-dev/act/docs/assets/mycomponents/importusers/assets/components/importusers',  '[ImportUsers::Assets]', '')
"     let path = substitute(path, '/var/www/php-dev/act/docs/assets/mycomponents/importusers/core/components/importusers',  '[ImportUsers::Core]', '')
" 
"     let path = substitute(path, '/var/www/php-dev/lcc-live-local/docs/assets/mycomponents/itmg_syndicator/assets/components/itmg_syndicator',  '[ITMG::Syndicator::Assets]', '')
"     let path = substitute(path, '/var/www/php-dev/lcc-live-local/docs/assets/mycomponents/itmg_syndicator/core/components/itmg_syndicator',     '[ITMG::Syndicator::Core]', '')
"     let path = substitute(path, '/var/www/php-dev/lcc-live-local/docs/assets/mycomponents/itmg_syndicator',     '[ITMG::Syndicator]', '')
"     
"     let path = substitute(path, '/var/www/php-dev/lcc-live-local/docs/assets/mycomponents/itmg_territory_search/assets/components/itmg_territory_search', '[ITMG::TerritorySearch::Assets]', '')
"     let path = substitute(path, '/var/www/php-dev/lcc-live-local/docs/assets/mycomponents/itmg_territory_search/core/components/itmg_territory_search', '[ITMG::TerritorySearch::Components]', '')
"     let path = substitute(path, '/var/www/php-dev/lcc-live-local/docs/assets/mycomponents/itmg_territory_search', '[ITMG::TerritorySearch]', '')
"     let path = substitute(path, '/var/www/php-dev/lcc-live-local/docs/assets/components/importx', '[ImportX]', '')
"     let path = substitute(path, '/var/www/php-dev/lcc-live-local/docs/doodles', '[MODx::Doodles]', '')
"     let path = substitute(path, '/var/www/php-dev/lcc-live-local/docs/manager', '[MODx::Manager]', '')
"     let path = substitute(path, '/var/www/php-dev/lcc-live-local/docs/core', '[MODx::Core]', '')
"     let path = substitute(path, '/var/www/php-dev/lcc-live-local/docs', '[LCC]', '')
"     let path = substitute(path, '/var/www/php-dev/', '[PHP]', '')
" 
"     return escape(path, '\')
" endfunction
" 
" 
" nmap <silent> <F27><Left> :TinyBufferExplorer<CR>
" :inoremap <silent> <F27><Left> <Esc>:TinyBufferExplorer<CR>

"MRU - CAPS V-Left
nmap <silent> <F27><Left> :Unite buffer<CR>
:inoremap <silent> <F27><Left> <Esc>:Unite buffer<CR>
" mac CAPS V-Left (Option_L V-Left)
nmap <silent> √<Left> :Unite buffer<CR>
:inoremap <silent> √<Left> <Esc>:Unite buffer<CR>


let g:CommandTMaxCachedDirectories = 0

" nmap <F27><Left> :let g:CommandTMatchWindowAtTop = 1<cr>:CommandTBuffer<CR>
" inoremap <silent> <F27><Left> <esc>:let g:CommandTMatchWindowAtTop = 1<cr>:CommandTBuffer<CR>

" " CAPS-V-I CommandT Files window
" nmap <F27><Up> :let g:CommandTMatchWindowAtTop = 0<cr>:CommandT<CR>
" inoremap <silent> <F27><Up> <esc>:let g:CommandTMatchWindowAtTop = 0<cr>:CommandT<CR>
" 
" " " CAPS-V-U CommandT Buffer window
" nmap <F27><BS> :let g:CommandTMatchWindowAtTop = 0<cr>:CommandTBuffer<CR>
" inoremap <silent> <F27><BS> <esc>:let g:CommandTMatchWindowAtTop = 0<cr>:CommandTBuffe<CR>


" " " CAPS-V-U Unite file_rec/git
" nmap <F27><s-up> :Unite file_rec/git<CR>
" inoremap <silent> <F27><s-up> <esc>:Unite file_rec/git<CR>
" nmap <s-F27><s-up> :Unite file_rec/git<CR>
" inoremap <silent> <s-F27><s-up> <esc>:Unite file_rec/git<CR>



" " CAPS-V-K CommandT Buffer window
" nmap <F27><Down> :NERDTree<cr>
" inoremap <silent> <F27><Down> <esc>:NERDTree<CR>

" CAPS-V-H
" Tags list
" map <silent> <F27><F21> :TlistToggle<CR>:wincmd w<CR>
" inoremap <silent> <F27><F21> <Esc>:TlistToggle<CR>:wincmd w<CR>i

"yank ring - show yank buffer - CAPS-S-X
map <silent> <F19><F25> :YRShow<CR>
inoremap <silent> <F19><F25> <Esc>:YRShow<CR>

"yank ring - paste previous - CAPS-SHIFT-A
let yankring_replace_n_pkey="<S-F18>"
"yank ring - paste previous - CAPS-SHIFT-S
let yankring_replace_n_nkey="<S-F19>"


" enter puts in insert mode if the buffer is editable
noremap <expr> <CR> (!&readonly && &modifiable) ? '<insert><CR>' : '<CR>'

inoremap <F8> <C-R>=strftime("%F")<CR>
nnoremap <F8> "=strftime("%F")<CR>P

function! MAG_end_toggle()
    let pos         = getpos(".") 
    let curcol      = col(".") 
    let curline     = line(".")
    let eol_incl_ws = col("$") 
    call cursor(curline, 1)
    call search('\s*$', '', curline)                                                                
    let eol_excl_ws = col(".") 
    
    call setpos(".", pos)
    if curcol > eol_excl_ws
        call cursor(curline, 1)
        call search('\s*$', '', curline)
        " call setpos(".", [pos{1}, curline, curcol, pos{4}])                      
    else
        normal $
        call cursor(curline, col(".") + 1)
        " call setpos(".", [pos{1}, curline, curcol, pos{4}])                      
    endif
endfunction


noremap <silent><End> :call MAG_end_toggle()<CR>
inoremap <silent><End> <ESC>:call MAG_end_toggle()<CR>i
vnoremap <silent><End> <End>


function! MAG_strip_eol_ws()
    let pos = getpos(".")
    s@\s*$@@
    call setpos(".", pos)
endfunction


" strip whitespace from end of line
" noremap <silent><M-end> :s@\s*$@@<CR>g
" vnoremap <silent><M-end> :s@\s*$@@<CR>gi
" inoremap <silent><M-end> <esc>:s@\s*$@@<CR>g
noremap <silent><M-end> :call MAG_strip_eol_ws()<CR>
vnoremap <silent><M-end> :call MAG_strip_eol_ws()<CR>i
inoremap <silent><M-end> <esc>:call MAG_strip_eol_ws()<CR>


function! MAG_home_toggle()
    let pos             = getpos(".") 
    let curline         = line(".")
    let curcol          = col(".") 
    normal ^
    let first_non_blank = col(".")

    call setpos(".", pos)
    if curcol >= first_non_blank
        call cursor(curline, 1)
    else
        normal ^
    endif
endfunction

noremap <silent><Home> :call MAG_home_toggle()<CR>
inoremap <silent><Home> <ESC><right>:call MAG_home_toggle()<CR>i
vnoremap <silent><Home> <Home>

" :noremap  <silent><S-Tab> i<c-n>
" :inoremap <silent><S-Tab> <c-n>

" wrap paragraph
noremap <silent><C-b> V}Ji<CR><esc><down>
inoremap <silent><C-b> <esc>V}Ji<CR><esc><down>i


" unwrap paragraph
noremap <silent><C-S-b> Vgw}<down>
inoremap <silent><C-S-b> <esc>Vgw}




" uncomment in linux
" :inoremap <C-P> <Esc>V
" :nnoremap <C-P> V
" :vnoremap <C-P> <Esc>
" 
" :inoremap <C-N> <C-O><LT><LT>
" :nnoremap <C-N> >>
" :nnoremap <C-B> <LT><LT>
" :vnoremap <C-N> >gv
" :vnoremap <C-B> <LT>gv

set selection=inclusive
set shiftwidth=1
set softtabstop=4
set autoindent

syntax on
filetype on
set bs=indent,eol,start
set expandtab
set fileformats=unix
set formatoptions=cq2l
set listchars=eol:$,tab:>-,trail:=,extends:>
set nocompatible
set nohls
set ruler
set shm=t
set so=2
set title
set wh=4
set modeline
set wildmenu
set cursorline
set lines=43
set columns=157

" don't copy every selection to the system clipboard
" set go-=a
" don't include tearoff menu items
" set go-=t
set guioptions=egimrL




" word left and right (does not work on mac TODO: find workaround)
map <C-Left> b
map <C-Right> w
" word left and right (mac version) 
map <M-Left> b
map <M-Right> w




" 
" " map CAPS+F3 to be ESC (because bt keyboard doesn't have esc key
" inoremap <F35> <Esc>
" noremap <F35> <Esc>
" vnoremap <F35> <Esc>
" onoremap <F35> <Esc>
" cnoremap <F35> <Esc>


set laststatus=2



" highlight NonText guifg=#bbbbbb guibg=#ffffff

" if we ever get the new style debugger working...
" map <silent> <F5> :DbgStepInto<CR>
" map <silent> <F6> :DbgStepOver<CR>
" map <silent> <S-F5> :DbgStepOut<CR>
" map <silent> <C-F5> :DbgRun<CR>
" map <silent> <C-S-F5> :DbgDetach<CR>
" map <silent> <F11> :DbgAddWatch<CR>
" map <silent> <F12> :DbgToggleBreakpoint<CR>

let g:ruby_debugger_no_maps = 1
        
map <Leader>db  :call g:RubyDebugger.toggle_breakpoint()<CR>
map <Leader>dv  :call g:RubyDebugger.open_variables()<CR>
map <Leader>dm  :call g:RubyDebugger.open_breakpoints()<CR>
map <Leader>dt  :call g:RubyDebugger.open_frames()<CR>
map <Leader>ds  :call g:RubyDebugger.step()<CR>
map <Leader>df  :call g:RubyDebugger.finish()<CR>
map <Leader>dn  :call g:RubyDebugger.next()<CR>
map <Leader>dc  :call g:RubyDebugger.continue()<CR>
map <Leader>de  :call g:RubyDebugger.exit()<CR>
map <Leader>dd  :call g:RubyDebugger.remove_breakpoints()<CR>


" Vim debugger commands
" map <C-F4> :python debugger_resize()<cr>
" map <F5> :python debugger_command('step_into')<cr>
" map <F6> :python debugger_command('step_over')<cr>
" map <S-F5> :python debugger_command('step_out')<cr>
" map <C-F5> :python debugger_run()<cr>
" map <C-S-F5> :python debugger_quit()<cr>
" nnoremap ,e :python debugger_watch_input("eval")<cr>A
" nnoremap <F1> :python debugger_watch_input("eval")<cr>A
" map <F11> :python debugger_context()<cr>
" map <F12> :python debugger_property()<cr>
" map <F11> :python debugger_watch_input("context_get")<cr>A<cr>
" map <C-F12> :python debugger_watch_input("property_get", '<cword>')<cr>A<cr>
" 

"new vim debugger commands
let g:vdebug_keymap = {
\    "run" : "<C-F5>",
\    "run_to_cursor" : "<F1>",
\    "step_over" : "<F6>",
\    "step_into" : "<F5>",
\    "step_out" : "<F7>",
\    "close" : "<F4>",
\    "detach" : "<C-F4>",
\    "set_breakpoint" : "<C-F11>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e",
\}

let g:vdebug_options= {
\    "port" : 9000,
\    "server" : 'localhost',
\    "timeout" : 20,
\    "on_close" : 'detach',
\    "break_on_open" : 1,
\    "ide_key" : '',
\    "path_maps" : {},
\    "debug_window_level" : 0,
\    "debug_file_level" : 0,
\    "debug_file" : "",
\    "watch_window_style" : 'compact',
\    "marker_default" : '⬦',
\    "marker_closed_tree" : '▸',
\    "marker_open_tree" : '▾'
\}

let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<c-s-space>'

let g:ctrlp_mruf_default_order = 1 

" RSpec.vim mappings

" let g:rspec_command = "!/home/michael/bin/bundle_exec_rspec {spec}"
" command below works!
" let g:rspec_command = "!/home/michael/.rbenv/shims/ruby bin/bundle exec rspec {spec}"
" 
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rr :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" mac cmd-r -save and run last spec
map <D-r> :w<bar>:call RunLastSpec()<CR>
imap <D-r> <esc>:w<bar>:call RunLastSpec()<CR>

" mac option-s -save and close buffer
map ß :w<bar>:bd<CR>
imap ß <esc>:w<bar>:bd<CR>

" 
" imap <Leader>t :call RunCurrentSpecFile()<CR>
" imap <Leader>s :call RunNearestSpec()<CR>
" imap <Leader>l :call RunLastSpec()<CR>
" imap <Leader>a :call RunAllSpecs()<CR>

let g:SweetVimRspecUseBundler = 0
map <S-M-F> :SweetVimRspecRunFile<CR>  
map <S-M-R> :SweetVimRspecRunFocused<CR>  
map <S-M-P> :SweetVimRspecRunPrevious<CR>  

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateDown<cr>
nnoremap <silent> <c-i> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>


" move by screen line instead of file line
nnoremap <silent><m-up> gk
nnoremap <silent><m-down> gj
inoremap <silent><m-up> <esc>gkli
inoremap <silent><m-down> <esc>gjli




" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)



let g:ack_mappings = {
      \ "<CR>": "<CR>"
\}


" gundo
noremap <silent><m-u> :GundoToggle<CR>
inoremap <silent><m-u> :GundoToggle<CR>
" gundo - osx - shift cmd u
noremap <silent><D-BS> :GundoToggle<CR>
inoremap <silent><D-BS> :GundoToggle<CR>


" show/hide whitespace 
noremap <Leader>hs :ToggleWhitespace<CR>
noremap <Leader>hw :StripWhitespace<CR>


" enable/disable gitgutter
noremap <Leader>ht :GitGutterToggle<CR>

" open Fugitive's Gstatus
noremap <Leader>hg :Gstatus<CR>
noremap <Leader>hh :only<CR>:Gstatus<CR>
noremap <Leader>hb :Gblame<CR>
noremap <Leader>hd :Gdiff<CR>

" open syntastic errors
noremap <Leader>he :Errors<CR>:lopen<CR><CR>

nmap <Leader>hi <Plug>(qf_loc_previous)
nmap <Leader>hk <Plug>(qf_loc_next)

" open jquery docs - can't get mapping to work
" let g:jquery_doc_mapping='<Leader>dj'

" CAPS-A: secondary <esc> (easier to reach than the real <esc>)
inoremap <F18> <esc>
cnoremap <F18> <esc>

" jk: tertiary <esc> 
inoremap jk <esc>
cnoremap jk <esc>

" local leader - for vimoutline
" let maplocalleader = '<f12><f12>'
let maplocalleader="\\"



" browsing next and prev items - shortcuts for [c and ]c
" ctrl-e - previous change
map <c-e> [c
imap <c-e> <esc>[cgi
" mac cmd-e
map <D-e> [c
imap <D-e> <esc>[cgi


" ctrl-d - next change
noremap  <c-d> ]c
inoremap <c-d> <esc>]cgi
" mac cmd-d
map <D-d> [c
imap <D-d> <esc>[cgi

" word navigation
" caps-c-j already moves word left
" caps-c-l already moves word right

" caps-/ play macro @a
map <F32> @a 
inoremap <F32> <esc>@a 
" TODO mac equivalent
map ÷ @a 
inoremap ÷ <esc>@a 

function! MAG_add_breakpoint()
  let pos    = getpos(".")
  let curcol = col(".")
  call feedkeys("\<esc>^i\<cr>\<up>binding.pry\<down>\<esc>")
  call setpos(".", pos)
endfunction


" osx opt-m add binding.pry on its own line at current indent level
inoremap µ <esc>:call MAG_add_breakpoint()<cr>i
noremap µ :call MAG_add_breakpoint()<cr>

let g:vim_byebug_breakpoints_map_keys = 0
inoremap Â <esc>:ToggleByebugBreakpoint<cr>
noremap Â :ToggleByebugBreakpoint<cr>

" <s-Tab>: invoke completion
let g:ycm_key_invoke_completion = '<S-Tab>'
" FIXME: get working on mac


" from http://vim.wikia.com/wiki/Smart_mapping_for_tab_completion
" doesn't work, because YouCompleteMe takes over the completion function
" function! Smart_TabComplete()
"   let line = getline('.')                         " current line
" 
"   let substr = strpart(line, -1, col('.')+1)      " from the start of the current
"                                                   " line to one character right
"                                                   " of the cursor
"   let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
"   if (strlen(substr)==0)                          " nothing to match on empty string
"     return "\<tab>"
"   endif
"   let has_period = match(substr, '\.') != -1      " position of period, if any
"   let has_slash = match(substr, '\/') != -1       " position of slash, if any
"   if (!has_period && !has_slash)
"     return "\<C-X>\<C-P>"                         " existing text matching
"   elseif ( has_slash )
"     return "\<C-X>\<C-F>"                         " file matching
"   else
"     return "\<C-X>\<C-O>"                         " plugin matching
"   endif
" endfunction
" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" opt-tab - completion
inoremap  <c-x><c-u>



" c-a-o - go forward in history list
:nnoremap  <C-I>
:inoremap  <C-I>


" FIXME: mappings do not work!
" nmap <leader>q <Plug>(seeing-is-believing-run)
" xmap <leader>q <Plug>(seeing-is-believing-run)
" imap <leader>q <Plug>(seeing-is-believing-run)
" 
" nmap <leader>w <Plug>(seeing-is-believing-mark)
" xmap <leader>w <Plug>(seeing-is-believing-mark)
" imap <leader>w <Plug>(seeing-is-believing-mark)




" sneak
"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

nmap ' <Plug>SneakPrevious
nmap \ <Plug>SneakPrevious
nmap ; <Plug>SneakNext

nmap <S-Home> <Plug>SneakPrevious
nmap <S-End>  <Plug>SneakNext
imap <S-Home> <esc><Plug>SneakPrevious
imap <S-End>  <esc><Plug>SneakNext


" toggle line numbers
imap <F12> <esc>:call ToggleLinenums()<CR>
map <F12> :call ToggleLinenums()<CR>


" todo.txt mapping
nnoremap <script> <silent> <buffer> <LocalLeader>s :call TodoTxtSort()<CR>


" dbext - execute paragraph under cursor (i.e. there should be a blank line above and below
nnoremap <Leader>ss mzvap:DBExecVisualSQL<CR>`z

" dbext - more terse (mysql-specific) describe table under cursor
" nnoremap <Leader>sd "yyiw:DBExecSQL describe <C-R>y<CR>

" table mode motions - not working 
" map <M-C-Left> <esc>[{           
" map [c [|                        
" map ]c ]|                        
" map {<F26> {|                    
" map {<F26> }|                    

" left one cell
map [s :call tablemode#spreadsheet#cell#Motion('h')<CR>
" right one cell
map ]s :call tablemode#spreadsheet#cell#Motion('l')<CR>
" up one cell
map }<F19> :call tablemode#spreadsheet#cell#Motion('j')<CR>
" down one cell
map {<F19> :call tablemode#spreadsheet#cell#Motion('k')<CR>


" move cursor to window above
noremap <C-w>i <C-w>k 
inoremap <C-w>i <esc><C-w>k 

noremap <M-S-Up> <C-w>k
inoremap <M-S-Up> <esc><C-w>k

" move cursor to window right
noremap <M-S-Right> <C-w>l
inoremap <M-S-Right> <esc><C-w>l

" move cursor to window left
noremap <C-w>j <C-w>h
inoremap <C-w>j <esc><C-w>h

noremap <M-S-Left> <C-w>h
inoremap <M-S-Left> <esc><C-w>h

" move cursor to window down
noremap <C-w>k <C-w>j 
inoremap <C-w>k <esc><C-w>j 

noremap <M-S-Down> <C-w>j
inoremap <M-S-Down> <esc><C-w>j

nmap <leader>t :ToggleWord<CR>

"FormatJSON command
:com! -range=% FormatJSON <line1>,<line2>!python -m json.tool

" allow dot to repeat commands over all lines in a block
vnoremap . :normal .<CR>



" Find the tab number containing a file matching the specified string, or "" if not found
function! FindBufferTab(search)
  let tabindex = ""
  for i in range(tabpagenr('$'))
      for b in tabpagebuflist(i + 1)
        if bufname(b) =~ a:search
          let tabindex = i
        endif
      endfor
  endfor
  return tabindex
endfunction

" Go to the tab containing a file matching the specified string, creating the tab if it does not exist
function! FindOrCreateBufferTab(search)
  let tabindex = FindBufferTab(a:search)
  if tabindex == ""
    :tabnew
    exec "e " . a:search
  else
    exec "tabn " . (tabindex + 1)
  endif
endfunction


" CAPS-V-S Switch to pangea.sql
nmap <F27><F19> :call FindOrCreateBufferTab('pangea.sql')<cr>
inoremap <silent> <F27><F19> <esc>:call FindOrCreateBufferTab('pangea.sql')<cr>
" mac CAPS-V-S
nmap √ß :call FindOrCreateBufferTab('pangea.sql')<cr>
inoremap <silent> √ß <esc>:call FindOrCreateBufferTab('pangea.sql')<cr>


" mac: opt-enter = enter
map  <CR>
imap  <CR>


" mac: next tab
map <D-PageDown> :tabnext<cr>
imap <D-PageDown> <esc>:tabnext<cr>
map <D-PageUp> :tabprev<cr>
imap <D-PageUp> <esc>:tabprev<cr>

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<c-n>'
let g:multi_cursor_prev_key='<c-p>'
let g:multi_cursor_skip_key='<c-x>'
let g:multi_cursor_quit_key='<Esc>'

" OSX: map non-breaking space to space
imap <m-space> <space>


" pseudo-macros

" <leader>rb - format ruby test block
" takes a block of rspec errors and converts them to a unique list of paths and line numbers
"
" " from this:
" rspec ./spec/managers/supplier_item_variant_manager_spec.rb:113 # SupplierItemVariantManager property creation when the properties are initially included in the hash and then re-imported (item update), with a fast update manager limit the 'format' variant properties is created
" rspec ./spec/managers/supplier_item_variant_manager_spec.rb:113 # SupplierItemVariantManager property creation when the properties are initially included in the hash and then re-imported (item update), with a fast update manager limit the 'format' variant properties is created
" 
" " to this:
" 
" spec/managers/supplier_item_variant_manager_spec.rb:113 

map <leader>rb <esc>vip:s@#.*@@<cr><home>vic<right><right><right>dvip:!sort -u<cr>


" (OSX) <opt-shift-R> - go to rspec error line (path:linenum), go to the file and mark the block with focus => true and skip => true
map ‰ <esc>gF:call ToggleFocusTrue()<cr>:call ToggleSkipTrue()<cr><c-o><down>

" search for selected text
vnoremap // y/<C-R>"<CR>
" search for selected text but without moving cursor - useful for gn operator
vnoremap ** y/<C-R>"<CR>``



" camelCaseMotion commands
" (leader versions)
" map <silent> <leader>w <Plug>CamelCaseMotion_w
" map <silent> <leader>b <Plug>CamelCaseMotion_b
" map <silent> <leader>e <Plug>CamelCaseMotion_e
" map <silent> <leader>ge <Plug>CamelCaseMotion_ge
" sunmap <leader>w
" sunmap <leader>b
" sunmap <leader>e
" sunmap <leader>ge
" omap <silent> <leader>iw <Plug>CamelCaseMotion_iw
" xmap <silent> <leader>iw <Plug>CamelCaseMotion_iw
" omap <silent> <leader>ib <Plug>CamelCaseMotion_ib
" xmap <silent> <leader>ib <Plug>CamelCaseMotion_ib
" omap <silent> <leader>ie <Plug>CamelCaseMotion_ie
" xmap <silent> <leader>ie <Plug>CamelCaseMotion_ie

" camelCaseMotion commands
" (comma versions)
map <silent> ,w <Plug>CamelCaseMotion_w
map <silent> ,b <Plug>CamelCaseMotion_b
map <silent> ,e <Plug>CamelCaseMotion_e
map <silent> ,ge <Plug>CamelCaseMotion_ge

" FIXME: why are these no longer defined?
" sunmap <leader>w
" sunmap <leader>b
" sunmap <leader>e
" sunmap <leader>ge

omap <silent> ,iw <Plug>CamelCaseMotion_iw
xmap <silent> ,iw <Plug>CamelCaseMotion_iw
omap <silent> ,ib <Plug>CamelCaseMotion_ib
xmap <silent> ,ib <Plug>CamelCaseMotion_ib
omap <silent> ,ie <Plug>CamelCaseMotion_ie
xmap <silent> ,ie <Plug>CamelCaseMotion_ie


" dirvish: preview with F3
" autocmd FileType dirvish nnoremap <silent><buffer> <f3> :<C-U>.call dirvish#open("p", 1)<CR>

" dirvish: Go up with <BS>
autocmd FileType dirvish nnoremap <silent><buffer> <BS> :call feedkeys("-")<CR>


