
" Tabs
set tabstop=4
set expandtab
set autoindent
set smartindent


" Syntax always on
:syntax on

" Toggle syntax highlighting with ;syn
function ToggleSyntax()
    if exists("g:syntax_on")
		syntax off
	else
		syntax on
	endif
endfunction

nmap <silent> ;syn :call ToggleSyntax()<CR>


" Toggle spell checking with ;spell 
function ToggleSpell()
	if &l:spell
		setlocal nospell
	else
		setlocal spell spelllang=en_us
	endif
endfunction

nmap <silent> ;spell :call ToggleSpell()<CR>
