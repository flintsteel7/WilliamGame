require "characters"

dev = true

sam = create_character()
sam.x = 924
sam.y = 468
sam.img.dn = love.graphics.newImage("images/sam_dn.png")
sam.img.up = love.graphics.newImage("images/sam_up.png")
sam.img.lt = love.graphics.newImage("images/sam_lt.png")
sam.img.rt = love.graphics.newImage("images/sam_rt.png")
sam.img.disp = sam.img.dn

box = create_character()
box.x = 650
box.y = 550

function love.load()
  love.window.setTitle("William's Game")
  love.window.setMode(1848, 936)
  background = love.graphics.newImage("images/background.png")
  porch = love.graphics.newImage("images/porch.png")
end

function love.update(dt)
   move_character(sam, dt)
end

function love.draw()
  love.graphics.draw(background, 0, 0)
  love.graphics.draw(porch, 1300, 400)
  love.graphics.draw(sam.img.disp, sam.x, sam.y)
  love.graphics.draw(box.img.disp, box.x, box.y)
  if dev then
    love.graphics.print(round(sam.x, 2), 10, 10)
    love.graphics.print(round(sam.y, 2), 70, 10)
    love.graphics.points(sam.hit[1][1], sam.hit[1][2], sam.hit[2][1], sam.hit[2][2], sam.hit[3][1], sam.hit[3][2], sam.hit[4][1], sam.hit[4][2])
  end
end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end