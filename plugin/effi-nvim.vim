if exists("g:loaded_effinvim")
    finish
endif
let g:loaded_effinvim = 1

command! -nargs=0 EffiLoad lua require("effi-nvim").load()
command! -nargs=? EffiRun lua require("effi-nvim").run(<f-args>)
command! -nargs=? EffiBuild lua require("effi-nvim").build(<f-args>)
command! -nargs=0 EffiStop lua require("effi-nvim").stop()
command! -nargs=0 EffiPrint lua require("effi-nvim").print()

lua require("effi-nvim").load(true)
