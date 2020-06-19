syn region todo_1 start=/^- / end=/$/
hi! link todo_1 String
syn region todo_2 start=/^-- / end=/$/
hi! todo_2 ctermfg=green
syn region todo_3 start=/^--- / end=/$/
hi! todo_3 ctermfg=blue
syn region todo_4 start=/^---- / end=/$/
hi! todo_4 ctermfg=red
syn region todo_done start=/^+- / end=/$/
hi! todo_done ctermfg=darkgrey
syn region todo_date start=/..\/..\/..../ end=/$/
hi! todo_date ctermfg=lightblue
