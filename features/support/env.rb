require 'require_all'
require 'watir'
require 'watirsome'
require 'rspec'

require_rel 'base.rb'
require_rel 'pages/basic_page.rb'

Base.browser = Watir::Browser.new
Base.browser.driver.manage.timeouts.page_load = 60
Base.wipe_report_dir
