vim.filetype.add({
	pattern = {
		[".*yaml"] = {
			priority = 1,
			function(path)
				if string.find(path, "templates") then
					return "yaml.helm"
				elseif string.find(path, "playbook") then
					return "yaml.ansible"
				end
			end,
		},
		[".*%.tpl"] = {
			"yaml.tpl",
		},
	},
})
