pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--next breakout #7

--ball
ball_x=60
ball_dx=0.5 --delta
ball_y=10
ball_dy=0.5
ball_r=2 			--radius
ball_c=9 			--color

--paddle
pad_x=52
pad_y=118
pad_dx=0 			--delta
pad_w=24 			--width
pad_h=3 				--height
pad_s=2 				--speed
pad_d=1.3 		--deceleration
pad_c=6 				--color
pad_nor=6   --normal color
pad_nohit=11--no hit color
pad_hit=8			--colision color

--screen
screen_c=1

function _init()
	cls()
end

function _update60()
	buttpress=false
	
	--move paddle left
	if btn(0) then
		pad_dx=-pad_s
		buttpress=true
	end
	
	--move paddle right
	if btn(1) then 
		pad_dx=pad_s
		buttpress=true
	end
	
	--paddle deceleration
	if not(buttpress) then
		pad_dx/=pad_d
	end
	
	--make pad & ball move
	pad_x+=pad_dx
	ball_x+=ball_dx
	ball_y+=ball_dy
	
	
	--ball hor.boundaries
	if ball_x>125
	or ball_x<2 then
		ball_dx=-ball_dx
		sfx(0)
	end
	
	-- ball vert.boundaries
	if ball_y>125
	or ball_y<2 then
		ball_dy=-ball_dy
		sfx(0)
	end
	
	pad_c=pad_nor
	
	--check if ball hit pad
	if ball_col(
	pad_x,pad_y,pad_w,pad_h) then
		pad_c=pad_hit
	end
end

function _draw()
	cls(screen_c)
	
	--ball draw
	circfill(
	ball_x,ball_y,ball_r,ball_c)
	
	--paddle draw     
	rectfill(
	pad_x,pad_y,pad_x+pad_w,
	pad_y+pad_h,pad_c)
end


--check collision of the ball
--with a rectangle (box)
--by elimination
function ball_col(
box_x,box_y,box_w,box_h)

	--is ball bellow box?
	if ball_y-ball_r>
	box_y+box_h then
		return false --yes, no col
	end
	
	--is ball above box?
	if ball_y+ball_r<box_y then
		return false --yes, no col
	end
	
	--is ball at the ⬅️ of box?
	if ball_x-ball_r>
	box_x+box_w then
		return false --yes, no col
	end
	
	--is ball at the ➡️ of box?
	if ball_x+ball_r<box_x then
		return false --yes, no col
	end
	
	--if nothing else, ball is
	--colliding with rectangle
	return true
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000115700e560095400351000500005000050000500005000050000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
