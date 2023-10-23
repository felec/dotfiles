return {
  {
    "scalameta/nvim-metals",
    dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    config = function()
      local metals_config = require("metals").bare_config()
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      if pcall(require, "cmp_nvim_lsp") then
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
      end

      metals_config.capabilities = capabilities
      metals_config.init_options.statusBarProvider = "on"
      metals_config.settings = {
        showInferredType = true,
        showImplicitArguments = true,
        superMethodLensesEnabled = true,
        enableSemanticHighlighting = true,
        showImplicitConversionsAndClasses = true,
        serverProperties = { "-Xmx4G", "-Xms1G" },
        sbtScript = "/usr/local/bin/sbt",
        javaHome = "/usr/local/Cellar/openjdk@17/17.0.8/libexec/openjdk.jdk/Contents/Home",
        scalafmtConfigPath = "/Users/fele/Dev/ChatmeterRepo/chatmeter/.scalafmt.conf",
        excludedPackages = {
          "akka.actor.typed.javadsl",
          "com.github.swagger.akka.javadsl",
        },
      }

      require("dap").configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }

      metals_config.on_attach = function(_, _)
        require("metals").setup_dap()
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
}
