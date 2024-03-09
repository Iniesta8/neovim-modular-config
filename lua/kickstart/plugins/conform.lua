return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        python = { "ruff" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
    },
  }
}

-- vim: ts=2 sts=2 sw=2 et
