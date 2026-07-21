-- Colorscheme: Catppuccin (Mocha)
require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = false,
  term_colors = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    neotree = true,
    noice = true,
    notify = true,
    which_key = true,
    mini = { enabled = true },
    telescope = { enabled = true },
    treesitter = true,
    treesitter_context = true,
    trouble = true,
    dressing = true,
    flash = true,
    lualine = true,
    bufferline = true,
  },
  custom_highlights = function(colors)
    return {
      -- Float titles and dialog input prompts (fix black-on-dark text in Neo-tree/Dressing prompts)
      FloatTitle = { fg = colors.lavender, bg = colors.surface0, bold = true },
      NormalFloat = { fg = colors.text, bg = colors.mantle },
      FloatBorder = { fg = colors.blue, bg = colors.mantle },
      NeoTreeFloatTitle = { fg = colors.lavender, bg = colors.surface0, bold = true },
      NeoTreeFloatBorder = { fg = colors.blue, bg = colors.mantle },
      NeoTreeTitleBar = { fg = colors.lavender, bg = colors.surface0, bold = true },
      NeoTreeMessage = { fg = colors.text, bold = true },
      NeoTreeDimText = { fg = colors.subtext0 },
      NeoTreeFadeText1 = { fg = colors.overlay2 },
      NeoTreeFadeText2 = { fg = colors.overlay1 },
      DressingInputText = { fg = colors.text },
      -- Window split borders
      WinSeparator = { fg = colors.blue, bold = true },
    }
  end,
})

vim.cmd.colorscheme("catppuccin")
