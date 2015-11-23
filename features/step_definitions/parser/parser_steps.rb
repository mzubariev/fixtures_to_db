# Given(/^a new object with set fields$/) do
#   @user = User.new({name: 'bob', last_name: 'fisher'})
# end
# When(/^call save method$/) do
#   @user.save
# end
# Then(/^I see the row have been added$/) do
#   user = User.find_by({name: 'bob'})
#   expect(user).not_to be_nil
#   expect(user.length).to be >= 1
# end