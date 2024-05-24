set complete=
call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('autoCompleteEvents',
  \ ['InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged'])
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

" Commandline completion
nnoremap :       <Cmd>call CommandlinePre()<CR>:
function! CommandlinePre() abort
	cnoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
	cnoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
	cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
	cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

	" Overwrite sources
	if !exists('b:prev_buffer_config')
		let b:prev_buffer_config = ddc#custom#get_buffer()
	endif
	call ddc#custom#patch_buffer('cmdlineSources',
	\ ['necovim', 'around'])

	autocmd User DDCCmdlineLeave ++once call CommandlinePost()
	autocmd InsertEnter <buffer> ++once call CommandlinePost()

	" Enable command line completion
	call ddc#enable_cmdline_completion()
endfunction
function! CommandlinePost() abort
	set complete=
	silent! cunmap <Tab>
	silent! cunmap <S-Tab>
	silent! cunmap <C-n>
	silent! cunmap <C-p>
	silent! cunmap <C-y>
	silent! cunmap <C-e>

	" Restore sources
	if exists('b:prev_buffer_config')
		call ddc#custom#set_buffer(b:prev_buffer_config)
		unlet b:prev_buffer_config
	else
		call ddc#custom#set_buffer({})
	endif
endfunction

if has('nvim')
  call ddc#custom#patch_global('sources', ['lsp', 'vsnip', 'buffer', 'around', 'file', 'dictionary'])
else
  call ddc#custom#patch_global('sources', ['vim-lsp', 'vsnip', 'buffer', 'around', 'file', 'dictionary'])
endif

call ddc#custom#patch_global('sourceOptions',
\ #{
\   _: #{
\     matchers: ['matcher_fuzzy'],
\     sorters: ['sorter_fuzzy'],
\     converters: ['converter_remove_overlap', 'converter_truncate', 'converter_fuzzy'],
\     ignoreCase: v:true,
\   },
\   around: #{
\     mark: 'A',
\   },
\   buffer: #{mark: 'B', ignoreCase: v:true},
\   dictionary: #{
\     mark: 'D',
\     minAutoCompleteLength: 3,
\   },
\   necovim: #{
\     mark: 'neco'
\   },
\   nvim-lsp: #{
\     mark: 'lsp',
\     forceCompletionPattern: '\.\w*|:\w*|->\w*',
\     ignoreCase: v:true,
\   },
\   vim-lsp: #{
\     mark: 'lsp',
\     forceCompletionPattern: "\\.|:\\s*|->",
\     ignoreCase: v:true
\   },
\   file: #{
\     mark: 'F',
\     isVolatile: v:true,
\     forceCompletionPattern: '\S/\S*',
\   },
\   vsnip: #{
\     mark: 'vsnip',
\     dup: v:true,
\   },
\ })

call ddc#custom#patch_global('sourceOptions', #{
    \   vim-lsp: #{
    \     matchers: ['matcher_head'],
    \     mark: 'lsp',
    \   },
    \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ 'buffer': {'forceCollect': v:true, 'fromAltBuf': v:true},
      \ 'dictionary': {'smartCase': v:true, 'showMenu': v:false},
      \ })

call ddc#custom#patch_global('filterParams', {
      \ 'converter_truncate': {'maxAbbrWidth': 60, 'maxInfo': 500, 'ellipsis': '...'},
      \ 'converter_fuzzy': {'hlGroup': 'Title'},
      \ })

call ddc#custom#patch_global('specialBufferCompletion', v:true)

call ddc#custom#patch_filetype(
      \ ['denite-filter', 'TelescopePrompt'], 'specialBufferCompletion', v:false
      \ )

call ddc#custom#patch_filetype(['vim', 'toml'], {
      \ 'sources': ['necovim', 'buffer', 'around', 'vsnip', 'file', 'dictionary'],
      \ })

call ddc#custom#patch_filetype(
      \ ['zsh'], 'sources', ['zsh']
      \ )

call ddc#custom#patch_filetype(['zsh'], 'sourceOptions', {
      \ 'zsh': {'mark': 'Z'},
      \ })

call ddc#enable()
