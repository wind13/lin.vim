"" ---- color scheme ----

"" pick random color
syntax enable
let s:mycolor = ['solarized', 'molokai', 'monokai', 'dracula', 'koehler', 'gruvbox', 'torte', 'darkblue', 'desert', 'evening', 'peachpuff', 'oceanicnext', 'neodark', 'solarized8_high', 'base16-default-dark', 'lucario', 'srcery', 'subtle_light', 'palenight', 'ayu', 'nord', 'OceanicNext', 'one', 'hybrid', 'zenburn', 'badwolf']

if has("gui_running")
    let curcolor = localtime() % 101 % len(s:mycolor)
    if localtime() % 3 == 0
        execute 'set background=light'
    else
        execute 'set background=dark'
    endif
    execute 'colorscheme ' .s:mycolor[curcolor]
endif

function RandomColor()
    if has("gui_running")
        let curcolor = localtime() % 101 % len(s:mycolor)
        if localtime() % 3 == 0
            execute 'set background=light'
        else
            execute 'set background=dark'
        endif
        execute 'colorscheme ' .s:mycolor[curcolor]
    endif
endfunction

nmap <F9> :call RandomColor()<cr>