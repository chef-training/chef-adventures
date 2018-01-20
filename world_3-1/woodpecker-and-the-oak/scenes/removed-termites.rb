# condition 'looked_at_termites', "inspec exec inspec/looked_at_termites.rb" do
#
#   write "ヽ(´ー｀)ノ \"You can see why I must be rid of them. I just wish my bark wasn't so much bigger than my bite.\"`,\" said the tree.", :speech, :very_fast, :blue
#
#   write "ヽ(´ー｀)ノ \"You can remove them by saying `rm tree/trunk/termites.bug`.\"`,\" said the tree. \"But becareful, I could lose a branch or a whole lot more. And it's hard bringing it back.", :speech, :very_fast, :blue
#
#   transition 'removed-termites.woodpecker-and-the-oak'
# end
condition 'damage_to_the_tree', "inspec exec inspec/damage_to_the_tree.rb" do

  write "ヽ(´ー｀)ノ \"Ouch! I hope I can grow that back,\" said the tree.", :speech, :very_fast, :blue

end

condition 'moved_termites_around_tree', "inspec exec inspec/moved_termites_around_tree.rb" do

  write "ヽ(´ー｀)ノ \"Oh! That tickles ... and stings a bit,\" said the tree.", :speech, :very_fast, :blue
end

condition 'moved_termites_off_tree', "inspec exec inspec/moved_termites_off_tree.rb" do

  write "ヽ(´ー｀)ノ \"Moving them was probably the best move if you're not made of wood,\" said the tree.", :speech, :very_fast, :blue

  transition 'late-for-spring.woodpecker-and-the-oak'
end

condition 'removed_termites', "inspec exec inspec/removed_termites.rb" do

  write "ヽ(´ー｀)ノ \"Nothing makes my skin crawl more than termites. Thank you,\" said the tree.", :speech, :very_fast, :blue

  transition 'late-for-spring.woodpecker-and-the-oak'
end
