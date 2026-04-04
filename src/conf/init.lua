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

-- Diagnostics
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.jump({ count = 1 }) end)
vim.keymap.set( 'n', '<leader>dp', function() vim.diagnostic.jump({ count = -1 }) end)
vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = { prefix = "*" },
})

-- Plugins
vim.pack.add({
    "https://github.com/luiarthur/red.vim",
    "https://github.com/luiarthur/tmux.vim",
		"https://github.com/neovim/nvim-lspconfig",
})

-- Tab completion
vim.keymap.set("i", "<Tab>", "<C-x><C-o>", { noremap = true })

-- Colorscheme
vim.cmd.colorscheme("noir")

-- Options
vim.opt.showmatch = true -- show matching parenthesis, etc
vim.opt.updatetime = 500 -- milliseconds
vim.opt.guicursor = "a:blinkon0"
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 0
vim.opt.autoread = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.pumheight = 8      -- max number of items shown
vim.opt.pummaxwidth = 50   -- max width of the menu
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.termguicolors = false
vim.opt.ruler = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    vim.cmd('normal! g`"')
  end,
})

-- Enable lsp
vim.lsp.enable("ruff")
vim.lsp.enable("ty")
vim.lsp.enable("just")

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

-- Copy/paste between sessions
vim.keymap.set({ "n" }, "<C-y>", '"+yy')
vim.keymap.set({ "v" }, "<C-y>", '"+y')
vim.keymap.set({ "n" }, "<C-d>", '"+dd')
vim.keymap.set({ "v" }, "<C-d>", '"+d')
vim.keymap.set({ "n", "v" }, "<C-p>", '"+p')

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  group = vim.api.nvim_create_augroup("markdownSpell", { clear = true }),
  command = "setlocal spell spelllang=en_us",
})
