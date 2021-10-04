require('telescope').setup { 
  pickers = {
      find_files = {
        find_command = { "fd", "--type", "f", "--type", "f", "--hidden" },
      },
    },
}

require('telescope').load_extension('fzf')
