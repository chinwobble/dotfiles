return {
	settings = {
    lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false},
    },
		-- Lua = {
		-- 	diagnostics = {
		-- 		globals = { "vim" },
		-- 	},
		-- 	workspace = {
		-- 		library = {
		-- 			[vim.fn.expand("$VIMRUNTIME/lua")] = true,
		-- 			[vim.fn.stdpath("config") .. "/lua"] = true,
		-- 		},
		-- 	},
		-- },
	},
}
