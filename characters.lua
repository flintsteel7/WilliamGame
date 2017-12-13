function create_character()
  character = {}
  character.speed = 200
  character.x = 0
  character.y = 0
  character.img = {}
  character.img.dn = love.graphics.newImage("images/default.png")
  character.img.up = love.graphics.newImage("images/default.png")
  character.img.lt = love.graphics.newImage("images/default.png")
  character.img.rt = love.graphics.newImage("images/default.png")
  character.img.disp = character.img.dn
  character.width = character.img.disp:getWidth()
  character.height = character.img.disp:getHeight()
  character.hit = {
    {character.x, character.y},
    {character.x + character.width, character.y},
    {character.x, character.y + character.height},
    {character.x + character.width, character.y + character.height}
  }
  return character
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
  -- recalculate hitbox
  character.width = character.img.disp:getWidth()
  character.height = character.img.disp:getHeight()
  character.hit = {
    {character.x, character.y},
    {character.x + character.width, character.y},
    {character.x, character.y + character.height},
    {character.x + character.width, character.y + character.height}
  }
end