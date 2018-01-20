condition 'looked_at_tree', "inspec exec inspec/looked_at_tree.rb" do

  write "ヽ(´ー｀)ノ \"Follow with your eyes up the trunk with `ls tree/trunk`,\" said the tree.", :speech, :very_fast, :blue

  # TODO: introduce the idea of pressing the up arrow to repeat the last command

  transition 'look-at-trunk.woodpecker-and-the-oak'
end
