-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'eandrju/cellular-automaton.nvim',
    {
      'ThePrimeagen/harpoon',
      branch = 'harpoon2',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local harpoon = require 'harpoon'
        -- REQUIRED
        harpoon:setup()
        -- REQUIRED
        vim.keymap.set('n', '<leader>m', function()
          harpoon:list():add()
        end, { desc = 'Harpoon Mark file' })
        vim.keymap.set('n', '<C-e>', function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'Open Harpoon Quick Menu' })
        vim.keymap.set('n', '<C-h>', function()
          harpoon:list():select(1)
        end, { desc = 'Go to Harpoon File 1' })
        vim.keymap.set('n', '<C-j>', function()
          harpoon:list():select(2)
        end, { desc = 'Go to Harpoon File 2' })
        vim.keymap.set('n', '<C-k>', function()
          harpoon:list():select(3)
        end, { desc = 'Go to Harpoon File 3' })
        vim.keymap.set('n', '<C-l>', function()
          harpoon:list():select(4)
        end, { desc = 'Go to Harpoon File 4' })
        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set('n', '<C-S-P>', function()
          harpoon:list():prev()
        end)
        vim.keymap.set('n', '<C-S-N>', function()
          harpoon:list():next()
        end)
      end,
    },
    {
      'mbbill/undotree',
      config = function()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
      end,
    },
    {
      'tpope/vim-fugitive',
      config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git Status' })
      end,
    },
    {
      'stevearc/oil.nvim',
      --@module 'oil'
      --@type oil.SetupOpts
      opts = {
        default_file_explorer = false,
        columns = {
          'icon',
          'sieze',
          'mtime',
        },
        use_default_keymaps = false,
        keymaps = {
          ['<C-c>'] = { 'actions.close', mode = 'n' },
          ['-'] = { 'actions.parent', mode = 'n' },
          ['_'] = { 'actions.open_cwd', mode = 'n' },
          ['<CR>'] = 'actions.select',
        },
        view_options = {
          show_hidden = true,
        },
      },
      dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    },
  },
}
