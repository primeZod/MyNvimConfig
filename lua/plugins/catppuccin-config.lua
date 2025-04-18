return {
    	"catppuccin/nvim", as = "catppuccin",
	config = function()
		require("catppuccin").setup({
	    		integrations = {
	    		    cmp = true,
	    		    gitsigns = true,
	    		    nvimtree = true,
	    		    telescope = true,
	    		    notify = false,
	    		    mini = false,
	    		}
		})
	end
}
