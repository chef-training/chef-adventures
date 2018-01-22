describe file('/game/tree/trunk/tallest_branch/woodpecker.bird') do
  it { should exist }
end

describe file('/game/woodpecker.bird') do
  it { should_not exist }
end
