Given('I am on the upload page') do
  Base.browser.goto 'giphy.com/upload'
  @page = UploadPage.new
end

When('I navigate to the upload page') do
  @page.go_to_upload
  @page = UploadPage.new
end

When('I try to upload a gif') do
  path = Dir.pwd + '/' + DataHelper.gifs[:local]
  @page.upload_gif_by_path(path)
end

When('I upload a gif from local source') do
  step 'I try to upload a gif'
  @page.add_info(tag: 'think about it', type: :private)
  @page = GifPage.new
end

When('I upload a gif by url') do
  @page.upload_gif_by_url(DataHelper.gifs[:url])
  @page.add_info(tag: 'unimpressed girl', type: :private)
  @page = GifPage.new
end

When('I removes all my gifs') do
  @page.remove_all_gifs
end

Then('I should be informed about a need to authenticate') do
  expect(@page.notice).to eq "You've gotta log in to upload to GIPHY!"
end

Then('the gif should be uploaded') do
  expect(@page).to have_uploaded_gif
end

Then('desired tag should be specified') do
  # TODO: test tag validation
  pending
end

Then('my account should be empty') do
  expect(@page.content).to be_empty
end
