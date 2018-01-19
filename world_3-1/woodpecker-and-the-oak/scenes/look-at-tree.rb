write "ヽ(´ー｀)ノ \"Look at the me with `ls tree`,\" replied the tree.", :speech, :very_fast, :blue

condition 'ran-ls-tree', "inspec exec inspec/looked_at_tree.rb" do
  transition 'look-at-trunk.woodpecker-and-the-oak'
end
