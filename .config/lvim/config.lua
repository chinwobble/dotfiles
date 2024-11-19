-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
-- lvim.builtin.telescope.defaults.float.winblend = 30
lvim.builtin.telescope.defaults.layout_config = { 
  height = 0.95,
  width = 0.95
}
vim.cmd [[
  autocmd FileType ocaml setlocal makeprg=dune\ build
]]
-- lvim.builtin.telescope.defaults.selection_caret
-- vim.api.nvim_create_autocmd("WinEnter", {
--   pattern = "*",
--   callback = function()
--     local buftype = vim.bo.buftype
--     local filetype = vim.bo.filetype
--     local layout = vim.fn.winlayout()
--     local data = {
--       buftype = vim.bo.buftype,
--       filetype = vim.bo.filetype,
--       fileformat = vim.bo.fileformat,
--       syntax = vim.bo.syntax,
--     }
--     print(vim.inspect(data))
--     if filetype == 'TelescopePrompt' then
--       return
--     end
--     if buftype == 'prompt' then
--       return
--     end
--     if buftype == 'quickfix' then
--       -- Move quickfix to bottom
--       vim.cmd('wincmd J')
--       -- Calculate and set height
--       local height = (vim.o.lines - #layout[1]) / 2
--       vim.cmd('resize ' .. height)
--     elseif filetype ~= 'VimspectorPrompt' then
--       -- Maximize current window
--       vim.cmd('wincmd _')
--     else
--       -- Equal sizing for all windows
--       vim.cmd('wincmd =')
--     end
--   end
-- })


vim.o.winminheight = 0

lvim.plugins = {
  { "tpope/vim-vinegar" },
  { "tpope/vim-surround" },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle outline"}
    },
    opts = {
      outline_window = {
        width = 40,
      }
    }
  },
}
