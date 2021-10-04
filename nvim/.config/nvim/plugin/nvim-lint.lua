require('lint').linters_by_ft = {
  python = {'pylint','flake8'},
}

vim.api.nvim_exec([[
  augroup LintOnSave
  au!
  au BufWritePost <buffer> lua require('lint').try_lint()
  augroup END
]], false)
