vim.filetype.add({
	pattern = {
		[".*yaml"] = {
			priority = 1,
			function(path)
				if string.find(path, "templates") then
					return "helm"
				end
			end,
		},
	},
})