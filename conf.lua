local width = 512
local ratio = 1.09

function love.conf(t)
    t.window.title = "Who Next"
    t.window.icon = "asset/icon.png"
    t.window.width = width
    t.window.height = width * 1 / ratio

    t.modules.audio = false
    t.modules.joystick = false
    t.modules.physics = false
    t.modules.sound = false
    t.modules.timer = false
    t.modules.touch = false
    t.modules.video = false
end