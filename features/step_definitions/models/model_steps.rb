Given(/^some fields$/) do
  @user_data = {name: 'samuel', last_name: 'fisher'}
end
When(/^call new method$/) do
  @user = User.new(@user_data)
end
Then(/^I see the new object with a given fields$/) do
  expect(@user.instance_variables).not_to be_nil
  expect(@user.instance_variables.length).to be >= 1
end


Given(/^a new object with set fields$/) do
  @user = User.new({name: 'bob', last_name: 'fisher'})
end
When(/^call save method$/) do
  @user.save
end
Then(/^I see the row have been added$/) do
  user = User.find_by({name: 'bob'})
  expect(user).not_to be_nil
  expect(user.length).to be >= 1
end