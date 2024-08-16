return {
  "DaikyXendo/nvim-material-icon",
  -- event = "VeryLazy",
  lazy = false,
  opts = {
    override_by_filename = {
      [".vuerc"] = {
        icon = " 󰡄",
        color = "#1cac78",
        name = "vuerc",
      },
      [".gitmessage.txt"] = {
        icon = "",
        color = "#f54d27",
        name = "config",
      },

      ["Packages"] = {

        icon = "",
        color = "#00ff00",
        name = "linox",
      },

      ["tsconfig.tsbuildinfo"] = {
        icon = "",
        color = "#cbcb41",
        name = "tsconfig.tsbuildinfo",
      },
    },
    override_by_extension = {
      ["gitconfig"] = {
        icon = "",
        color = "#f54d27",
        name = "config",
      },
      ["gitignore"] = {
        icon = "",
        color = "#f1502f",
        name = "GitIgnore",
      },
      ["Brew"] = {
        icon = "",
        color = "#e3c778",
        name = "Brew",
      },
      ["Flatpak"] = {
        icon = "󰏓",
        color = "#82d9dc",
        name = "Flatpak",
      },
      ["Pacman"] = {
        icon = "",
        color = "#2596be",
        name = "Pacman",
      },
      ["Snap"] = {
        icon = "",
        color = "#25be53",
        name = "Snap",
      },
      ["tsx"] = {
        icon = "",
        color = "#519aba",
        cterm_color = "26",
        name = "Tsx",
      },
      ["npmignore"] = {
        icon = "",
        color = "#c63c42",
        name = ".npmignore",
      },
    },
  },
}

--https://github.com/nvim-tree/nvim-web-devicons
-- https://github.com/DaikyXendo/nvim-material-icon
-- https://github.com/nvim-tree/nvim-web-devicons
-- DevIcons: (with Set_Icons)
-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/devicons.lua
