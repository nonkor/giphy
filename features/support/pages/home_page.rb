class HomePage < Page
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
    self.keyword = keyword, :enter
  end
end
