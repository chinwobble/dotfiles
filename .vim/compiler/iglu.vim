if exists("current_compiler")
    finish
endif
let current_compiler = "iglu"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=make
CompilerSet errorformat =
      \FAILURE:\ Schema\ [%f]\ %m,
      \%DEntering\ directory\ %f,


let &cpo = s:cpo_save
unlet s:cpo_save
