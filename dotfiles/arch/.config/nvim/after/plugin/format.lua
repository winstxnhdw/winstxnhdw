local formatters = require('format-on-save.formatters')

require('format-on-save').setup({
    experiments = { partial_update = 'diff' },
    formatter_by_ft = {
        lua = formatters.lsp,
        python = formatters.lsp,
        javascript = formatters.lsp,
        typescript = formatters.lsp,
        yaml = formatters.lsp,
        html = formatters.lsp,
        css = formatters.lsp,
        latex = formatters.lsp,
    }
})
