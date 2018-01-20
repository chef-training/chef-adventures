write "ヽ(´ー｀)ノ \"I have termites . . . A few tender taps from you will send them packing,\" replied the tree."#, :speech, :very_fast, :blue

write "Woodpecker thought and then spoke."

write "ᕕ( ᐛ )ᕗ \"My aid I will give and swing so deftly my beak in service bringing you relief,\" bellowed the woodpecker, \"Termites! Termites. Where are these termites?\""#, :typed, :very_fast, :green

write "ヽ(´ー｀)ノ \"They rest along my trunk,\" replied the tree."#, :speech, :very_fast, :blue

write "Woodpecker flew down to the root of the tree. Turns twisted its head."

option "Look at the tree ...", event: 'look-at-the-tree'

event 'look-at-the-tree' do
  write "Woodpecker's eyes started crossing and then the lids dropped. Snoring peacefully at the base of the tree, Woodpecker dreamed."

  write "ヽ(´ー｀)ノ \"Look around with `ls`,\" replied the tree.", :speech, :very_fast, :blue

  transition 'asleep-on-the-job.woodpecker-and-the-oak'
end
