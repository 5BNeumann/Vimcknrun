if !exists("g:cr3_installation_dir")
  let g:cr3_installation_dir = $HOME . "/.chicknrun/cr3.py"  " Default path
endif

function! Vimcknrun#Update() abort
	if filereadable(g:cr3_installation_dir)
		silent execute '!python3 '.shellescape(g:cr3_installation_dir)." update"
		:!
	else
		echohl ErrorMsg
		echom "Chicknrun not found at: " . g:cr3_installation_dir
		echohl None
	endif
endfunction

function! Vimcknrun#Norminette() abort
	if filereadable(g:cr3_installation_dir)
		silent execute '!python3 '.shellescape(g:cr3_installation_dir)." norminette"
		:!
	else
		echohl ErrorMsg
		echom "Chicknrun not found at: " . g:cr3_installation_dir
		echohl None
	endif
endfunction

function! Vimcknrun#RunGDB() abort
	if filereadable(g:cr3_installation_dir)
		silent execute '!python3 '.shellescape(g:cr3_installation_dir)." run_gdb"
		:!
	else
		echohl ErrorMsg
		echom "Chicknrun not found at: " . g:cr3_installation_dir
		echohl None
	endif
endfunction

function! Vimcknrun#Check() abort
	if filereadable(g:cr3_installation_dir)
		silent execute '!python3 '.shellescape(g:cr3_installation_dir)." check"
		:!
	else
		echohl ErrorMsg
		echom "Chicknrun not found at: " . g:cr3_installation_dir
		echohl None
	endif
endfunction

function! Vimcknrun#Compile() abort
	let l:args = input("Enter executable name (default 'binary'): ")
	if filereadable(g:cr3_installation_dir)
		if l:args == ''
			silent execute '!python3 '.shellescape(g:cr3_installation_dir) . ' compile'
			:!
		else
			silent execute '!python3 '.shellescape(g:cr3_installation_dir) . ' compile ' . l:args
			:!
		endif
	else
		echohl ErrorMsg
		echom "Chicknrun not found at: " . g:cr3_installation_dir
		echohl None
	endif
endfunction

function! Vimcknrun#Run() abort
	let l:args = input("Enter run args: ")
	if filereadable(g:cr3_installation_dir)
		if l:args == ''
			silent execute '!python3 '.shellescape(g:cr3_installation_dir) . ' run'
			:!
		else
			silent execute '!python3 '.shellescape(g:cr3_installation_dir) . ' run ' . l:args
			:!
		endif
	else
		echohl ErrorMsg
		echom "Chicknrun not found at: " . g:cr3_installation_dir
		echohl None
	endif
endfunction

function! Vimcknrun#RunMain() abort
	let l:args = input("Enter main file content: ")
	if filereadable(g:cr3_installation_dir)
		if l:args == ''
			silent execute '!python3 '.shellescape(g:cr3_installation_dir) . ' run_main'
			:!
		else
			silent execute '!python3 '.shellescape(g:cr3_installation_dir) . ' run_main ' . l:args
			:!
		endif
	else
		echohl ErrorMsg
		echom "Chicknrun not found at: " . g:cr3_installation_dir
		echohl None
	endif
endfunction

function! Vimcknrun#FullWorkflow() abort
	let l:args = input("Enter full workflow args: ")
	if filereadable(g:cr3_installation_dir)
		if l:args == ''
			silent execute '!python3 '.shellescape(g:cr3_installation_dir) . ' full_workflow'
			:!
		else
			silent execute '!python3 '.shellescape(g:cr3_installation_dir) . ' full_workflow ' . l:args
			:!
		endif
	else
		echohl ErrorMsg
		echom "Chicknrun not found at: " . g:cr3_installation_dir
		echohl None
	endif
endfunction

if !exists("g:cr3check")
  let g:cr3check = ""
endif
if !exists("g:cr3update")
  let g:cr3update = ""
endif
if !exists("g:cr3norminette")
  let g:cr3norminette = ""
endif
if !exists("g:cr3compile")
  let g:cr3compile = ""
endif
if !exists("g:cr3run")
  let g:cr3run = ""
endif
if !exists("g:cr3runmain")
  let g:cr3runmain = ""
endif
if !exists("g:cr3fullworkflow")
  let g:cr3fullworkflow = ""
endif

execute 'nnoremap <silent> ' . g:cr3check . ' :call Vimcknrun#Check()<CR>'
execute 'nnoremap <silent> ' . g:cr3update . ' :call Vimcknrun#Update()<CR>'
execute 'nnoremap <silent> ' . g:cr3norminette . ' :call Vimcknrun#Norminette()<CR>'
execute 'nnoremap <silent> ' . g:cr3rungdb . ' :call Vimcknrun#RunGDB()<CR>'
execute 'nnoremap <silent> ' . g:cr3compile . ' :call Vimcknrun#Compile()<CR>'
execute 'nnoremap <silent> ' . g:cr3run . ' :call Vimcknrun#Run()<CR>'
execute 'nnoremap <silent> ' . g:cr3runmain . ' :call Vimcknrun#RunMain()<CR>'
execute 'nnoremap <silent> ' . g:cr3fullworkflow . ' :call Vimcknrun#FullWorkflow()<CR>'
