# World 1 - 1

## start the game

```
$ docker build .
...
...
Successfully built DOCKER_IMAGE_ID
$ docker run -it DOCKER_IMAGE_ID
```

## Introduction

Hello. Oh my, it seems you have fallen into this crazy world. But not a bump on the crest of your brow. It seems your lucky one. Some land a little harder when they hit the silicon.

* Where am I?
* Who are you?
* What is everyone doing here?
* How do I leave?
* > Get to work!

You return to your new life as a bit coin miner for the troll running the dimension.


* > Escape

The doorway to this world is blocked. It seems you're stuck here until you can help this troll find his fortune.

* > Rest

You think about all that time you wasted in your life before you came to this world.

You sigh and think about how much all this mining reminds you of playing EVE Online.

It's not long before the Troll makes his way around to you. "You're worse than a peon in the World of Warcraft! Get back to work!"

For a moment you take in the beauty of the devastated silicon landscape. Tiny fireworks dot the horizon; others trapped here mining bits striking with their large hammers.

* > Mine bits

Bits fly up into the air as you smash your hands into silicon below you. The troll laughs excitedly as as the large LED numbers in the sky continue to climb higher with each smash.

* > (after mining bits 3 times) inspect gem

"No, no, no. My name is InSpec gem. I am able to find things hidden in the darkness. But before that happens you will first need to learn to DIVE." After the gem tells you how it works you think you'd be willing to give it a try.

* > (after inspect gem) DIVE

You feel your thoughts and consciousness pour out of your body and into the silicon below your feet. You find it hard think as yourself and use your words. You feel them replaced by the words of the silicon. Though you must remember 'wake', otherwise you will never be able to find your way back to yourself again and become part of the silicon.

## Puzzle

```
$ inspec exec find_weakness
# Learn that the chef-apply command is vulnerable
$ wake
```

"What did you see?" asks InSpec gem. "Oh, a vulnerability. The chef-apply command. That's right! You could probably use it to find the fortune. Oh yeah, that troll. Is he a friend of yours? He walked by muttering something about missing his fortune. I'm sure I remember being able to find "missing_fortunes" like "find_weakness"

Well why don't you have a go at finding this fortune. I'd be willing to help if you'd be willing to take me with you.

## Puzzle

```bash
> DIVE
$ inspec exec missing_fortune
# The package fortune is not present on the system
$ chef-apply -e "package 'fortune'"
$ wake
```

Oh my! Out of my way you! My lovely fortune. My precious fortune. The troll open his fortune

  $ troll # /usr/share/games/fortune

Oh how appropriate. The troll grabs the fortune, hoists it over his head, and then scampers off into the distance. The light on your key turns green.

"Hey take me with you before you go?" the Inspec gem cries out.

* > Bring the Inspec gem

You turn back to your friend, scoop them up, and tuck them into your pocket move through the door into ...

CODE WITH GEM + MOVE COUNT + HANDLE

* > Leave the Inspec gem

You turn back on your friend and move through the door into ...

CODE WITHOUT GEM + MOVE COUNT + HANDLE
