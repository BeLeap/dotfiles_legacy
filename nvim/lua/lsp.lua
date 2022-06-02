require('nvim-lsp-installer').setup {}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
end

local lspconfig = require('lspconfig')

-- Automatically start coq
vim.g.coq_settings = { auto_start = 'shut-up' }

-- Enable some language servers with the additional completion capabilities offered by coq_nvim
local servers = {
    'clangd', 'rust_analyzer', 'pyright', 'hls', 'diagnosticls', 'dockerls',
    'yamlls', 'svelte', 'gopls', 'kotlin_language_server'
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
    on_attach = on_attach,
  }))
end

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {debounce_text_changes = 150},
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json")
}
lspconfig.denols.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {debounce_text_changes = 150},
    root_dir = lspconfig.util.root_pattern("deno.json")
}

lspconfig.efm.setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {{formatCommand = "lua-format -i", formatStdin = true}},
            python = {
                {lintCommand = "yapf --quiet", lintStdin = true}, {
                    lintCommand = "pylint --output-format text --score no --msg-template {path}:{line}:{column}:{C}:{msg} ${INPUT}",
                    lintStdin = false,
                    lintFormats = {'%f:%l:%c:%t:%m'}
                }
            },
            typescript = {
                {
                    lintCommand = "eslint --no-color --stdin",
                    lintStdin = true,
                    lintFormats = {
                        '<text>(%l,%c): %trror %m', '<text>(%l,%c): %tarning %m'
                    },
                    rootMarkers = {
                        '.eslintrc', '.eslintrc.cjs', '.eslintrc.js',
                        '.eslintrc.json', '.eslintrc.yaml', '.eslintrc.yml',
                        'package.json'
                    }
                }
            },
            typescriptreact = {
                {
                    lintCommand = "eslint --no-color --stdin",
                    lintStdin = true,
                    lintFormats = {
                        '<text>(%l,%c): %trror %m', '<text>(%l,%c): %tarning %m'
                    },
                    rootMarkers = {
                        '.eslintrc', '.eslintrc.cjs', '.eslintrc.js',
                        '.eslintrc.json', '.eslintrc.yaml', '.eslintrc.yml',
                        'package.json'
                    }
                }
            }
        }
    },
    filetypes = {'lua', 'python', 'typescript', 'typescriptreact'}
}

