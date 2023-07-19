return function()
	local buftype = vim.bo.buftype
	if buftype == "terminal" then
		vim.cmd("startinsert")
	end
end
