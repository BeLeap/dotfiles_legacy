-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', '<cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua require"telescope.builtin".lsp_implementations()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua require"telescope.builtin".lsp_type_definitions()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- local format = function()
  --   vim.lsp.buf.formatting()
  -- end
  -- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  --   callback = format,
  -- })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lspconfig = require('lspconfig')
local setup = function(lsp, options)
  lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities(options))
end

-- Automatically start coq
vim.g.coq_settings = { auto_start = 'shut-up' }

-- Enable some language servers with the additional completion capabilities offered by coq_nvim
local servers = {
    'clangd', 'rust_analyzer', 'pyright', 'hls', 'dockerls',
    'svelte', 'gopls', 'kotlin_language_server', 'jsonls',
    'metals', 'dartls', 'zls', 'vimls', 'marksman', 'terraformls',
    'graphql'
}
for _, lsp in ipairs(servers) do
  setup(lsp, {
    on_attach = on_attach,
  })
end

setup('sumneko_lua', {
  on_attach = on_attach,
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

setup('jdtls', {
  on_attach = on_attach,
  filetypes = { 'java', 'kotlin' },
})
setup('tsserver', {
  on_attach = on_attach,
  flags = {debounce_text_changes = 150},
  root_dir = lspconfig.util.root_pattern("package.json"),
})
setup('denols', {
  on_attach = on_attach,
  flags = {debounce_text_changes = 150},
  root_dir = lspconfig.util.root_pattern("deno.json"),
  single_file_support = false
})

require("lsp_lines").setup()
vim.diagnostic.config({ virtual_text = false })

require('mason').setup()
require('mason-lspconfig').setup({
  automatic_installation = true,
})
