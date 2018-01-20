
def tree_paths
  %w[ tree tree/trunk tree/more_roots/roots_worms_and_dirt tree/trunk/tallest_branch tree/trunk/shortest_branch tree/trunk/median_branch tree/trunk/git_branch tree/trunk/averge_branch ]
end

tree_paths.each do |path|
  describe file("#{path}/termites.bug") do
    it { should_not exist }
  end
end

describe file('/root/.bash_history') do
  its('content') { should_not match(/rm .+termite.bug/) }
end
