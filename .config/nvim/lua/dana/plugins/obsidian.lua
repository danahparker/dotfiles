vim.o.conceallevel = 0
return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = false,
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
    ui = {
      enable = false,
    }
  },
}
