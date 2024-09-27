-- https://github.com/navarasu/onedark.nvim/tree/master
return {
  {
    "navarasu/onedark.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("onedark").setup({
          style = "darker",
        })
        require("onedark").load()
      end,
    },
  },
}
