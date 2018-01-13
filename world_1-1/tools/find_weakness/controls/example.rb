# encoding: utf-8
# copyright: 2018, InSpec Gem

describe "The command 'chef-apply'" do
  it 'exists!' do
    expect(command('chef-apply')).to exist
  end

  it 'is can be weilded by this user!' do
    expect(file('/opt/chefdk/bin/chef-apply')).to be_owned_by('root')
  end
end
