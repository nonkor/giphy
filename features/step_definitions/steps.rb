Given('I am on giphy site') do
  Base.browser.goto 'giphy.com'
  @page = HomePage.new
end

When('I specify {string} as keyword') do |keyword|
  @page.fill_in(keyword)
end

Then('I should see autocomplete options for my search request') do
  expect(@page.gif_options).not_to be_empty
end

Then('I should see suggested channels related to my search request') do
  expect(@page.channel_options).not_to be_empty
end

When('I search by {string}') do |keyword|
  @page.search_by(keyword)
  @page = ResultsPage.new
end

Then('I should see related gifs') do
  expect(@page.results_count).to match /^\d+$/
  expect(@page.results_type).to eq('gifs')
  expect(@page).to have_gifs
end

Then('I should see related channels') do
  expect(@page.channels_count).to match /\d+ channels/
end

Then('I should not see any gifs') do
  expect(@page.results_count.to_i).to be 0
  expect(@page.results_type).to eq('gifs')
  expect(@page).not_to have_gifs
end

Then('I should see message - no gifs found for {string}') do  |keyword|
  expect(@page.body).to include "No GIFs found for #{keyword}"
end

Then('the data should be sorted by {string} creteria') do |creteria|
  expect(@page.sorted_by).to eq creteria.downcase
end

When('only {string} gifs should be listed') do |channel|
  channel_id = DataHelper.channels.key(channel)
  expect(@page).to have_gifs
  expect(@page).to have_selected_channel(channel_id)
end

Then('{string} should be specified as keyword') do |keyword|
  expect(@page.keyword_text_field.value).to eq keyword
end
