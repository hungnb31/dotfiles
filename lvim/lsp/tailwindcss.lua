local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

-- Check if tailwindls server already defined.
if not configs.tailwindcss then configs['tailwindcss'] = {default_config = {}} end

lspconfig.tailwindcss.setup {
    cmd = {
        "node", DATA_PATH .. "/lspinstall/tailwindcss/tailwindcss-intellisense/extension/dist/server/tailwindServer.js",
        "--stdio"
    },
    filetypes = {
      -- html
      'aspnetcorerazor',
      'astro',
      'astro-markdown',
      'blade',
      'django-html',
      'edge',
      'eelixir', -- vim ft
      'ejs',
      'erb',
      'eruby', -- vim ft
      'gohtml',
      'haml',
      'handlebars',
      'hbs',
      'html',
      -- 'HTML (Eex)',
      -- 'HTML (EEx)',
      'html-eex',
      'jade',
      'leaf',
      'liquid',
      'markdown',
      'mdx',
      'mustache',
      'njk',
      'nunjucks',
      'php',
      'razor',
      'slim',
      'twig',
      -- css
      'css',
      'less',
      'postcss',
      'sass',
      'scss',
      'stylus',
      'sugarss',
      -- js
      'javascript',
      'javascriptreact',
      'reason',
      'rescript',
      'typescript',
      'typescriptreact',
      -- mixed
      'vue',
      'svelte',
    },
    root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    handlers = {
        ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
            -- tailwindcss lang server waits for this repsonse before providing hover
            vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", {_id = params._id})
        end
    },
    on_attach = require'lsp'.common_on_attach
}
