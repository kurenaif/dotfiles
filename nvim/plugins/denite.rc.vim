nnoremap <silent> <leader>/ :<C-u>Denite -buffer-name=search -auto-resize line<CR>
nnoremap <silent> <leader>g :<C-u>DeniteCursorWord grep -buffer-name=search line<CR><C-R><C-W><CR>
nnoremap <silent> <leader>f :<C-u>DeniteBufferDir -cursor-wrap=true file file:new<CR>
nnoremap <silent> <C-p> :<C-u>Denite file/rec<CR>
