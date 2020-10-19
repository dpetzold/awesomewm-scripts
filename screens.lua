awful = require("awful")
naughty = require("naughty")

local terminal = "sakura"

for s in screen do

  print(s.index)

  naughty.notify({
      text=string.format("%d %q", s.index, s.primary)
  })

  for i, tag in pairs(s.tags) do

    local terminals = 0

    naughty.notify({
        text=string.format("%q", tag.name)
    })

    for i, client in pairs(tag:clients()) do

      naughty.notify({
          text=string.format("%q", client.name)
      })

      if client.name == terminal then
        terminals = terminals + 1
      end

    end

    local i = 3 - terminals

    naughty.notify({
        text=string.format("%q", i)
    })


    while i ~= 0 do
      awful.spawn("sakura -e tmux", {
          tag = tag
      })
      i = i - 1
    end

  end

end
