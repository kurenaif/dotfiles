let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : "40vsplit",
\       "outputter/error/error"   : 'quickfix',
\       "outputter" : 'error',
\       "outputter/error/success" : 'buffer',
\   }
\}
au FileType qf nnoremap <silent><buffer>q :quit<CR><Paste>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
