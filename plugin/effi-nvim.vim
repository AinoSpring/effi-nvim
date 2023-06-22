if exists("g:loaded_effinvim")
    finish
endif
let g:loaded_effinvim = 1

command! -nargs=0 EffiLoad lua require("effi-nvim").load()
command! -nargs=0 EffiRun lua require("effi-nvim").run()
command! -nargs=0 EffiStop lua require("effi-nvim").stop()
command! -nargs=0 EffiPrint lua require("effi-nvim").print()
