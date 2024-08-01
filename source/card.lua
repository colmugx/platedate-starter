local pd <const> = playdate
local gfx <const> = pd.graphics

class("Card").extends(gfx.sprite)

function Card:controlCheck()
  if pd.buttonIsPressed(pd.kButtonUp) then
    self:moveBy(0, -self.config.speed)
  end
  if pd.buttonIsPressed(pd.kButtonRight) then
    self:moveBy(self.config.speed, 0)
  end
  if pd.buttonIsPressed(pd.kButtonDown) then
    self:moveBy(0, self.config.speed)
  end
  if pd.buttonIsPressed(pd.kButtonLeft) then
    self:moveBy(-self.config.speed, 0)
  end
end

function Card:getCrankPosition()
  if (pd.isCrankDocked()) then
    self.config.deg = 0
  else
    self.config.deg = pd.getCrankPosition()
  end
end

function Card:init(config)
  Card.super.init(self)
  self.config = config

  local image = self:drawText()

  self:moveTo(config.x, config.y)
  self:setImage(image)
end

function Card:drawText()
  local imageText = gfx.image.new(200, 50)

  gfx.pushContext(imageText)
  gfx.drawText(self.config.enText, 0, 0)
  gfx.drawText(self.config.jaText, -5, 20)
  gfx.popContext()

  return imageText
end

function Card:update()
  Card.super.update(self)

  self:controlCheck()
  self:getCrankPosition()

  self:setRotation(self.config.deg)
end
