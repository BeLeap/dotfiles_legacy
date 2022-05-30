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
    -- on_attach = my_custom_on_attach,
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

