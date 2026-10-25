require("core")
pcall(require, "nix") -- dont error on non-exist
require("packages").setup({
	require("ui"),
	require("selection"),
	require("editor"),
	require("development"),
	require("git"),
})
require("terminal").setup()
require("keybinds").setup()
