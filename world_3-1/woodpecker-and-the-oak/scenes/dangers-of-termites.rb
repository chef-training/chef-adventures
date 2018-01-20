condition 'looked_at_termites', "inspec exec inspec/looked_at_termites.rb" do

  write "ヽ(´ー｀)ノ \"You can see why I must be rid of them. I just wish my bark wasn't /so/ much bigger than my bite.\"`,\" said the tree.", :speech, :very_fast, :blue

  option "Dream about how to remove them ...", id: 'remove', event: 'how-to-remove-termites'
  option "Dream about how to move them ...", id: 'move', event: 'how-to-move-termites'

  event 'how-to-remove-termites' do
    write "ヽ(´ー｀)ノ \"You can remove them by saying `rm tree/trunk/termites.bug`.\"`, said the tree. \"But please take care with `rm`, I could lose a branch or a whole lot more.\"", :speech, :very_fast, :blue

    transition 'removed-termites.woodpecker-and-the-oak'
  end

  event 'how-to-move-termites' do
    write "ヽ(´ー｀)ノ \"You can move them by saying `mv tree/trunk/termites.bug .`.\"`, said the tree. \"The dot means to place them where you now stand.\"", :speech, :very_fast, :blue

    transition 'removed-termites.woodpecker-and-the-oak'
  end

end
