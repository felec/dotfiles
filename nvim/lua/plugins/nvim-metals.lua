return {
  {
    "scalameta/nvim-metals",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local metals_config = require("metals").bare_config()
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          update_in_insert = false,
          float = { border = "rounded" },
          virtual_text = { source = "if_many", spacing = 4, prefix = "●" },
          severity_sort = true,
        }),
      }

      if pcall(require, "cmp_nvim_lsp") then
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
      end

      metals_config.capabilities = capabilities
      metals_config.handlers = handlers
      metals_config.init_options.statusBarProvider = "on"
      metals_config.settings = {
        showInferredType = true,
        showImplicitArguments = true,
        superMethodLensesEnabled = true,
        enableSemanticHighlighting = true,
        showImplicitConversionsAndClasses = true,
        serverProperties = { "-Xms1G" },
        serverVersion = "latest.snapshot ",
        scalafmtConfigPath = "/Users/fele/Dev/chatmeter/.scalafmt.conf",
        excludedPackages = {
          "akka.actor.typed.javadsl",
          "com.github.swagger.akka.javadsl",
        },
      }

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
