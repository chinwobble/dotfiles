let s:channels = {}
let s:jobs = {}
let s:host = {}

function! databricks#stdio#ErrHandler(channel, message) abort
  echom a:message
endfunction

function! databricks#stdio#OutHandler(channel, message) abort
  echom a:message
endfunction

function! s:JobStart() abort
  let opts = {
        \'err_cb': 'databricks#stdio#ErrHandler',
        \'out_cb': 'databricks#stdio#OutHandler'
        \}
  let command = "cmd /c "
        \. "call C:\\tools\\miniconda3\\condabin\\conda_hook.bat "
        \. "&& conda activate risbricks"

  let command = [&shell, '/k', "echo AB"]

  let job = {
  \ 'start_time': reltime(),
  \ 'job_id': job_start(command, opts)
  \}
  let channel_id = job_getchannel(job.job_id)
  let s:channels[channel_id] = job
  return job
endfunction

function! databricks#stdio#GetHost() abort
  let host = gettabvar(tabpagenr(), 'databricks_host_job')
  if empty(host)
    let host = s:JobStart()
    call settabvar(tabpagenr(), 'databricks_host_job', host)
  endif
  let s:host = host
  return host
endfunction

function! databricks#stdio#RequestSend(request, command, options) abort
endfunction
