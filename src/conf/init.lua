-- Arthur Lui's nvim config

-- Leader key
vim.g.mapleader = " "

-- Filetypes
vim.filetype.add({
  filename = {
    ["justfile"] = "just",
    [".justfile"] = "just",
    ["bashrc.local"] = "sh",
  },
  extension = {
    just = "just",
  },
})

-- Format
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Options for file explorer
vim.g.netrw_banner = 0       -- hide banner
vim.g.netrw_liststyle = 3    -- tree view
vim.g.netrw_browse_split = 4 -- reuse previous window
vim.g.netrw_winsize = 25     -- dir tree should be 25%
vim.keymap.set('n', '<leader>b', function() vim.cmd("Lexplore") end)

-- Diagnostics
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.jump({ count = 1 }) end)
vim.keymap.set('n', '<leader>dp', function() vim.diagnostic.jump({ count = -1 }) end)
vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = { prefix = "*" },
})

-- Plugins
vim.pack.add({
  "https://github.com/luiarthur/themes.nvim",
  "https://github.com/luiarthur/tmux.vim",
  "https://github.com/neovim/nvim-lspconfig",
  {
    src = "https://github.com/Saghen/blink.cmp",
    version = vim.version.range("1.*")
  },
})

-- Options
vim.opt.guicursor = "n-v-c:block-blinkon0,i:block-blinkwait200-blinkon200-blinkoff200"
vim.opt.showmatch = true  -- show matching parenthesis, etc
vim.opt.updatetime = 1000 -- milliseconds
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 0
vim.opt.autoread = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.pumheight = 8    -- max number of items shown
vim.opt.pummaxwidth = 50 -- max width of the menu
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.ruler = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.termguicolors = true

-- Colorscheme
vim.cmd.colorscheme("usa")

-- Return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    vim.cmd('normal! g`"')
  end,
})

-- Enable lsp
vim.lsp.enable("ruff")          -- requires ruff
vim.lsp.enable("ty")            --requires ty
vim.lsp.enable("just")          --requires just
vim.lsp.enable("gopls")         --requires gopls
vim.lsp.enable("rust_analyzer") --requires rust-analyzer
vim.lsp.enable("lua_ls")        --requires lua-language-server

-- Lua settings
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      format = {
        enable = true,
      },
      diagnostics = {
        globals = { "vim", },
      },
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Ruff settings
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format()
    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports" } },
      apply = true,
    })
  end,
})

-- Go settings
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Rust settings
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Just settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "just",
  callback = function(args)
    local bufnr = args.buf

    -- Set indent rules
    vim.bo[bufnr].shiftwidth = 4
    vim.bo[bufnr].tabstop = 4
    vim.bo[bufnr].expandtab = true

    -- Format on write
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end
    })
  end
})

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  group = vim.api.nvim_create_augroup("markdownSpell", { clear = true }),
  command = "setlocal spell spelllang=en_us",
})

-- Update packages with :PackUpdate
vim.api.nvim_create_user_command('PackUpdate', function()
  vim.pack.update(nil, { force = true })
end, {})

-- Copy/paste between sessions
vim.keymap.set({ "n" }, "<C-y>", '"+yy')
vim.keymap.set({ "v" }, "<C-y>", '"+y')
vim.keymap.set({ "n" }, "<C-d>", '"+dd')
vim.keymap.set({ "v" }, "<C-d>", '"+d')
vim.keymap.set({ "n", "v" }, "<C-p>", '"+p')

-- Completions
require("blink.cmp").setup({
  keymap = {
    preset = "super-tab", -- complete with tab
    ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    ["<C-u>"] = { "scroll_documentation_up", "fallback" },
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = "double",
      }
    },
    menu = {
      draw = {
        columns = {
          { "kind" },
          { "label", "label_description", gap = 1 },
        },
      },
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  signature = { enabled = true }
})
local caps = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("lua_ls", { capabilities = caps })
