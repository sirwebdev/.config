return {
  -- Dashboard settings
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
██████╗ ███╗   ███╗ █████╗ ██████╗ ████████╗██╗███╗   ██╗███████╗██████╗ ███████╗██╗   ██╗
██╔══██╗████╗ ████║██╔══██╗██╔══██╗╚══██╔══╝██║████╗  ██║██╔════╝██╔══██╗██╔════╝██║   ██║
██████╔╝██╔████╔██║███████║██████╔╝   ██║   ██║██╔██╗ ██║███████╗██║  ██║█████╗  ██║   ██║
██╔═══╝ ██║╚██╔╝██║██╔══██║██╔══██╗   ██║   ██║██║╚██╗██║╚════██║██║  ██║██╔══╝  ╚██╗ ██╔╝
██║     ██║ ╚═╝ ██║██║  ██║██║  ██║   ██║   ██║██║ ╚████║███████║██████╔╝███████╗ ╚████╔╝ 
╚═╝     ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝╚══════╝╚═════╝ ╚══════╝  ╚═══╝  
                                                                                          
    ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                                     desc = " Procurar por arquivo",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " Novo Arquivo",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Arquivos Recentes",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Procurar por Texto",       icon = " ", key = "g" },
          { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Configurações",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restaurar Sessão Anterior", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Sair",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "Happy Hacking !!!",
            }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
