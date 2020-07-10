module Base
  REPORT_DIR = 'results'

  class << self
    attr_accessor :browser

    def wipe_report_dir
      FileUtils.remove_dir REPORT_DIR, true
      FileUtils.mkdir_p REPORT_DIR
    end

    def timestamp
      Time.now.utc.strftime('%Y%m%dT%H%M%S')
    end

    def save_screenshot
      path = "#{Base::REPORT_DIR}/screenshot#{timestamp}.png"
      browser.screenshot.save path
      path
    end

    def save_dom
      File.open("#{Base::REPORT_DIR}/pagedom#{timestamp}.html", 'w') { |io|
        io.write(Base.browser.body.html)
      }
    end
  end
end
