return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {}, -- Clear default ignore patterns
      hidden = true, -- Show hidden files
    },
    pickers = {
      find_files = {
        hidden = true, -- Show hidden files in find_files
        no_ignore = true, -- Show files from .gitignore
      },
    },
  },
}
