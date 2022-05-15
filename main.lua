local tracery = require("third-party.tracery")

local font_Piacevoli

local grammar
local phraseGrammar = {
    origin = "#phrase#",
    phrase = {
        "#personality.a.capitalize# #race# #className# who used to be #background.a#",
        "#personality.a.capitalize# #race# #className# who is #background.a#",
        "#personality.a.capitalize# #race# #background# who happens to be #className.a#",
        "#personality.a.capitalize# #race# #background# who is #className.a#"
    },
    personality = require("data.personality"),
    race = require("data.race"),
    background = require("data.background"),
    className = require("data.class"),
}

local phrase
local text
local textWidth

local function fromPoints(points)
    return points * (4/3) -- pixels
end

function love.load()
    math.randomseed(os.time())

    font_Piacevoli = love.graphics.newFont(
        "asset/font/Piacevoli.ttf", fromPoints(24)
    )

    textWidth = love.graphics.getWidth() * 0.75

    grammar = tracery.createGrammar(phraseGrammar)
    grammar:addModifiers(tracery.baseEngModifiers)

    phrase = grammar:flatten(
        "I recommend you play...\n#origin#."
    )
    text = love.graphics.newText(font_Piacevoli, "")
    text:setf(phrase, textWidth, "center")
end

function love.draw()
    love.graphics.clear(15/255, 56/255, 15/255)

    love.graphics.setColor(202/255, 220/255, 159/255)
    love.graphics.draw(
        text,
        (love.graphics.getWidth() / 2) - (textWidth / 2),
        (love.graphics.getHeight() / 2) - (text:getHeight() / 2)
    )
end