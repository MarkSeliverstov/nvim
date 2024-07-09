math.randomseed(os.time())

local function get_random_message(array)
	local randomIndex = math.random(#array)
	return array[randomIndex]
end

return {
	"letieu/btw.nvim",
	config = function()
		require("btw").setup({
			text = get_random_message({
				"Oh hi Mark!",
				"I used vim (BTW)",
				"VSCode the best",
			}),
		})
	end,
}
