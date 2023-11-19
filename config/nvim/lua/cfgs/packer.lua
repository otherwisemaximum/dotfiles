-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'rstacruz/vim-closer' -- generate matching bracket

    use { 'andymass/vim-matchup', event = 'VimEnter' }
    use {
        'w0rp/ale',
        ft = { 'sh', 'zsh', 'bash', 'c', 'javascript', 'typescript', 'html', 'markdown', 'rust', 'vim' },
        cmd = 'ALEEnable',
        config = 'vim.cmd[[ALEEnable]]'
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'dracula/vim', as = 'dracula' }

    use { 'itchyny/lightline.vim' }
    use { 'airblade/vim-gitgutter' }
    use { 'tpope/vim-fugitive' }
    use { 'chriskempson/base16-vim' }
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
            }
        end
    })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
        }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'machakann/vim-highlightedyank' }
    use { 'airblade/vim-rooter' }
    use { 'scrooloose/nerdtree' }
end)

