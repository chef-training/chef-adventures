condition 'looked_at_termites', "inspec exec inspec/looked_at_termites.rb" do

  write "ヽ(´ー｀)ノ \"You can see why I must be rid of them. I just wish my bark wasn't /so/ much bigger than my bite.\"`,\" said the tree.", :speech, :very_fast, :blue

  write "ヽ(´ー｀)ノ \"You can remove them by saying `rm tree/trunk/termites.bug`.\"`, said the tree. \"But becareful with `rm`, I could lose a branch or a whole lot more.", :speech, :very_fast, :blue

  transition 'removed-termites.woodpecker-and-the-oak'
end
