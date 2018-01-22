describe "A tree that has been damaged" do

  let(:tree_paths) do
    %w[ tree tree/trunk tree/roots/more_roots/roots_worms_and_dirt tree/trunk/tallest_branch tree/trunk/shortest_branch tree/trunk/average_branch ]
  end

  it 'should have even one part missing' do
    tree_lost_something = tree_paths.find do |path|
      !File.exist?(path)
    end
    expect(tree_lost_something).to be
  end
end
