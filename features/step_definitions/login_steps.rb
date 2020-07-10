Given('I am on giphy site') do
  Base.browser.goto 'giphy.com'
  @page = HomePage.new
end

Given('I am unauthenticated visitor') do
  step 'I am on giphy site'
end

Given('I am logged in as {string}') do |user|
  Base.browser.goto 'giphy.com/login'
  @page = LoginPage.new
  step %(I login as "#{user}")
end

When('I navigate to the login page') do
  @page.go_to_login
  @page = LoginPage.new
end

When('I login as {string}') do |user|
  creds = DataHelper.users[user]
  @page.login creds[:email], creds[:password]
  @page = ChannelPage.new
end

Then('I should be logged in') do
  expect(@page).to be_logged_in
end
