return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<C-t>", ":tabnew<CR>", {})
    vim.keymap.set("n", "<C-Right>", ":tabnext<CR>", {})
    vim.keymap.set("n", "<C-Left>",  ":tabprevious<CR>", {})
    vim.keymap.set("n", "<C-w>", ":tabclose<CR>", {})
  end,
}
