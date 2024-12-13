local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
}

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps --no-save; npx gulp vsDebugServerBundle; rm -rf out; mv dist out",
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("dap-vscode-js").setup({
            debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
            adapters = {
              "chrome",
              "pwa-node",
              "pwa-chrome",
              "pwa-msedge",
              "pwa-extensionHost",
              "node-terminal",
            },
          })
        end,
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("nvim-dap-virtual-text").setup({})
      dapui.setup({})

      for _, language in ipairs(js_based_languages) do
        dap.configurations[language] = {
          -- Debug single nodejs files
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
          },
          -- Debug nodejs processes (make sure to add --inspect when you run the process)
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
          },
          -- Debug web applications (client side)
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch & Debug Chrome",
            url = function()
              local co = coroutine.running()
              return coroutine.create(function()
                vim.ui.input({
                  prompt = "Enter URL: ",
                  default = "http://localhost:3000",
                }, function(url)
                  if url == nil or url == "" then
                    return
                  else
                    coroutine.resume(co, url)
                  end
                end)
              end)
            end,
            webRoot = vim.fn.getcwd(),
            protocol = "inspector",
            sourceMaps = true,
            userDataDir = false,
          },
        }
      end

      local widgets = require('dap.ui.widgets')

      -- set scopes as right pane
      local scopes = widgets.sidebar(widgets.scopes, {}, 'vsplit')

      -- set frames as bottom pane
      local frames = widgets.sidebar(widgets.frames, { height = 10 }, 'belowright split')

      vim.keymap.set('n', '<leader>dj', dap.continue)
      vim.keymap.set('n', '<leader>dm', dap.step_over)
      vim.keymap.set('n', '<leader>di', dap.step_into)
      vim.keymap.set('n', '<leader>dk', dap.toggle_breakpoint)
      vim.keymap.set('n', '<leader>dn', dap.clear_breakpoints)
      vim.keymap.set('n', '<leader>dt', dap.terminate)

      local repl = require('dap.repl')

      vim.keymap.set(
        'n', '<leader>da',
        function()
          return repl.toggle({}, 'belowright split')
        end
      )

      vim.keymap.set('n', '<leader>ds', scopes.toggle)
      vim.keymap.set('n', '<leader>df', frames.toggle)
      vim.keymap.set('n', '<leader>dh', widgets.hover)

      vim.keymap.set("n", "<leader>dc", dap.continue, {})
      vim.keymap.set("n", "<leader>di", dap.step_into, {})
      vim.keymap.set("n", "<leader>dov", dap.step_over, {})
      vim.keymap.set("n", "<leader>dou", dap.step_out, {})
      vim.keymap.set("n", "<leader>db", dap.step_back, {})
      vim.keymap.set("n", "<leader>dr", dap.terminate, {})
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, {})
      vim.keymap.set("n", "<leader>?", function()
        require("dapui").eval(nil, { enter = true })
      end, {})
    end,
  },
}
