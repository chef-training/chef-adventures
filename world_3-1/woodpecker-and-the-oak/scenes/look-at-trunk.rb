write "ヽ(´ー｀)ノ \"Look at the my trunk `ls tree/trunk`,\" replied the tree.", :speech, :very_fast, :blue

condition 'ran-ls-tree-trunk', "inspec exec inspec/looked_at_tree_trunk.rb" do
  transition 'inspect-for-termites.woodpecker-and-the-oak'
end
