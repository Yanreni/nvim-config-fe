-- ---------------  基础  --------------------
-- 语法高亮
vim.cmd('syntax on')
-- 文件类型加载插件缩进
vim.cmd('filetype plugin indent on')
-- 展示行号
vim.opt.number = true
-- 相对行号
vim.opt.relativenumber = true
-- 24Bit颜色
vim.opt.termguicolors = true
-- 缩进宽度对齐到 shiftwidth 的整数倍
vim.opt.shiftround = true
-- 交换文件写入磁盘的更新时间
vim.opt.updatetime = 100
-- 高亮光标行 试下Cmd + \ 😍
-- vim.opt.cursorline = true
-- 自动写入
vim.opt.autowrite = true
if (vim.fn.has('termguicolors') == 1) then
  vim.opt.termguicolors = true
end
-- tab
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
-- 允许使用鼠标(a: all)
vim.opt.mouse = 'ni'
-- 替换tab
vim.opt.expandtab = true

-- vim.g.loaded = 1
-- vim.g.loaded_netrwPlugin = 1
-- 配置代码片段
vim.g.vsnip_snippet_dir = '~/.config/nvim/.vsnip'

-- 插件
require("core.plugins")
-- 快捷键
require("core.keymaps")
-- 主题
require("core.theme")

require("configs.filetree").config()
require("configs.bufferline").config()
require("configs.treesitter").config()
require("configs.git").config()
require("configs.statusline").config()
require("configs.terminal").config()
require("configs.theme").config()
require("configs.which-key").config()

-- require("lsp-format").setup {}
-- require("lspconfig").gopls.setup { on_attach = require("lsp-format").on_attach }

-- 全局替换
require('spectre').setup()

require('hop').setup {}

vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:⋅"

require("indent_blankline").setup {
  filetype_exclude = { "dashboard" },
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
}
require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
}
require('hlslens').setup({
    calm_down = true,
    -- nearest_only = true,
    -- nearest_float_when = 'always'
})
require'colorizer'.setup()
-- require("noice").setup()

-- local home = os.getenv('HOME')
local db = require('dashboard')

require("null-ls").setup({
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

      -- format on save
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})

require("prettier").setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    "vue"
  },
})
-- require('nvm-ts-autotag').setup()
