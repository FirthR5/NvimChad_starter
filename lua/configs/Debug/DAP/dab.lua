local debug = {
  -- luego
  -- https://mcalvaro.medium.com/configuracion-de-nvim-dap-en-neovim-guia-paso-a-paso-para-principiantes-4564429022cb
  -- 2. https://mcalvaro.medium.com/configuracion-de-nvim-dap-en-neovim-javascript-typescript-debugging-c62e286b4c64
  -- 3, https://mcalvaro.medium.com/configuracion-de-nvim-dap-en-neovim-depuracion-de-php-con-xdebug-e8aa059e3ec6
  -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#dotnet
  -- {
  --       "mfussenegger/nvim-dap",
  --       lazy = true,
  --      dependencies = {
  --         "jay-babu/mason-nvim-dap.nvim",
  --         config = function()
  --             require("mason-nvim-dap").setup({ ensure_installed = { "firefox", "node2" } })
  --         end,
  --         "theHamsta/nvim-dap-virtual-text",
  --         "rcarriga/nvim-dap-ui",
  --         "anuvyklack/hydra.nvim",
  --         "nvim-telescope/telescope-dap.nvim",
  --         "rcarriga/cmp-dap",
  --      },
  --      keys = {
  --         { "<leader>du", desc = "Open Debug menu" },
  --      },
  --      cmd = {
  --       "DapContinue",
  --       "DapLoadLaunchJSON",
  --       "DapRestartFrame",
  --       "DapSetLogLevel",
  --       "DapShowLog",
  --       "DapStepInto",
  --       "DapStepOut",
  --       "DapStepOver",
  --       "DapTerminate",
  --       "DapToggleBreakpoint",
  --       "DapToggleRepl",
  --      },
  --     config = function()
  --
  --       requie("lua.dap.init")
  --       local ok_telescope, telescope = pcall(require, "telescope")
  --       if ok_telescope then
  --        telescope.load_extension("dap")
  --     end
  --
  --     local ok_cm, cmp = pcall(require, "cmp")
  --     if ok_cmp then
  --      cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
  --       sources = cmp.config.sources({
  --        { name = "dap" },
  --       }, {
  --        { name = "buffer" },
  --       }),
  --      })
  --     end
  --    end,
  -- }
}