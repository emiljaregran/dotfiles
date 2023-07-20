local keymap = function(tbl)
	local opts = { noremap = true, silent = true }
	local mode = tbl['mode']
	tbl['mode'] = nil
	local bufnr = tbl['bufnr']
	tbl['bufnr'] = nil

	for k, v in pairs(tbl) do
		if tonumber(k) == nil then
			opts[k] = v
		end
	end

	if bufnr ~= nil then
		vim.api.nvim_buf_set_keymap(bufnr, mode, tbl[1], tbl[2], opts)
	else
		vim.api.nvim_set_keymap(mode, tbl[1], tbl[2], opts)
	end
end

nmap = function(tbl)
	tbl['mode'] = 'n'
	keymap(tbl)
end

imap = function(tbl)
	tbl['mode'] = 'i'
	keymap(tbl)
end

vmap = function(tbl)
    tbl['mode'] = 'v'
    keymap(tbl)
end


-- Tabs and tab movement
nmap{"tn", "<cmd>tabnew<CR>"}
nmap{"tk", "<cmd>tabnext<CR>"}
nmap{"tj", "<cmd>tabprev<CR>"}

-- Navigate between panes
nmap{"<C-h>", "<cmd>wincmd h<CR>"}
nmap{"<C-j>", "<cmd>wincmd j<CR>"}
nmap{"<C-k>", "<cmd>wincmd k<CR>"}
nmap{"<C-l>", "<cmd>wincmd l<CR>"}

-- Clear highlighted search
nmap{"<leader>k", "<cmd>nohlsearch<CR><C-l><cmd>echo \"Search cleared\"<CR>"}

-- Delete without overwriting the copy-paste register
nmap{"<leader>d", "\"_d"}
vmap{"<leader>d", "\"_d"}
nmap{"x", "\"_x"}
