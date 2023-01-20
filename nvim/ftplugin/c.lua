function Compile()
	local file_name = vim.fn.expand("%")
	os.execute(string.format("gcc -g %s -o debug", file_name))
end
