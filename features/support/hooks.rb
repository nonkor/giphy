def embed_screenshot
  attach Base.save_screenshot, 'image/png'
end

Before do |_scenario|
  Base.browser.cookies.clear
end

After do |scenario|
  if scenario.failed?
    embed_screenshot
    Base.save_dom
  end
end
