vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Netrw enhancements
vim.g.netrw_banner = 0                -- Hide the banner
vim.g.netrw_liststyle = 1             -- Default to detailed view (0=thin, 1=long, 2=wide, 3=tree)
vim.g.netrw_browse_split = 0          -- Open files in the same window
vim.g.netrw_winsize = 25              -- Set width to 25% of screen
vim.g.netrw_altv = 1                  -- Open splits to the right
vim.g.netrw_sizestyle = "H"           -- Human-readable file sizes
vim.g.netrw_list_hide = '\\.git$'     -- Hide .git directories
vim.g.netrw_bufsettings = 'noma nomod nu rnu nowrap ro nobl' -- Enable line numbers in netrw

