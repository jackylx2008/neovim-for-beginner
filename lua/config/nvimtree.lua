-- local M = {}

-- function M.setup()
--   local nvim_tree = require "nvim-tree"
--   nvim_tree.setup {
--     disable_netrw = false,
--     hijack_netrw = true,
--     respect_buf_cwd = true,
--     view = {
--       number = true,
--       relativenumber = true,
--     },
--     filters = {
--       custom = { ".git" },
--     },
--     sync_root_with_cwd = true,
--     update_focused_file = {
--       enable = true,
--       update_root = true,
--     },
--   }
-- end

-- return M
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local icons = require "user.icons"

local tree_cb = nvim_tree_config.nvim_tree_callback

local M = {}

function M.setup()
  -- require("nvim-tree").setup {
  --   disable_netrw = true,
  --   hijack_netrw = true,
  --   view = {
  --     number = true,
  --     relativenumber = false,
  --   },
  --   filters = {
  --     custom = { ".git" },
  --   },
  -- }
  nvim_tree.setup {
    hijack_directories = {
      enable = false,
    },
    -- update_to_buf_dir = {
    --   enable = false,
    -- },
    -- disable_netrw = true,
    -- hijack_netrw = true,
    -- open_on_setup = false,
    ignore_ft_on_setup = {
      "startify",
      "dashboard",
      "alpha",
    },
    filters = {
      custom = { ".git" },
      exclude = { ".gitignore" },
    },
    -- auto_close = true,
    -- open_on_tab = false,
    -- hijack_cursor = false,
    -- update_to_buf_dir = {
    --   enable = true,
    --   auto_open = true,
    -- },
    -- --   error
    -- --   info
    -- --   question
    -- --   warning
    -- --   lightbulb
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      highlight_opened_files = "none",
      root_folder_modifier = ":t",
      indent_markers = {
        enable = false,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = icons.ui.ArrowOpen,
            arrow_closed = icons.ui.ArrowClosed,
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = icons.diagnostics.Hint,
        info = icons.diagnostics.Information,
        warning = icons.diagnostics.Warning,
        error = icons.diagnostics.Error,
      },
    },
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    -- system_open = {
    --   cmd = nil,
    --   args = {},
    -- },
    -- filters = {
    --   dotfiles = false,
    --   custom = {},
    -- },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      hide_root_folder = false,
      side = "left",
      -- auto_resize = true,
      mappings = {
        custom_only = false,
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },
        },
      },
      number = true,
      relativenumber = false,
    },
  }

  vim.g.nvim_tree_respect_buf_cwd = 1
end

return M
