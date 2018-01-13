# encoding: utf-8
# copyright: 2018, Chef Adventures

describe package('fortunes') do
  it { should be_installed }
end
