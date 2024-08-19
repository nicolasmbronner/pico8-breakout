# pico8-breakout
I'm creating a Breakout / Arkanoid game in pico-8 following a course from Lazy Devs Youtube channel

# breakout - 2024-08-20, 00h33
### Improved UX for Ball Deflection on the Paddle

From now on, if the ball touches the paddle's side, it will bounce in a way that saves the ball, and before the bounce, teleport it right above the paddle's collision level, which make the game much more friendly.



# breakout - 2024-08-18, 00h30
### Implementation of Ball Deflections for the Paddle

This update adds advanced collision handling and ball deflections to our Breakout game. Here are the main new features:

1. **Improved Collision Detection**: The `ball_col()` function detects collisions between the ball and a rectangle (such as the paddle) by checking if the ball is outside the rectangle's boundaries. This elimination method is efficient and accurate.

2. **Deflection Calculation**: The new `ball_defl()` function determines whether the ball should bounce horizontally or vertically upon collision. It uses the concept of slope to calculate the ball's trajectory.

3. **Handling of Special Cases**: The code takes into account different ball movement scenarios (upwards, downwards, left, right) and adjusts the deflection accordingly.

4. **Slope Utilization**: The slope of the ball's trajectory (calculated by `ball_dy/ball_dx`) is used to determine the direction of the bounce. This allows for more realistic bounces based on the ball's approach angle.

5. **Position Correction**: After a collision, the ball's position is adjusted to prevent it from getting "stuck" to the paddle.

These improvements make the ball's behavior more realistic and allow for more precise interactions with the paddle and potentially other game elements.

Also added a pico-8 file : "slope_map.p8", which is a graphic to help understdand the slopes at 360°, including an image file "slope map.png" for a quick overview.



# Extras
- **collision detection by elimination.p8** : is a working prototype showing collision detection using elimination tests
- **collision deflection.p8** : is another working prototype showing rules of deflection using comparison of ball direction slope VS corner-ball slope
- **slope_map.p8** : is yet another prototype of a schema indicating a map of slopes, easy to understand and grasp



# breakout - 2024-08-17, 00h23
This version can detect collisions between the ball and the paddle, nothing else but it's stable.



# breakout - 2024-08-15, 22h51
This version only have the ball moving and bouncing between the screen boundaries. Each bounce make
a sound.
