# encoding: utf-8
# copyright: 2018, Chef Adventures

describe package('fortunes') do
  it { should be_installed }
end

describe "The 'fortune' command" do
  it "should exist" do
    expect(command('/usr/games/fortune')).to exist
  end
end
