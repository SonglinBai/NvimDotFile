local g = vim.g
g.tex_flavor = "latex"
g.vimtex_quickfix_mode = 0
g.tex_conceal = "abdmg"

g.vimtex_compiler_method = "latexmk"
if vim.fn.has("win32") == 1 then
  g.vimtex_view_method = "SumatraPDF"
  g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
  g.vimtex_view_general_options_latexmk = "-reuse-instance"
elseif vim.fn.has("unix") == 1 then
  g.vimtex_view_method = "skim"
  g.vimtex_view_general_viewer = "/Applications/Skim.app/Contents/SharedSupport/displayline"
  g.vimtex_view_general_options = "-r @line @pdf @tex"

  --[[ g.vimtex_compiler_latexmk_engines = {
    _ = '-lualatex'
  } ]]
  g.vimtex_compiler_progname = 'nvr'

  vim.cmd [[
    function! UpdateSkim(status)
    if !a:status | return | endif

    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']

    if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
    endif

    if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
    endif
    endfunction
    let g:vimtex_compiler_latexmk = {'build_dir': '/Users/songlin/Documents/LatexOutput/', 'hooks': [function('UpdateSkim')] }
  ]]
end
