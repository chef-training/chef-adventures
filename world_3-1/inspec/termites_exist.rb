puts "Using the power of InSpec you find the termites easily..."

describe file('tree/trunk/termites.bug') do
  it { should exist }
end
