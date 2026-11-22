return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg         = "#d5d6db",
        dark_bg    = "#a0a1a4",
        darker_bg  = "#6b6b6e",
        lighter_bg = "#d9dadf",

        fg         = "#3760bf",
        dark_fg    = "#29488f",
        light_fg   = "#5578c9",
        bright_fg  = "#6988cf",
        muted      = "#9699a3",

        red        = "#f52a65",
        yellow     = "#8c6c3e",
        orange     = "#f74a7c",
        green      = "#587539",
        cyan       = "#007197",
        blue       = "#2e7de9",
        purple     = "#9854f1",
        brown      = "#942c4a",

        bright_red    = "#f52a65",
        bright_yellow = "#8c6c3e",
        bright_green  = "#587539",
        bright_cyan   = "#007197",
        bright_blue   = "#2e7de9",
        bright_purple = "#9854f1",

        accent               = "#2e7de9",
        cursor               = "#3760bf",
        foreground           = "#3760bf",
        background           = "#d5d6db",
        selection             = "#d9dadf",
        selection_foreground = "#3760bf",
        selection_background = "#d9dadf",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
