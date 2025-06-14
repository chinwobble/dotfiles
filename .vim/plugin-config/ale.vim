vim9script

g:ale_disable_lsp = 1
g:ale_sign_column_always = 1
g:ale_sign_error = '>'
g:ale_sign_warning = '-'
g:ale_sign_info = '-'
g:ale_c_parse_makefile = 1
g:ale_fixers = {
  '*': ['remove_trailing_lines', 'trim_whitespace'],
  'javascript': ['prettier', 'eslint'],
  'typescript': ['prettier', 'eslint'],
  'yaml': ['prettier'],
}
g:ale_linters = {
  'markdown': ['alex'],
  'vimwiki': ['alex', 'cspell', 'proselint', 'writegood'],
}
g:ale_fix_on_save = 1
g:ale_pattern_options = {
  '.*\.py$': {ale_enabled: 0},
  '.*\.md$': {ale_enabled: 0}
}
