
def tree_paths
  %w[ tree tree/trunk tree/roots/more_roots/roots_worms_and_dirt tree/trunk/tallest_branch tree/trunk/shortest_branch tree/trunk/median_branch tree/trunk/git_branch tree/trunk/average_branch ]
end

describe 'The termites may have moved'
  it 'to another position on the tree' do
    termite_found = tree_paths.find { |path| File.exist?("#{path}/termites.bug") }
    expect(termite_found).not_to be_nil
  end
end
