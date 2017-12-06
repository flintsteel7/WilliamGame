sam = {}
sam.speed = 200
sam.x = 924
sam.y = 468
sam.img = {}
sam.img.dn = love.graphics.newImage("images/sam_dn.png")
sam.img.up = love.graphics.newImage("images/sam_up.png")
sam.img.lt = love.graphics.newImage("images/sam_lt.png")
sam.img.rt = love.graphics.newImage("images/sam_rt.png")
sam.img.disp = sam.img.dn

function love.load()
  love.window.setTitle("William's Game")
  love.window.setMode(1848, 936)
  background = love.graphics.newImage("images/background.png")
end

function love.update(dt)
   move_character(sam, dt)
end

function love.draw()
  love.graphics.draw(background, 0, 0)
  love.graphics.draw(sam.img.disp, sam.x, sam.y)
end

function move_character(character, dt)
  if love.keyboard.isDown('d') then
    character.img.disp = character.img.rt
    character.x = character.x + (character.speed * dt)
  end
  if love.keyboard.isDown('a') then
    character.img.disp = character.img.lt
    character.x = character.x - (character.speed * dt)
  end
  if love.keyboard.isDown('w') then
    character.img.disp = character.img.up
    character.y = character.y - (character.speed * dt)
  end
  if love.keyboard.isDown('s') then
    character.img.disp = character.img.dn
    character.y = character.y + (character.speed * dt)
	end
end