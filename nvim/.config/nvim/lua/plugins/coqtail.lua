return {
  "whonore/Coqtail",
  ft = "coq", -- lazy-load Coqtail on Coq files
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "coq",
      callback = function()
        local opts = { buffer = true, silent = true }
        vim.keymap.set({ "i", "n" }, "<S-Down>", "<Plug>RocqNext", opts)
        vim.keymap.set({ "i", "n" }, "<S-Left>", "<Plug>RocqToLine", opts)
        vim.keymap.set({ "i", "n" }, "<S-Up>", "<Plug>RocqUndo", opts)
      end,
    })
  end,
}
