return {
  "scalameta/nvim-metals",
  dependencies = {
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
    },
    {
      "j-hui/fidget.nvim",
      opts = {},
    },
    -- {
    --   "mfussenegger/nvim-dap",
    --   config = function(self, opts)
    --     local dap = require("dap")
    --
    --     dap.configurations.scala = {
    --       {
    --         type = "scala",
    --         request = "launch",
    --         name = "RunOrTest",
    --         metals = {
    --           runType = "runOrTestFile",
    --         },
    --       },
    --       {
    --         type = "scala",
    --         request = "launch",
    --         name = "Test Target",
    --         metals = {
    --           runType = "testTarget",
    --         },
    --       },
    --     }
    --   end,
    -- },
  },
  ft = { "scala", "sbt", "java" },
  opts = function()
    local metals_config = require("metals").bare_config()

    metals_config.settings = {
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      showInferredType = true,
      showImplicitArguments = true,
      superMethodLensesEnabled = true,
      enableSemanticHighlighting = true,
      showImplicitConversionsAndClasses = true,
      scalafmtConfigPath = "/Users/fele/Dev/chatmeter/.scalafmt.conf",
      javaHome = "/usr/local/Cellar/openjdk@17/17.0.15/libexec/openjdk.jdk/Contents/Home",
    }

    metals_config.init_options.statusBarProvider = "on"

    metals_config.capabilities = vim.lsp.protocol.make_client_capabilities()

    -- metals_config.on_attach = function(client, bufnr)
    --   require("metals").setup_dap()
    -- end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
