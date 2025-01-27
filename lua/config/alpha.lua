local M = {}

function M.setup()
  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

  local dashboard = require "alpha.themes.dashboard"
  dashboard.section.header.val = {
    [[  ───────────▄▄▄▄▄▄▄▄▄─────────── ]],
    [[  ────────▄█████████████▄──────── ]],
    [[  █████──█████████████████──█████ ]],
    [[  ▐████▌─▀███▄───────▄███▀─▐████▌ ]],
    [[  ─█████▄──▀███▄───▄███▀──▄█████─ ]],
    [[  ─▐██▀███▄──▀███▄███▀──▄███▀██▌─ ]],
    [[  ──███▄▀███▄──▀███▀──▄███▀▄███── ]],
    [[  ──▐█▄▀█▄▀███─▄─▀─▄─███▀▄█▀▄█▌── ]],
    [[  ───███▄▀█▄██─██▄██─██▄█▀▄███─── ]],
    [[  ────▀███▄▀██─█████─██▀▄███▀──── ]],
    [[  ───█▄─▀█████─█████─█████▀─▄█─── ]],
    [[  ───███────────███────────███─── ]],
    [[  ───███▄────▄█─███─█▄────▄███─── ]],
    [[  ───█████─▄███─███─███▄─█████─── ]],
    [[  ───█████─████─███─████─█████─── ]],
    [[  ───█████─████─███─████─█████─── ]],
    [[  ───█████─████─███─████─█████─── ]],
    [[  ───█████─████▄▄▄▄▄████─█████─── ]],
    [[  ────▀███─█████████████─███▀──── ]],
    [[  ──────▀█─███─▄▄▄▄▄─███─█▀────── ]],
    [[  ─────────▀█▌▐█████▌▐█▀───────── ]],
    [[  ────────────███████──────────── ]],
  }
  dashboard.section.buttons.val = {
    -- dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    -- dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    -- dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", "  Quit", ":qa<CR>"),
  }

  local function footer()
    -- Number of plugins
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date "%Y-%m-%d %H:%M:%S"
    -- local plugins_text = "\t" .. total_plugins .. " plugins  " .. datetime

    local plugins_text = "   "
      .. total_plugins
      .. " plugins"
      .. "   v"
      .. vim.version().major
      .. "."
      .. vim.version().minor
      .. "."
      .. vim.version().patch
      .. "   "
      .. datetime

    -- -- Quote
    -- local fortune = require "alpha.fortune"
    -- local quote = table.concat(fortune(), "\n")

    return plugins_text
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Constant"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Function"
  dashboard.section.buttons.opts.hl_shortcut = "Type"
  dashboard.opts.opts.noautocmd = true

  alpha.setup(dashboard.opts)
end

return M
