Neovim supports the Language Server Protocol (LSP), which means it **acts as a client to language servers** and includes a Lua framework vim.lsp for building enhanced LSP tools. LSP facilitates features like:

- go-to-definition
- find-references
- hover
- completion
- rename
- format
- refactor

**Neovim provides an interface for all of these features** and the language server client is **designed to be highly extensible to allow plugins to integrate language server features which are not yet present in Neovim core** such as:
- [**auto**-completion](https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion) (as opposed to manual completion with omnifunc)
- [snippet integration](https://github.com/neovim/nvim-lspconfig/wiki/Snippets).

These features are not implemented in this repo, but in Neovim core. See :help lsp for more details.
