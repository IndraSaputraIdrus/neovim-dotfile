return {
  {
    "echasnovski/mini.bufremove",
    version = '*', -- Gunakan versi stable
    lazy = true,   -- Aktifkan lazy loading
    keys = {
      {
        "<Leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Hapus buffer tanpa memaksa"
      },
      {
        "<Leader>bD",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Hapus buffer dengan paksa"
      },
      {
        "<Leader>x",
        function()
          require("mini.bufremove").wipeout(0, false)
        end,
        desc = "Wipeout buffer"
      },
    },
  },
}
