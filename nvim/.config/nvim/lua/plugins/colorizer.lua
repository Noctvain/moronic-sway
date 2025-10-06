return {
  "NvChad/nvim-colorizer.lua",
  event = "BufRead",
  config = function()
    require("colorizer").setup({
      filetypes = { "css", "javascript", "html", "lua", "conf", "ini" },
      user_default_options = {
        rgb_fn = true,
        names = false,
        tailwind = true,
      },
    })
    vim.keymap.set("n", "<leader><leader>", ":ColorizerToggle<CR>", {})
  end,
}
