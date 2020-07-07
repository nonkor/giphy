class ResultsPage < Page
  div :gif_tumbler, text: 'GIFs'
  div :content, class: 'giphy-grid' #/^GridWithTV/
  as :gifs, -> { content_div.as }

  span :results, class: /^NumberDisplay/
  h2 :channels_count

  def has_gifs?
    return false unless content_div.present?
    gifs_as.count > 0
  end

  def has_selected_channel?(channel_id)
    searchbar == channel_id
  end

  def results_count
    results_span.attribute('data-gif-count').delete(',')[/^\d+$/]
  end

  def results_type
    results.strip.downcase
  end
end
