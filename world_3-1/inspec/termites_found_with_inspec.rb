# encoding: utf-8
# copyright: 2018, The Authors

describe file('/root/.bash_history') do
  its('content') { should match('inspec exec inspec/find_termites.rb') }
end
