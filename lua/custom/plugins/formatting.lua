return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        python = { "black" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  }
}

-- vim: ts=2 sts=2 sw=2 et
