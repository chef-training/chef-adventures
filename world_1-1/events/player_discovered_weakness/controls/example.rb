# encoding: utf-8
# copyright: 2018, Chef Adventures

describe file('/root/.bash_history') do
  its('content') { should match('inspec exec find_weakness') }
end
