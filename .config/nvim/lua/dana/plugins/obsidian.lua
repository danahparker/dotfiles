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
    workspaces = {
      {
        name = 'personal',
        path = '~/obsidian/Personal',
      },
      {
        name = 'amazon',
        path = '~/obsidian/Amazon',
      },
    },
  },
}
