# CENG 448/548 — Real-Time Operating Systems
## South Dakota School of Mines & Technology
## Laboratory Assignment Six

This lab extends the `nInvaders` game with audio sound effects using the pulse modulator device.

## Objective
Play Space Invaders sound effect samples (signed 8-bit, 8000 Hz) from tasks/ISR infrastructure.

## Sound Files
Place the four extracted files from `sound_effects.tgz` in this `Lab6` directory (or move any provided sound files into this folder if they were unpacked elsewhere).

## Part 1
1. Unpack `sound_effects.tgz` in the main project directory.
2. Update `CMakeLists.txt` so sound effect files compile.
3. Implement init setup for:
   - ISR
   - Two queues used between mixer and ISR
4. Temporarily run only the mixer task to repeatedly play one sound effect, pausing 0.5 seconds between repeats.

## Part 2
1. Complete mixer task logic:
   - Read active effects from queues
   - Sum/mix samples
   - Forward mixed stream to ISR
2. Complete sound effect task logic.
3. Finish init logic:
   - Create all queues
   - Instantiate one task per sound effect
4. Add a test task that signals each sound effect event every 2 seconds.
5. Run and debug.

## Part 3
1. Disable the test sound-effects task.
2. Enable `nInvaders` task.
3. Edit `nInvaders` to signal sound-effect events at appropriate gameplay events.
