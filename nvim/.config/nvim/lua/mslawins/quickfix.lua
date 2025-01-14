local function Quickfix()
	-- The command you want to run (hardcoded)
	local cmd = "yarn nx run main:typecheck-quickfix"

	-- Run the command and capture its output
	local handle = io.popen(cmd)
	if not handle then
		vim.api.nvim_err_writeln("Failed to run command: " .. cmd)
		return
	end
	local result = handle:read("*a")
	handle:close()

	-- Prepare to filter and format the output
	local formatted_output = {}
	for line in result:gmatch("[^\r\n]+") do
		-- Check if the line contains an error using a regex
		if line:match("^.+%(%d+,%d+%): error TS%d+:") then
			-- Transform the line from (line,column) format to :line:column:
			local formatted_line = line:gsub("%((%d+),(%d+)%)", ":%1:%2:")
			table.insert(formatted_output, formatted_line)
		end
	end

	-- Check if there are any errors to show
	if #formatted_output == 0 then
		vim.api.nvim_out_write("No errors found.\n")
		return
	end

	-- Write the formatted output to the Quickfix list
	vim.fn.setqflist({}, "r", {
		title = "Errors from vue-tsc",
		lines = formatted_output,
	})

	-- Open the Quickfix list
	vim.cmd("copen")
end

-- Map the function to a command for easy execution
vim.api.nvim_create_user_command("VueTscQuickfix", Quickfix, {})
