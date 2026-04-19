return {
  "nvim-treesitter/nvim-treesitter",
  lazy = "false",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "bash",
      "c",
      "csv",
      "diff",
      "dockerfile",
      "editorconfig",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "go",
      "gomod",
      "gosum",
      "gotmpl",
      "helm",
      "html",
      "java",
      "javadoc",
      "javascript",
      "jq",
      "json",
      "json5",
      "kotlin",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "rust",
      "terraform",
      "tmux",
      "toml",
      "typescript",
      "vim",
      "vimdoc",
      "vrl",
      "yaml",
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

  end
}
