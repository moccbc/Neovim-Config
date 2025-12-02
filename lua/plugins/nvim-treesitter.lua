return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  opts = {
    ensure_installed = {
      'java',
      'c',
      'python',
      'typescript',
      'javascript',
      'lua',
      'bash',
      'diff',
      'html',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc'
    },
    sync_install = false,
    auto_installed = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' }
    },
    indent = { enable = true, disable = { 'ruby' } },
  }
}
