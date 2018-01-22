describe "A tree that has exactly one leaf" do

  let(:tree_trunk) do
    'tree/trunk'
  end

  let(:tree_paths) do
    %w[ tallest_branch shortest_branch average_branch ]
  end

  let(:leaf) do
    'green.leaf'
  end

  it 'should only find one `green.leaf` on a branch' do
    leaf_survey = tree_paths.find_all do |path|
      File.exist?("#{tree_trunk}/#{path}/#{leaf}")
    end
    expect(leaf_survey.size).to eq(1)
  end
end
