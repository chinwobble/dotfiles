syn match ArrowHead contained ">" conceal cchar=?
syn match ArrowTail contained "-" conceal cchar=-
syn match ArrowFull "->" contains=ArrowHead,ArrowTail
