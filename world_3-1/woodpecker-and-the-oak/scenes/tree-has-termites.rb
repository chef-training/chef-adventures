write "ヽ(´ー｀)ノ \"I have termites . . . A few tender taps from you will send them packing,\" replied the tree.", :speech, :very_fast, :blue

write "Woodpecker thought and then spoke."

write "ᕕ( ᐛ )ᕗ \"My aid I will give! So swift and deft I bring my beak to your service,\" bellowed the woodpecker, \"Termites! Termites! Where are these termites?\"", :typed, :very_fast, :green

write "ヽ(´ー｀)ノ \"They rest along my trunk,\" replied the tree.", :speech, :very_fast, :blue

write "Woodpecker flew down to the root of the tree.", :typed, :very_fast, :yellow

option "Look at the tree ...", event: 'look-at-the-tree'

event 'look-at-the-tree' do
  write "Turns twisted woodpecker's head until her eyes crossed and her lids grew heavy. And very soon, she was fast asleep snoring peacefully at the base of the tree, Woodpecker dreamed.", :typed, :very_fast, :yellow

  write "ヽ(´ー｀)ノ \"Look at your surroundings with `ls`,\" replied the tree.", :speech, :very_fast, :blue

  transition 'asleep-on-the-job.woodpecker-and-the-oak'
end
