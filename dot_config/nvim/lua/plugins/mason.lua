return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "typescript-language-server",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
      },
    },
  },
}
