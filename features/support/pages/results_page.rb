class ResultsPage < Page
  div :gif_tumbler, text: 'GIFs'
  div :content, class: 'giphy-grid' #/^GridWithTV/
  imgs :gifs, class: 'giphy-gif-img'
  span :results, class: /^NumberDisplay/
  h2 :channels_count

  # I had to use this poor locator because there is no other way to identify selected sorting type
  a :sorted_by, class: '_2rO4v1KuRJjfee1giAZGJE'

  def has_gifs?
    wait_for_results
    gifs_imgs.count > 0
  end

  def selected_channel
    searchbar
  end

  def results_count
    results_span.attribute('data-gif-count').delete(',')[/^\d+$/]
  end

  def results_type
    results.strip.downcase
  end

  def wait_for_results
    results_span.wait_until(&:present?)
  end

  def sorted_by
    sorted_by_a.text.downcase
  end
end
