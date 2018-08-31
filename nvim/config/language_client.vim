" Section: Language Client
" ------------------------

let g:LanguageClient_serverCommands = {}

let g:LanguageClient_diagnosticsList = 'location'

let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'

if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands['javascript.jsx'] = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands.typescript = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands.json = ['json-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.css = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.scss = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.less = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.html = ['html-languageserver', '--stdio']
endif

if executable('bash-language-server')
  let g:LanguageClient_serverCommands.sh = ['bash-language-server', 'start']
endif
