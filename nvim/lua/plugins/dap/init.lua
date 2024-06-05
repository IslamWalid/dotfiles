return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.dap.dlv").setup()
      require("plugins.dap.codelldb").setup()

      local dap = require("dap")
      local dapui = require("dapui")

      local function after_session()
        dapui.close()
        dap.repl.close()
      end

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.after.event_terminated["dapui_config"] = after_session
      dap.listeners.after.event_exited["dapui_config"] = after_session
      dap.listeners.after.disconnect["dapui_config"] = after_session
    end,
    dependencies = {
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("plugins.dap.js-debug").setup()
        end,
      },
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        opts = {
          icons = { expanded = "▾", collapsed = "▸" },
          mappings = {
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
          },
          layouts = {
            {
              elements = {
                "watches",
                { id = "scopes", size = 0.6 },
              },
              size = 0.3,
              position = "left",
            },
          },
          controls = {
            enabled = false,
          },
        },
        config = function(_, opts)
          local dapui = require("dapui")
          local dap_hl = {
            Stopped = { text = "▶", texthl = "", linehl = "debugPC", numhl = "debugPC" },
            Breakpoint = { text = "●", texthl = "", linehl = "", numhl = "debugBreakpoint" },
            BreakpointCondition = { text = "◆", texthl = "", linehl = "", numhl = "debugBreakpoint" },
          }

          for type, hl in pairs(dap_hl) do
            vim.fn.sign_define("Dap" .. type, hl)
          end

          dapui.setup(opts)
          vim.keymap.set({ "n", "v" }, "<leader>i", dapui.eval, { desc = "DapUI: Evaluate Expression" })
        end,
      },
    },
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Dap: Continue",
      },
      {
        "<F17>",
        function()
          require("dap").run_last()
        end,
        desc = "Dap: Run Last",
      },
      {
        "<F6>",
        function()
          require("dap").terminate()
        end,
        desc = "Dap: Terminate",
      },
      {
        "<F7>",
        function()
          require("dap").restart()
        end,
        desc = "Dap: Restart",
      },
      {
        "<F8>",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Dap: Conditional Breakpoint",
      },
      {
        "<F9>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Dap: Toggle Breakpoint",
      },
      {
        "<F21>",
        function()
          require("dap").clear_breakpoints()
        end,
        desc = "Dap: Clear Breakpoint",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Dap: Step Over",
      },
      {
        "<F22>",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Dap: Run To Cursor",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Dap: Step Into",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "Dap: Step Out",
      },
    },
  },
}
