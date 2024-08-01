import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/graphics"

import "card"

local pd <const> = playdate
local gfx <const> = pd.graphics

local screenW = playdate.display.getWidth()
local screenH = playdate.display.getHeight()

local config = {
  enText = "Hello World",
  jaText = "こんにちは",
  x = screenW / 2 + 10,
  y = screenH / 2 + 10,
  speed = 5,
  deg = 0
}

local function drawFPS()
  pd.drawFPS(screenW - 20, screenH - 20)
end

function init()
  local sprite = Card(config)
  sprite:add()
end

init()

function pd.update()
  gfx.clear()
  drawFPS()
  gfx.sprite.update()
end
