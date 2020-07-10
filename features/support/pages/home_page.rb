class HomePage
  include BasicPage

  div :autosuggestion, class: /SearchBarDropDownContainer/
  divs :gif_options, -> { autosuggestion_div.uls[0].divs(class: /ResultTitle/) }
  divs :channel_options, -> { autosuggestion_div.uls[1]&.divs(class: /ResultTitle/) }

  def fill_in(keyword)
    self.keyword = keyword
    autosuggestion_div.wait_until(&:present?)
  end

  def gif_options
    gif_options_divs.map &:text
  end

  def channel_options
    return [] if channel_options_divs.nil?
    channel_options_divs.map &:text
  end

  def search_by(keyword)
    if keyword.include?('@')
      fill_channel_and_keyword(keyword)
    else
      self.keyword = keyword, :enter
    end
  end

  # setting channel and tag alltogether sometimes leads to flaky error
  # where keyword is clipped
  # this is related to the way how webdriver deal with text field
  # so splitting channel and keyword is needed to make the test more stable
  def fill_channel_and_keyword(keyword)
    channel, tag = keyword.split
    self.keyword = channel + ' '
    searchbar_div.wait_until { |e| e.text.empty? }
    keyword_text_field.send_keys tag, :enter
  end
end
