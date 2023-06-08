vim.g.lazygit_floating_window_scaling_factor = 0.8
vim.g.lazygit_floating_window_border_chars = { "", "", "", "", "", "", "", "" }

vim.g.lazygit_use_custom_config_file_path = 1 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = "/home/tom/.config/lazygit/config.yml" -- custom config file path

vim.keymap.set("n", "<leader>g", function()
	require("lazygit").lazygit()
end, { desc = "Open Lazygit" })
