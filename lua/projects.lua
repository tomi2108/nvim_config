local split = function(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	local i = 0
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, i, str)
		i = i + 1
	end
	return t
end

local join = function(t, sep)
	local str = ""
	for _, v in pairs(t) do
		str = str .. sep .. v
	end
	return str
end

local getpwd = function(cwd)
	local path = split(cwd, "/")
	table.remove(path, table.maxn(path))
	return join(path, "/")
end

local readdirdirs = function(path)
	local t = {}
	for dir in io.popen([[ls -pA ]] .. path .. [[ | grep /]]):lines() do
		table.insert(t, dir)
	end
	return t
end

local readdirspretty = function(path)
	local t = {}
	for dir in io.popen([[ls -l -G -A -g ]] .. path):lines() do
		table.insert(t, dir)
	end
	return t
end

local mergetables = function(t1, t2)
	for k, v in ipairs(t2) do
		table.insert(t1, v)
	end
	return t1
end

local cwd = vim.fn.getcwd()
local pwd = getpwd(cwd)
local ppwd = getpwd(pwd)

local folders = {}
local ppwdfolders = readdirdirs(ppwd)

for _, dir in pairs(ppwdfolders) do
	local t = readdirdirs(ppwd .. "/" .. dir)
	for k, subdir in pairs(t) do
		t[k] = ppwd .. "/" .. dir .. subdir
	end
	folders = mergetables(folders, t)
end

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")

local projects = function(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "projects",
			previewer = previewers.new_buffer_previewer({
				define_preview = function(self, entry, status)
					local t = readdirspretty(entry.value)
					vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, t)
				end,
			}),
			finder = finders.new_table({
				results = folders,
				entry_maker = function(entry)
					return {
						value = entry,
						ordinal = entry,
						display = function(e)
							local path = split(e.value, "/")
							return path[table.maxn(path)]
						end,
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),

			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					vim.cmd(":cd " .. selection.value)
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<leader>q", true, true, true), "m", false)
				end)
				return true
			end,
		})
		:find()
end

vim.keymap.set("n", "<leader>pp", projects, {})
