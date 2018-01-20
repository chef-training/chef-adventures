write "The tree was late now with its work. Not all of the branches had grown their leaves. Tree asks for another favor."

write "Would you mind adding a leaf to my tallest branch? `chef-apply -e \"file 'tree/trunk/tallest_branch/green.leaf'\"`"

option "Woodpecker asks tree what is the matter ...", event: 'what-was-the-matter'

event 'what-was-the-matter' do
  write "Tree was silent for quite some time until he finally spoke..."

  transition 'add-a-leaf.woodpecker-and-the-oak'
end
