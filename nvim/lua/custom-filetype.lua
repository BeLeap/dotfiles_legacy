vim.filetype.add({
	pattern = {
		[".*yaml"] = {
			priority = 1,
			function(path)
				if string.find(path, "templates") then
					return "yaml.helm"
				end
			end,
		},
		[".*%.tpl"] = {
			"yaml.tpl",
		},
	},
})
