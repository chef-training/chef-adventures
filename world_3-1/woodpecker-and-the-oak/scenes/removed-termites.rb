condition 'damage_to_the_tree' do

  write "ヽ(´ー｀) \"Ouch! I hope I can grow that back,\" bellowed the tree.", :speech, :very_fast, :blue

  # TODO: This re-directs to the same scene when this internal scene is complete. This is to prevent the anonymous scene here remain as the current scene. Explore if this becomes a problem.
  transition 'removed-termites-removed.woodpecker-and-the-oak'
end

condition 'moved_termites_around_tree' do

  write "ヽ(´ー｀)ノ \"Oh! Don't GRAFT me bro,\" bellowed the tree.", :speech, :very_fast, :blue

  transition 'removed-termites-final.woodpecker-and-the-oak'
end

condition 'moved_termites_off_tree' do

  write "ヽ(´ー｀)ノ \"Moving them was probably the best move if you're not made of wood,\" said the tree.", :speech, :very_fast, :blue

  transition 'late-for-spring.woodpecker-and-the-oak'
end

condition 'removed_termites' do

  write "ヽ(´ー｀)ノ \"Nothing makes my skin crawl more than termites. Thank you,\" said the tree.", :speech, :very_fast, :blue

  transition 'late-for-spring.woodpecker-and-the-oak'
end
