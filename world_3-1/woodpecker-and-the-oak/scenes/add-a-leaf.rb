condition 'tree_has_three_leaves' do

  write "ヽ(´ー｀)ノ \"Thank you again. Now it seems I all caught up`,\" said the tree.", :speech, :very_fast, :blue

  transition 'green-for-spring.woodpecker-and-the-oak'
end

condition 'tree_has_one_leaf' do

  write "ヽ(´ー｀)ノ \"One leaf! I can already feel the wind whistling,\" said the tree.", :speech, :very_fast, :blue

  write "ヽ(´ー｀)ノ \"Such a gorgeous color too! I do think it suits me,\" said the tree. \"To save you some time, press the `UP` key to display the last thing you did. Now you can just edit the branch name by deleting it and re-typing what you need.\"", :speech, :very_fast, :blue


  transition 'add-a-leaf-one-leaf.woodpecker-and-the-oak'
end
