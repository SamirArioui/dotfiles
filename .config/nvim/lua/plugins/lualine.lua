local opts = function()
	local Util = require("lazyvim.util")
	local icons = require("lazyvim.config").icons
	return {
		options = {
			theme = "auto",
			globalstatus = true,
			disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },

			lualine_c = {
				Util.lualine.root_dir(),
				{
					"diagnostics",
					symbols = {
						error = icons.diagnostics.Error,
						warn = icons.diagnostics.Warn,
						info = icons.diagnostics.Info,
						hint = icons.diagnostics.Hint,
					},
				},
			},
			lualine_z = { "filetype" },
		},
		winbar = {
			lualine_a = {
				{
					"filename",
					symbols = {
						modified = icons.git.modified,
					},
					file_status = true,
					path = 4,
				},
			},
			lualine_z = {
				function()
					return " " .. os.date("%R")
				end,
			},
		},
	}
end

return {
	"nvim-lualine/lualine.nvim",
	opts = opts(),
}
