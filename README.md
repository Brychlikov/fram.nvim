# fram.nvim

Basic fram language support for Neovim. Includes a `filetype`, LSP config, and a tree-sitter grammar.

## Requirements

- Neovim 0.11 or newer
- `lazy.nvim` or another plugin manager
- (optional) `nvim-treesitter` with the `highlight` module enabled it you want to use syntax highlighting


## Installation

Add the following to your plugin spec:

```
{
  'Brychlikov/fram.nvim',
  name = 'vimplugin-fram.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('fram').setup()
    vim.lsp.enable('framls')
  end,
},
```
