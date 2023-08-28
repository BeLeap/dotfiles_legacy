local is_helm = function(path)
	local is_helm = false

	if string.find(path, "templates") then
		local parent = vim.split(path, "templates")[1]
		local files_raw = vim.fn.system("ls " .. parent)
		local files = vim.split(files_raw, "\n")

		for _, v in ipairs(files) do
			if v == "Chart.yaml" then
				is_helm = true
			end
		end
	end

	return is_helm
end

vim.filetype.add({
	pattern = {
		[".*yaml"] = {
			priority = 1,
			function(path)
				if is_helm(path) then
					return "helm"
				elseif string.find(path, "playbook") then
					return "yaml.ansible"
				end
			end,
		},
		[".*%.tpl"] = {
			function(path)
				if is_helm(path) then
					return "helm"
				end
			end,
		},
		[".*mdx"] = {
			"markdown",
		},
	},
})
