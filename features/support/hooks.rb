def embed_screenshot
  attach Base.save_screenshot, 'image/png'
end

After do |scenario|
  embed_screenshot if scenario.failed?
end
