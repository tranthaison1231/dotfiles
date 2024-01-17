return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			css = {
				RRGGBBAA = true,
				hsl_fn = true,
			},
		})
	end,
}
