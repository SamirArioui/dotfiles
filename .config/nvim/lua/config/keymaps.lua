function nvim_feedkeys(keys)
	local feedable_keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
	vim.api.nvim_feedkeys(feedable_keys, "n", false)
end

if vim.g.vscode then
	local vscode = require("vscode")

	vim.keymap.set("n", "<leader>ff", function()
		vscode.action("workbench.action.quickOpen")
	end)

	vim.keymap.set("n", "<leader>fr", function()
		vscode.action("workbench.action.findInFiles")
	end)

	vim.keymap.set("n", "<leader>fs", function()
		vscode.action("workbench.action.openSettingsJson")
	end)

	vim.keymap.set("n", "<leader>fk", function()
		vscode.action("workbench.action.openGlobalKeybindingsFile")
	end)

	vim.keymap.set("n", "<leader>fp", function()
		vscode.action("projectManager.listProjects")
	end)

	vim.keymap.set("v", "K", function()
		vscode.action("editor.action.moveLinesUpAction")
	end)

	vim.keymap.set("v", "J", function()
		vscode.action("editor.action.moveLinesDownAction")
	end)

	vim.keymap.set("n", "<leader>et", function()
		vscode.action("workbench.action.toggleSidebarVisibility")
	end)

	vim.keymap.set("n", "<leader>ef", function()
		vscode.action("workbench.explorer.fileView.focus")
	end)

	vim.keymap.set("n", "<leader>ex", function()
		vscode.action("workbench.view.extensions")
	end)

	vim.keymap.set("n", "H", function()
		vscode.action("workbench.action.previousEditorInGroup")
	end)

	vim.keymap.set("n", "L", function()
		vscode.action("workbench.action.nextEditorInGroup")
	end)

	vim.keymap.set("n", "<leader>tt", function()
		vscode.action("workbench.action.togglePanel")
	end)

	vim.keymap.set("n", "<leader>bh", function()
		vscode.action("workbench.action.splitEditorDown")
	end)

	vim.keymap.set("n", "<leader>bv", function()
		vscode.action("workbench.action.splitEditorRight")
	end)

	vim.keymap.set("n", "<leader>bs", function()
		vscode.action("workbench.action.files.save")
	end)

	vim.keymap.set("n", "<leader>dn", function()
		vscode.action("editor.action.marker.nextInFiles")
	end)

	vim.keymap.set("n", "<leader>dp", function()
		vscode.action("editor.action.marker.previousInFiles")
	end)

	vim.keymap.set("n", "<leader>bd", function()
		vscode.action("workbench.action.files.save")
		vscode.action("workbench.action.closeActiveEditor")
	end)

	vim.keymap.set("n", "<C-u>", function()
		vim.cmd("normal 20k0")
		vscode.action("center-editor-window.center")
	end)

	vim.keymap.set("n", "<C-d>", function()
		vim.cmd("normal 20j0")
		vscode.action("center-editor-window.center")
	end)

	vim.keymap.set("n", "<C-f>", function()
		vim.cmd("normal 40j0")
		vscode.action("center-editor-window.center")
	end)

	vim.keymap.set("n", "<C-b>", function()
		vim.cmd("normal 40k0")
		vscode.action("center-editor-window.center")
	end)

	vim.keymap.set("n", "n", function()
		nvim_feedkeys("n")
		vscode.action("center-editor-window.center")
	end)

	vim.keymap.set("n", "N", function()
		nvim_feedkeys("N")
		vscode.action("center-editor-window.center")
	end)
else -- Windows
	vim.keymap.set("n", "<leader>wh", "<C-W>h", { desc = "Split window right", remap = true })
	vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split window below", remap = true })

	-- Save file
	vim.keymap.set({ "x", "n", "s" }, "<leader>bs", "<cmd>w<cr><esc>", { desc = "Save file", remap = true })

	-- improved word with operators
	vim.keymap.set("n", "J", "mzJ`z")

	-- Scrolling
	vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scolling Down" })
	vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scolling Up" })
	vim.keymap.set("n", "n", "nzzzv", { desc = "Next Matching" })
	vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous Matching" })

	-- Keep paste
	vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste Keep" })
end
