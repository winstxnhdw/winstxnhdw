require('texlabconfig').setup()

require('lspconfig').texlab.setup({
    settings = {
        texlab = {
            bibtexFormatter = 'latexindent',
            build = {
                executable = 'tectonic',
                args = { '-X', 'compile', '%f', '--synctex', '--keep-logs', '--keep-intermediates' },
                onSave = true,
                forwardSearchAfter = true,
            },
            chktex = {
                onEdit = true,
                onOpenAndSave = true
            },
            forwardSearch = {
                executable = 'okular',
                args = { '--noraise', '--unique', '%p#src:%l%f' }
            }
        }
    }
})
