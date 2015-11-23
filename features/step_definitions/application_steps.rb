Given(/^two input parameters$/) do
  model = User.new
  data = Parser.new('ParserIni', 'user').loader.parse
  model.save_parsed_bunch(data)
end

When(/^I check user table for a new rows with specific added data$/) do
  @users = User.find_by({name: 'john1'})
end

Then(/^I see the rows have been added$/) do
  expect(@users).not_to be_nil
  expect(@users.length).to be >= 1
end
