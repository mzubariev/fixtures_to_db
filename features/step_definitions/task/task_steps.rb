Given(/^two input parameters: 'post' and 'ini'$/) do
  save_to_db('ParserIni', 'post')
end
When(/^I check post table for a new rows with specific added data \(ini\)$/) do
  @posts = Post.find_by({name: 'post1'})
end
Then(/^I see the rows have been added \(post, ini\)$/) do
  expect(@posts).not_to be_nil
  expect(@posts.length).to be >= 1
end


Given(/^two input parameters: 'post' and 'json'$/) do
  save_to_db('ParserJson', 'post')
end
When(/^I check post table for a new rows with specific added data \(json\)$/) do
  @posts = Post.find_by({name: 'post1'})
end
Then(/^I see the rows have been added \(post, json\)$/) do
  expect(@posts).not_to be_nil
  expect(@posts.length).to be >= 1
end


Given(/^two input parameters: 'user' and 'ini'$/) do
  save_to_db('ParserIni', 'user')
end
When(/^I check user table for a new rows with specific added data \(ini\)$/) do
  @users = User.find_by({name: 'john1'})
end
Then(/^I see the rows have been added \(user, ini\)$/) do
  expect(@users).not_to be_nil
  expect(@users.length).to be >= 1
end


Given(/^two input parameters: 'user' and 'json'$/) do
  save_to_db('ParserJson', 'user')
end
When(/^I check user table for a new rows with specific added data \(json\)$/) do
  @users = User.find_by({name: 'john1'})
end
Then(/^I see the rows have been added \(user, json\)$/) do
  expect(@users).not_to be_nil
  expect(@users.length).to be >= 1
end


