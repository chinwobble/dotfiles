let g:building = 0
let g:queueBuild = 0

function! esy#stdio#OutHandler(job, message)
endfunction

function! esy#stdio#Make() abort

    "if a build is active, queue a build instead
    if g:building != 0
        let g:queueBuild = 1
        return
    endif

    "create/wipe the make buffer
    let currentBuf = bufnr('%')
    let g:makeBufNum = bufnr('make_buffer', 1)
    exec g:makeBufNum . 'bufdo %d'
    exec 'b ' . currentBuf

    "execute the job
    let cmd = 'tree'
    echom cmd
    let s:job = job_start(cmd,
          \{'out_io': 'buffer',
          \'out_name': 'make_buffer',
          \'out_cb': 'esy#stdio#OutHandler',
          \'exit_cb': 'esy#stdio#ExitHandler'})
endfunction

function! ExitHandler(job, status)
    "load the qf list
    exec 'silent! cb! ' . g:makeBufNum

    "update airline
    let list = getqflist()
    let ecount = 0
    for i in list
        if i.type == "E"
            let ecount+=1
        endif
    endfor
    let g:errorCount = ecount
    exec 'AirlineRefresh'

    "call ProjectMake if a build is queued
    let g:building = 0
    if g:queueBuild == 1
        call esy#stdio#Make()
    endif

endfunction
