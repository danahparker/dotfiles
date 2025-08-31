vim.o.conceallevel = 1
return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = "*",
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      template = "templates/daily.md"
    },
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    workspaces = {
      {
        name = 'personal',
        path = '~/md/Personal',
      },
      {
        name = 'amazon',
        path = '~/md/Amazon',
      },
    },
  },
}
