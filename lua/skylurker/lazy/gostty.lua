local ghostty_vim = "/Applications/Ghostty.app/Contents/Resources/vim/vimfiles"

return {
  {
    dir = ghostty_vim,
    name = "ghostty",
    lazy = false,
    enabled = vim.fn.isdirectory(ghostty_vim) == 1,
  },
}
