-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<S-h>"] = ":bprevious<CR>"
lvim.keys.normal_mode["<S-l>"] = ":bnext<CR>"

lvim.transparent_window = true

vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
lvim.colorscheme = "tokyonight"

vim.opt.wrap = true

lvim.plugins = {
  -- {"nvim-neotest/nvim-nio"},
  -- {"j-hui/fidget.nvim"},
  -- {"manoelcampos/xml2lua"},
  -- {"rest-nvim/rest.nvim"},
  {"nicwest/vim-http"},
  {
    "oysandvik94/curl.nvim",
    cmd = { "CurlOpen" },
    dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        -- this config assumes you have OPENAI_API_KEY environment variable set
        openai_params = {
          -- NOTE: model can be a function returning the model name
          -- this is useful if you want to change the model on the fly
          -- using commands
          -- Example:
          -- model = function()
          --     if some_condition() then
          --         return "gpt-4-1106-preview"
          --     else
          --         return "gpt-3.5-turbo"
          --     end
          -- end,
          model = "gpt-4-1106-preview",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 4095,
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
        }
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
        "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim"
    }
  }
}
