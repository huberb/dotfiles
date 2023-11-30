return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- theme
    use 'ellisonleao/gruvbox.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- file browser
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons',
      },
    }

    -- debugger
    use 'puremourning/vimspector'

end)
