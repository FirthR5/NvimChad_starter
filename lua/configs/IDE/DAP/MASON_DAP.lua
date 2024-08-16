local SETTINGS = {
  -- A list of adapters to install if they're not already installed.
  -- This setting has no relation with the `automatic_installation` setting.
  -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
  ensure_installed = { "python", "stylua", "jq", "firefox" },
  -- "cppdbg",  "firefox", "php", "coreclr", "js", "bash", "javadbg", "javatest", "mock",
  -- "kotlin", "dart"--, "haskell"
  automatic_installation = true,
  -- Can either be:
  --   - false: Daps are not automatically installed.
  --   - true: All adapters set up via dap are automatically installed.
  --   - { exclude: string[] }: All adapters set up via mason-nvim-dap, except the ones provided in the list, are automatically installed.
  --       Example: automatic_installation = { exclude = { "python", "delve" } }
}

function Config_MasonDAP()
  require("mason-nvim-dap").setup(SETTINGS)
  local dap = require "dap"
  -- ╭──────────────────────────────────────────────────────────╮
  -- │ Adapters                                                 │
  -- ╰──────────────────────────────────────────────────────────╯
  --
  -- ================== Python ==================
  local dap_python = require "dap-python"
  -- Configuración de dap-python
  dap_python.setup "~/.myenv/bin/python" -- Ruta al intérprete del entorno virtual
  -- dap_python.setup "/usr/bin/python3" -- Reemplaza con la ruta a tu intérprete de Python

  -- Configuración básica para depuración de archivos Python
  dap.configurations.python = {
    {
      name = "Launch file",
      type = "python",
      request = "launch",
      program = "${file}",
      pythonPath = function()
        -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#python
        return "/usr/bin/python3" -- Reemplaza con la ruta a tu intérprete de Python
      end,
    },
  }
  -- ============================================

  -- ================== Kotlin ==================
  -- -- local dap_python = require "dap-python"
  -- -- -- Configuración de dap-python
  -- -- dap_python.setup "~/.myenv/bin/python"
  -- dap.adapters.kotlin = {
  --   type = "executable",
  --   command = "kotlin-debug-adapter",
  --   -- command = "/path/to/kotlin-debug-adapter",
  --   options = { auto_continue_if_many_stopped = false },
  -- }
  --
  -- dap.configurations.kotlin = {
  --   {
  --     type = "kotlin",
  --     request = "launch",
  --     name = "This file",
  --     -- may differ, when in doubt, whatever your project structure may be,
  --     -- it has to correspond to the class file located at `build/classes/`
  --     -- and of course you have to build before you debug
  --     mainClass = function()
  --       local root = vim.fs.find("src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1] or ""
  --       local fname = vim.api.nvim_buf_get_name(0)
  --       -- src/main/kotlin/websearch/Main.kt -> websearch.MainKt
  --       return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
  --     end,
  --     projectRoot = "${workspaceFolder}",
  --     jsonLogFile = "",
  --     enableJsonLogging = false,
  --   },
  --   {
  --     -- Use this for unit tests
  --     -- First, run
  --     -- ./gradlew --info cleanTest test --debug-jvm
  --     -- then attach the debugger to it
  --     type = "kotlin",
  --     request = "attach",
  --     name = "Attach to debugging session",
  --     port = 5005,
  --     args = {},
  --     projectRoot = vim.fn.getcwd,
  --     hostName = "localhost",
  --     timeout = 2000,
  --   },
  -- }
  -- ============================================

  -- ================== DotNET ==================
  -- dap.adapters.coreclr = {
  --   type = "executable",
  --   command = "~/.local/share/nvim/mason/packages/netcoredbg/netcoredbg",
  --   arg = { "--interpreter=vscode" },
  --    -- dap.configuration.cs = {
  --   {
  --     type = "netcoredbg",
  --     name = "launch - netcoredbg",
  --     request = "${file}", -- Use the current file as the program
  --     cwd = vim.fn.getcwd(),
  --     stopAtEntry = false,
  --     console = "integratedTerminal",
  --     logging = {
  --       level = "verbose",
  --     },
  --   },
  -- }

  -- -- NOTE: See all available DAP adapters here: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
  -- dap.adapters.gdb = {
  --   type = "executable",
  --   command = "gdb",
  --   args = { "-i", "dap" },
  -- }
  --
  -- dap.adapters.coreclr = {
  --   type = "executable",
  --   command = "netcoredbg",
  --   args = { "--interpreter=vscode" },
  -- }
  --
  -- dap.configurations.c = {
  --   {
  --     name = "Launch",
  --     type = "gdb",
  --     request = "launch",
  --     program = function()
  --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  --     end,
  --     cwd = "${workspaceFolder}",
  --   },
  -- }
  -- -- source: https://github.com/mfussenegger/nvim-dap/wiki/Cookbook#making-debugging-net-easier
  -- vim.g.dotnet_build_project = function()
  --   local default_path = vim.fn.getcwd() .. "/"
  --   if vim.g["dotnet_last_proj_path"] ~= nil then
  --     default_path = vim.g["dotnet_last_proj_path"]
  --   end
  --   local path = vim.fn.input("Path to your *proj file", default_path, "file")
  --   vim.g["dotnet_last_proj_path"] = path
  --   local cmd = "dotnet build -c Debug " .. path .. " > /dev/null"
  --   print ""
  --   print("Cmd to execute: " .. cmd)
  --   local f = os.execute(cmd)
  --   if f == 0 then
  --     print "\nBuild: ✔️ "
  --   else
  --     print("\nBuild: ❌ (code: " .. f .. ")")
  --   end
  -- end
  --
  -- vim.g.dotnet_get_dll_path = function()
  --   local request = function()
  --     return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
  --   end
  --
  --   if vim.g["dotnet_last_dll_path"] == nil then
  --     vim.g["dotnet_last_dll_path"] = request()
  --   else
  --     if
  --       vim.fn.confirm("Do you want to change the path to dll?\n" .. vim.g["dotnet_last_dll_path"], "&yes\n&no", 2) == 1
  --     then
  --       vim.g["dotnet_last_dll_path"] = request()
  --     end
  --   end
  --
  --   return vim.g["dotnet_last_dll_path"]
  -- end
  --
  -- local configNET = {
  --   {
  --     type = "coreclr",
  --     name = "launch - netcoredbg",
  --     request = "launch",
  --     program = function()
  --       if vim.fn.confirm("Should I recompile first?", "&yes\n&no", 2) == 1 then
  --         vim.g.dotnet_build_project()
  --       end
  --       return vim.g.dotnet_get_dll_path()
  --     end,
  --   },
  -- }
  --
  -- dap.configurations.cs = configNET
  -- ============================================
end

return {
  "jay-babu/mason-nvim-dap.nvim",
  lazy = false,
  -- event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
    -- "fwcd/kotlin-debug-adapter",
    -- "Samsung/netcoredbg",
  },
  config = Config_MasonDAP,
}
-- https://github.com/Je12emy/dotfiles/blob/main/config/nvim/init.lua
