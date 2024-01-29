require('texlabconfig').setup()

require('lspconfig').texlab.setup({
    settings = {
        texlab = {
            build = {
                executable = 'tectonic',
                args = { '-X', 'compile', '%f', '--synctex', '--keep-logs', '--keep-intermediates' },
                onSave = true
            },
            chktex = {
                onEdit = true,
                onOpenAndSave = true
            },
            forwardSearch = {
                executable = 'okular',
                args = { '--unique', '%p#src:%l%f' }
            }
        }
    }
})
