write "ヽ(´ー｀)ノ \"Look around with `ls`,\" replied the tree.", :speech, :very_fast, :blue

condition 'ran-ls', "inspec exec inspec/looked_around.rb" do
  transition 'look-at-tree.woodpecker-and-the-oak'
end
