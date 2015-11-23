Given(/^Parser class name and two params for new instance$/) do
  @class_name = 'ParserIni'
  @path = '../../../datafiles/fixtures/'
  @file_name = 'user.ini'
end

When(/^call loader method$/) do
  @parser = Object.const_get("#{@class_name}").new(@path, @file_name)
end

Then(/^I see the new Parser object with two fields$/) do
  expect(@parser.instance_variables.length).to be == 2
  expect(@parser.class.name).to be == 'ParserIni'
end
