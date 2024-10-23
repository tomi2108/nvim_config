return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    require("dbee").install()
  end,
  config = function()
    local tools = require("dbee.layouts.tools")
    local api_ui = require("dbee.api.ui")
    local utils = require("dbee.utils")

    local layout = {
      egg = nil,
      windows = {},
      is_opened = false,
    }
    function layout:is_open()
      return self.is_opened
    end

    function layout:configure_window_on_switch(on_switch, winid, open_fn, is_editor)
      local action
      if on_switch == "close" then
        action = function(_, buf, file)
          if is_editor then
            local note, _ = api_ui.editor_search_note_with_file(file)
            if note then
              return
            end
            note, _ = api_ui.editor_search_note_with_buf(buf)
            if note then
              return
            end
          end
          self:close()
          vim.api.nvim_win_set_buf(0, buf)
        end
      else
        action = function(win, _, _)
          open_fn(win)
        end
      end

      utils.create_singleton_autocmd({ "BufWinEnter", "BufReadPost", "BufNewFile" }, {
        window = winid,
        callback = function(event)
          action(winid, event.buf, event.file)
        end,
      })
    end

    function layout:configure_window_on_quit(winid)
      utils.create_singleton_autocmd({ "QuitPre" }, {
        window = winid,
        callback = function()
          self:close()
        end,
      })
    end

    function layout:open()
      self.egg = tools.save()

      self.windows = {}

      -- editor
      tools.make_only(0)
      local editor_win = vim.api.nvim_get_current_win()
      table.insert(self.windows, editor_win)
      api_ui.editor_show(editor_win)
      self:configure_window_on_switch(self.on_switch, editor_win, api_ui.editor_show, true)
      self:configure_window_on_quit(editor_win)

      -- drawer
      vim.cmd("to 20 vsplit")
      local win = vim.api.nvim_get_current_win()
      table.insert(self.windows, win)
      api_ui.drawer_show(win)
      self:configure_window_on_switch(self.on_switch, win, api_ui.drawer_show)
      self:configure_window_on_quit(win)

      -- result
      vim.cmd("bo 20 split")
      win = vim.api.nvim_get_current_win()
      table.insert(self.windows, win)
      api_ui.result_show(win)
      self:configure_window_on_switch(self.on_switch, win, api_ui.result_show)
      self:configure_window_on_quit(win)

      vim.api.nvim_set_current_win(editor_win)

      self.is_opened = true
    end

    function layout:close()
      for _, win in ipairs(self.windows) do
        pcall(vim.api.nvim_win_close, win, false)
      end

      tools.restore(self.egg)
      self.egg = nil
      self.is_opened = false
    end

    require("dbee").setup({
      window_layout = layout,
      default_connection = "webapo-local",
      result = {
        page_size = 8,
      },
      call_log = {
        disable_help = true,
      },
      drawer = {
        disable_help = true,
      },
      sources = {
        require("dbee.sources").MemorySource:new({
          {
            id = "webapo-local",
            name = "webapo-local",
            type = "mssql",
          },
          {
            id = "webapo-dev",
            name = "webapo-dev",
            type = "mssql",
          },
          {
            id = "webapo-cert",
            name = "webapo-cert",
            type = "mssql",
          },
          {
            id = "remedy",
            name = "remedy",
            type = "mssql",
          },
          {
            id = "gdd",
            name = "gdd",
            type = "mssql",
            url = "Data Source=localhost;Database=GD2C2024;User=sa;Password=Akjjyglc200",
          },
        }),
      },
    })
    vim.keymap.set("n", "<leader>db", function()
      vim.cmd("Dbee")
      vim.cmd("resize +9")
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-h>", true, true, true), "m", false)
    end)
    vim.keymap.set("n", "<leader>dr", function()
      vim.cmd("resize +9")
    end)
  end,
}
