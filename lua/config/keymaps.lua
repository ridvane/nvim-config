local keymap = vim.keymap

-- Detect OS
local is_mac = vim.loop.os_uname().sysname == "Darwin"

-- Define the command key for macOS or control for others
local cmd = is_mac and "<D-" or "<C-"  -- <D- is CMD key in macOS
local alt = is_mac and "<A-" or "<A-"  -- Alt/Option key
local ctrl = "<C-"  -- Control key for both
local shift = "<S-"

-- IntelliJ-like keymaps
-- Navigation
if is_mac then
  -- macOS specific keymaps
  keymap.set({ "n", "i" }, cmd.."b>", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })
  keymap.set({ "n", "i" }, cmd.."S-n>", "<cmd>enew<CR>", { desc = "New file" })
  keymap.set({ "n", "i" }, cmd.."S-f>", "<cmd>Telescope live_grep<CR>", { desc = "Find in files" })
  keymap.set({ "n", "i" }, cmd.."f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in current file" })
  keymap.set({ "n", "i" }, cmd.."o>", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Go to symbol" })
  keymap.set({ "n", "i" }, cmd.."S-o>", "<cmd>Telescope workspace_symbols<CR>", { desc = "Go to symbol in project" })
  keymap.set({ "n", "i" }, cmd.."e>", "<cmd>Telescope find_files<CR>", { desc = "Go to file" })
  keymap.set({ "n", "i" }, cmd.."l>", ":", { desc = "Go to line" })
  
  -- macOS specific editor actions
  keymap.set({ "n", "i" }, cmd.."s>", "<cmd>w<CR>", { desc = "Save" })
  keymap.set({ "n", "v" }, cmd.."c>", "y", { desc = "Copy" })
  keymap.set({ "n", "v" }, cmd.."v>", "p", { desc = "Paste" })
  keymap.set({ "n", "v" }, cmd.."x>", "d", { desc = "Cut" })
  keymap.set({ "n", "i" }, cmd.."z>", "u", { desc = "Undo" })
  keymap.set({ "n", "i" }, cmd.."S-z>", "<C-r>", { desc = "Redo" })
  keymap.set({ "n", "i" }, cmd.."a>", "ggVG", { desc = "Select all" })
  keymap.set({ "n", "v" }, cmd.."/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "Toggle comment" })
  
  -- macOS specific refactoring
  keymap.set({ "n", "v" }, cmd.."S-r>", "<cmd>Telescope lsp_references<CR>", { desc = "Find usages" })
  keymap.set({ "n", "v" }, cmd.."S-t>", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
else
  -- Linux/Windows keymaps
  keymap.set({ "n", "i" }, ctrl.."b>", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })
  keymap.set({ "n", "i" }, ctrl.."S-n>", "<cmd>enew<CR>", { desc = "New file" })
  keymap.set({ "n", "i" }, ctrl.."S-f>", "<cmd>Telescope live_grep<CR>", { desc = "Find in files" })
  keymap.set({ "n", "i" }, ctrl.."f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in current file" })
  keymap.set({ "n", "i" }, ctrl.."o>", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Go to symbol" })
  keymap.set({ "n", "i" }, ctrl.."S-o>", "<cmd>Telescope workspace_symbols<CR>", { desc = "Go to symbol in project" })
  keymap.set({ "n", "i" }, ctrl.."e>", "<cmd>Telescope find_files<CR>", { desc = "Go to file" })
  keymap.set({ "n", "i" }, ctrl.."l>", ":", { desc = "Go to line" })
  
  -- Linux/Windows editor actions
  keymap.set({ "n", "i" }, ctrl.."s>", "<cmd>w<CR>", { desc = "Save" })
  keymap.set({ "n", "v" }, ctrl.."c>", "y", { desc = "Copy" })
  keymap.set({ "n", "v" }, ctrl.."v>", "p", { desc = "Paste" })
  keymap.set({ "n", "v" }, ctrl.."x>", "d", { desc = "Cut" })
  keymap.set({ "n", "i" }, ctrl.."z>", "u", { desc = "Undo" })
  keymap.set({ "n", "i" }, ctrl.."S-z>", "<C-r>", { desc = "Redo" })
  keymap.set({ "n", "i" }, ctrl.."a>", "ggVG", { desc = "Select all" })
  keymap.set({ "n", "v" }, ctrl.."/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "Toggle comment" })
  
  -- Linux/Windows specific refactoring
  keymap.set({ "n", "v" }, ctrl.."S-r>", "<cmd>Telescope lsp_references<CR>", { desc = "Find usages" })
  keymap.set({ "n", "v" }, ctrl.."S-t>", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
end

-- Common keymaps (same for both OS)
-- Code navigation
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Quick documentation" })
keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap.set("n", "<F4>", vim.lsp.buf.code_action, { desc = "Show code actions" })

-- Code refactoring
keymap.set("n", alt.."Enter>", vim.lsp.buf.code_action, { desc = "Show intentions" })
keymap.set({ "n", "i" }, ctrl.."alt>l", vim.lsp.buf.format, { desc = "Format code" })

-- Window management
keymap.set("n", alt.."v>", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", alt.."h>", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", ctrl.."F4>", "<cmd>close<CR>", { desc = "Close window" })

-- Window navigation
keymap.set("n", alt.."h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", alt.."l>", "<C-w>l", { desc = "Go to right window" })
keymap.set("n", alt.."k>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", alt.."j>", "<C-w>j", { desc = "Go to lower window" })

-- Tab navigation
for i = 1, 9 do
  keymap.set({ "n", "i" }, alt..i..">", string.format("<cmd>%dgt<CR>", i), { desc = string.format("Go to tab %d", i) })
end

-- Git integration
keymap.set("n", ctrl.."k>", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous change" })
keymap.set("n", ctrl.."j>", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next change" })
keymap.set("n", "gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview change" })
keymap.set("n", alt.."9>", "<cmd>LazyGit<CR>", { desc = "Git tool window" })

-- Copilot
if is_mac then
  keymap.set("i", cmd.."i>", function() return vim.fn["copilot#Accept"]("") end, {
    expr = true,
    replace_keycodes = false,
    desc = "Accept Copilot suggestion"
  })
  keymap.set("i", cmd.."]>", function() return vim.fn["copilot#Next"]() end, {
    expr = true,
    desc = "Next Copilot suggestion"
  })
  keymap.set("i", cmd.."[>", function() return vim.fn["copilot#Previous"]() end, {
    expr = true,
    desc = "Previous Copilot suggestion"
  })
else
  keymap.set("i", alt.."i>", function() return vim.fn["copilot#Accept"]("") end, {
    expr = true,
    replace_keycodes = false,
    desc = "Accept Copilot suggestion"
  })
  keymap.set("i", alt.."]>", function() return vim.fn["copilot#Next"]() end, {
    expr = true,
    desc = "Next Copilot suggestion"
  })
  keymap.set("i", alt.."[>", function() return vim.fn["copilot#Previous"]() end, {
    expr = true,
    desc = "Previous Copilot suggestion"
  })
end

-- Search
keymap.set({ "n", "i" }, "<F3>", "n", { desc = "Find next" })
keymap.set({ "n", "i" }, shift.."F3>", "N", { desc = "Find previous" })

-- Additional navigation
keymap.set({ "n", "i" }, ctrl.."S-m>", "<cmd>Telescope marks<CR>", { desc = "Go to bookmark" })
keymap.set({ "n", "i" }, ctrl.."e>", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })

-- Terminal
keymap.set({ "n", "i" }, alt.."F12>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" }) 