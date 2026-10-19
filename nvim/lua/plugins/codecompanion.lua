return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				http = {
					-- 1. Optional: Extend default Ollama properties (e.g. override default local URL or default model)
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							schema = {
								model = {
									default = "mistral:latest", -- Replace with your desired Ollama model name
								},
							},
						})
					end,
					mistral = function()
						return require("codecompanion.adapters").extend("mistral", {
							env = { api_key = "MISTRAL_API_KEY" },
						})
					end,
				},
			},
			interactions = {
				chat = {
					adapter = "ollama", -- 2. Set Ollama as your default chat adapter
					tools = {
						["editor"] = { opts = { user_approval = false } },
						["cmd_runner"] = { opts = { user_approval = false } },
						["inline"] = { opts = { user_approval = false } },
					},
				},
			},
		})
	end,
}
