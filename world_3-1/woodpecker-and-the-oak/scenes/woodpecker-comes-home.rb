art 'woodpecker'

write "The woodpecker comes to rest on the branches of a mighty oak tree. Three quick knocks to the bark. A pause. Then one more."

write "ヽ(´ー｀)ノ \"Hello. Welcome back ... my friend,\" slowly replied the tree."#, :speech, :very_fast, :blue

write "ᕕ( ᐛ )ᕗ \"Hello to you as well old friend,\" answered the woodpecker sweetly. \"I will come back to you until the world is without a you, me, or the sun.\""#, :speech, :very_fast, :green

write "The woodpecker and oak talk away the day.  The tree mostly listening. Until finally, the tree comes to his request..."#, :typed, :very_fast, :yellow

option "Woodpecker asks tree what is the matter ...", event: 'what-was-the-matter'

event 'what-was-the-matter' do
  write "Tree was silent for quite some time until he finally spoke..."

  transition 'tree-has-termites.woodpecker-and-the-oak'
end
