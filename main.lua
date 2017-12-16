require "characters"

debug = false

hit = {}

sam = create_character(924, 468)
sam.img.dn = love.graphics.newImage("images/sam_dn.png")
sam.img.up = love.graphics.newImage("images/sam_up.png")
sam.img.lt = love.graphics.newImage("images/sam_lt.png")
sam.img.rt = love.graphics.newImage("images/sam_rt.png")
sam.img.disp = sam.img.dn
sam.hit_offset = {
  tp = 60,
  lt = 6,
  rt = 6,
  bt = 0
}

box = create_character(650, 550)

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
  -- love.graphics.draw(porch, 1300, 400)
  love.graphics.draw(box.img.disp, box.x, box.y)
  love.graphics.draw(sam.img.disp, sam.x, sam.y)
  if debug
 then
    love.graphics.print(round(sam.x, 2), 10, 10)
    love.graphics.print(round(sam.y, 2), 70, 10)
    love.graphics.print(string.format("hit dn: %s", tostring(hit.dn)), 130, 10)
    love.graphics.print(string.format("hit up: %s", tostring(hit.up)), 130, 40)
    love.graphics.print(string.format("hit lt: %s", tostring(hit.lt)), 130, 70)
    love.graphics.print(string.format("hit rt: %s", tostring(hit.rt)), 130, 100)
    draw_hitbox_corners(sam)
    draw_hitbox_corners(box)
  end
end

function love.keypressed(key)
  if key == "`" then
    debug = not debug
  end
end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end