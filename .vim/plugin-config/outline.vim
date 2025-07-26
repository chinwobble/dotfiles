vim9script

g:outline_include_before_exclude = {
  go: true
}


g:outline_autoclose = true
g:outline_win_size = &columns

g:outline_pattern_to_include = {
  go: [
    "^func",
    "^type",
  ]
}
