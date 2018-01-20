art 'woodpecker'

write "The woodpecker came to rest on the branches of a mighty oak tree. She gave three quick knocks, paused, and then gave one more.", :typed, :very_fast, :yellow

write "ヽ(´ー｀)ノ \"Welcome back ... my friend,\" slowly replied the tree.", :speech, :very_fast, :blue

write "ᕕ( ᐛ )ᕗ \"Back! Welcome? No need. I will come back to you until the world is without you, me, or the sun.\" answered the woodpecker sweetly. \"\"", :speech, :very_fast, :green

write "The woodpecker and oak talked away the day. The tree mostly listening. Until finally, the tree came to his request...", :typed, :very_fast, :yellow

option "Woodpecker asks tree what is the matter ...", event: 'what-was-the-matter'

event 'what-was-the-matter' do
  write "Tree was silent for quite some time until he finally spoke...", :typed, :very_fast, :yellow

  transition 'tree-has-termites.woodpecker-and-the-oak'
end
