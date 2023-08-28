vim.filetype.add({
	pattern = {
		[".*yaml"] = {
			priority = 1,
			function(path)
				if string.find(path, "templates") then
					local parent = vim.split(path, "templates")[1]
					local files_raw = vim.fn.system("ls " .. parent)
					local files = vim.split(files_raw, "\n")

					local is_helm = false
					for _, v in ipairs(files) do
						if v == "Chart.yaml" then
							is_helm = true
						end
					end

					if is_helm then
						return "helm"
					end
				elseif string.find(path, "playbook") then
					return "yaml.ansible"
				end
			end,
		},
		[".*%.tpl"] = {
			"yaml.tpl",
		},
		[".*mdx"] = {
			"markdown",
		},
	},
})
