return {
    "ptdewey/pendulum-nvim",
    config = function()
        require("pendulum").setup({
            log_file = "~/.dotfiles/hmconfigs/neovim/nconfig/lua/axt4/plugins/pendulum-log.csv",
            time_zone = "America/New York"
        })
    end,
}
