" echo symbol/type of item under cursor
command! TSSsymbol call tss#cmd("symbol",{})
command! TSStype call tss#cmd("type",{})

" jump to definition of item under cursor
command! TSSdef call tss#def("edit")
command! TSSdefpreview call tss#def("pedit")
command! TSSdefsplit call tss#def("split")
command! TSSdeftab call tss#def("tabe")

" update TSS with current file source
" TODO: integrate into TSScmd
command! TSSupdate call tss#update()

" dump TSS internal file source
command! -nargs=1 TSSdump call tss#cmd("dump ".<f-args>." ".expand("%:p"),{'rawcmd':1})

" completions
command! TSScomplete call tss#complete()

" reload project sources
command! TSSreload call tss#reload()

" create quickfix list from TSS errors
command! TSSshowErrors call tss#showErrors()

" start typescript service process asynchronously, via python
" TODO: the only reason for shell=True is to avoid popup console window;
"       is there a more direct way?
command! -nargs=1 TSSstart call tss#start(<f-args>)
command! TSSstarthere call tss#start(expand("%"))

" TSS command tracing, off by default
python traceFlag = False
"python traceFlag = True 

command! -nargs=1 TSStrace call tss#trace(<f-args>)

" pass a command to typescript service, get answer
command! -nargs=1 TSScmd call tss#cmd(<f-args>,{})

" check typescript service
" (None: still running; <num>: exit status)
command! TSSstatus call tss#status()

" stop typescript service
command! TSSend call tss#end()

