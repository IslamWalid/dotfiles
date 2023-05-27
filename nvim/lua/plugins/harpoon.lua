return {
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>hm",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Harppon Add File",
    },
    {
      "<leader>hu",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Harppon Quick Menu Toggle",
    },
    {
      "<A-1>",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Harppon Navigate File (1)",
    },
    {
      "<A-2>",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Harppon Navigate File (2)",
    },
    {
      "<A-3>",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Harppon Navigate File (3)",
    },
    {
      "<A-4>",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "Harppon Navigate File (4)",
    },
  },
}
