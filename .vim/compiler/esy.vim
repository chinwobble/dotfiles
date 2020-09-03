if exists("current_compiler")
    finish
endif
let current_compiler = "esy"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=esy
CompilerSet errorformat =
      \%EFile\ \"%f\"\\,\ lines\ %*\\d-%l\\,\ characters\ %c-%*\\d:,
      \%EFile\ \"%f\"\\,\ line\ %l\\,\ characters\ %c-%*\\d:,
      \%EFile\ \"%f\"\\,\ line\ %l\\,\ characters\ %c-%*\\d\ %.%#,
      \%EFile\ \"%f\"\\,\ line\ %l\\,\ character\ %c:%m,
      \%+EReference\ to\ unbound\ regexp\ name\ %m,
      \%Eocamlyacc:\ e\ -\ line\ %l\ of\ \"%f\"\\,\ %m,
      \%Wocamlyacc:\ w\ -\ %m,
      \%-Zmake%.%#,
      \%C%m,
      \%D%*\\a[%*\\d]:\ Entering\ directory\ `%f',
      \%X%*\\a[%*\\d]:\ Leaving\ directory\ `%f',
      \%D%*\\a:\ Entering\ directory\ `%f',
      \%X%*\\a:\ Leaving\ directory\ `%f',
      \%D%*\\a[%*\\d]:\ Entering\ directory\ '%f',
      \%X%*\\a[%*\\d]:\ Leaving\ directory\ '%f',
      \%D%*\\a:\ Entering\ directory\ '%f',
      \%X%*\\a:\ Leaving\ directory\ '%f',
      \%DEntering\ directory\ '%f',
      \%XLeaving\ directory\ '%f',
      \%DMaking\ %*\\a\ in\ %f,
      \%-G\(cd\ \_build%.%#,
      \%-Ginfo%.%#,


let &cpo = s:cpo_save
unlet s:cpo_save
