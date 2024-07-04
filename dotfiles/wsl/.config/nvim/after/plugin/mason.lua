require('mason').setup()

local lsp = require('mason-lspconfig')

lsp.setup()
lsp.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {}
    end
}
