function create_character(x, y)
  ch = {}
  ch.speed = 200
  ch.x = x
  ch.y = y
  ch.img = {
    dn = love.graphics.newImage("images/default.png"),
    up = love.graphics.newImage("images/default.png"),
    lt = love.graphics.newImage("images/default.png"),
    rt = love.graphics.newImage("images/default.png")
  }
  ch.img.disp = ch.img.dn
  ch.hit_offset = {
    tp = 0,
    lt = 0,
    rt = 0,
    bt = 0
  }
  ch = calculate_hitbox(ch)
  return ch
end

function move_character(ch, dt)
  hit = check_collision(ch, box)
  if love.keyboard.isDown('d') then
    ch.img.disp = ch.img.rt
    if not hit.rt then
      ch.x = ch.x + (ch.speed * dt)
    end
  end
  if love.keyboard.isDown('a') then
    ch.img.disp = ch.img.lt
    if not hit.lt then
      ch.x = ch.x - (ch.speed * dt)
    end
  end
  if love.keyboard.isDown('w') then
    ch.img.disp = ch.img.up
    if not hit.up then
      ch.y = ch.y - (ch.speed * dt)
    end
  end
  if love.keyboard.isDown('s') then
    ch.img.disp = ch.img.dn
    if not hit.dn then
      ch.y = ch.y + (ch.speed * dt)
    end
  end
  -- recalculate hitbox
  ch = calculate_hitbox(ch)

  return hit
end

function calculate_hitbox(ch)
  ch.width = ch.img.disp:getWidth()
  ch.height = ch.img.disp:getHeight()
  ch.hit = {
    xl = ch.x + ch.hit_offset.lt,
    xr = ch.x + ch.width - ch.hit_offset.rt,
    yt = ch.y + ch.hit_offset.tp,
    yb = ch.y + ch.height - ch.hit_offset.bt
  }
  return ch
end

function draw_hitbox_corners(ch)
  love.graphics.points(ch.hit.xl, ch.hit.yt, ch.hit.xr, ch.hit.yt, ch.hit.xl, ch.hit.yb, ch.hit.xr, ch.hit.yb)
end

function check_collision(i1, i2)
  return {
    dn = i1.hit.yb >= i2.hit.yt and i1.hit.yt < i2.hit.yt and i1.hit.xr >= i2.hit.xl and i1.hit.xl <= i2.hit.xr,
    up = i1.hit.yt <= i2.hit.yb and i1.hit.yb > i2.hit.yb and i1.hit.xr >= i2.hit.xl and i1.hit.xl <= i2.hit.xr,
    lt = i1.hit.xl <= i2.hit.xr and i1.hit.xr > i2.hit.xr and i1.hit.yb >= i2.hit.yt and i1.hit.yt <= i2.hit.yb,
    rt = i1.hit.xr >= i2.hit.xl and i1.hit.xl < i2.hit.xl and i1.hit.yb >= i2.hit.yt and i1.hit.yt <= i2.hit.yb
  }
end