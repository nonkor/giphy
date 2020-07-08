require 'require_all'
require 'watir'
require 'watirsome'
require 'rspec'

require_rel 'base.rb'
require_rel 'pages/page.rb'

Base.browser = Watir::Browser.new
Base.wipe_report_dir
