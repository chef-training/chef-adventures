condition 'moved_termites_around_tree' do

  write "ヽ(´ー｀)ノ \"Oh! Don't GRAFT me bro,\" bellowed the tree.", :speech, :very_fast, :blue

  transition 'removed_termites-final.woodpecker-and-the-oak'
end

condition 'moved_termites_off_tree' do

  write "ヽ(´ー｀)ノ \"Moving them was probably the best move if you're not made of wood,\" said the tree.", :speech, :very_fast, :blue

  transition 'late-for-spring.woodpecker-and-the-oak'
end

condition 'removed_termites' do

  write "ヽ(´ー｀)ノ \"Nothing makes my skin crawl more than termites. Thank you,\" said the tree.", :speech, :very_fast, :blue

  transition 'late-for-spring.woodpecker-and-the-oak'
end
