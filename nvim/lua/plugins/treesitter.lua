return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufEnter" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"HiPhish/nvim-ts-rainbow2",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "org" },
				},
				incremental_selection = { enable = true },
				indent = { enable = true },
				rainbow = { enable = true },
				textobjects = {
					lsp_interop = {
						enable = true,
						border = "none",
						floating_preview_opts = {},
						peek_definition_code = {
							["<leader>df"] = "@function.outer",
							["<leader>dF"] = "@class.outer",
						},
					},
					select = {
						enable = true,
						lookahead = true,

						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["as"] = "@scope",
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"ziontee113/syntax-tree-surfer",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{
				"gj",
				function()
					require("syntax-tree-surfer").targeted_jump({
						"function",
						"arrow_function",
						"function_definition",
						"if_statement",
						"else_clause",
						"else_statement",
						"elseif_statement",
						"for_statement",
						"while_statement",
						"switch_statement",
					})
				end,
				noremap = true,
				silent = true,
			},
		},
		config = function()
			require("syntax-tree-surfer").setup({
				highlight_group = "STS_highlight",
				disable_no_instance_found_report = false,
				default_desired_types = {
					"function",
					"arrow_function",
					"function_definition",
					"if_statement",
					"else_clause",
					"else_statement",
					"elseif_statement",
					"for_statement",
					"while_statement",
					"switch_statement",
				},
				left_hand_side = "fdsawervcxqtzb",
				right_hand_side = "jkl;oiu.,mpy/n",
				icon_dictionary = {
					["if_statement"] = "",
					["else_clause"] = "",
					["else_statement"] = "",
					["elseif_statement"] = "",
					["for_statement"] = "ﭜ",
					["while_statement"] = "ﯩ",
					["switch_statement"] = "ﳟ",
					["function"] = "",
					["function_definition"] = "",
					["variable_declaration"] = "",
				},
			})
		end,
	},
}