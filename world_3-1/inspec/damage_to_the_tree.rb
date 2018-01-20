
def tree_paths
  %w[ tree tree/trunk tree/more_roots/roots_worms_and_dirt tree/trunk/tallest_branch tree/trunk/shortest_branch tree/trunk/median_branch tree/trunk/git_branch tree/trunk/averge_branch ]
end

tree_paths.each do |path|
  describe file(path) do
    it { should exist }
  end
end
