local time_spend_keys = require("prefs.keymap.plug.IDE_Misc").timespent

return {
  "quentingruber/timespent.nvim",
  keys = {
    { time_spend_keys[1], time_spend_keys[2], mode = { "n" }, desc = "Show time spent" },
  },
}
