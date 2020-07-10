class ChannelPage
  include BasicPage

  imgs :gif, class: 'giphy-gif-img'
  img :gif, class: 'giphy-gif-img'
  a :edit, href: /\/edit$/
  div :delete, class: 'ss-trash'
  div :confirm, -> { @browser.divs(text: 'Delete').last }
  a :grid, href: /view=grid/
  div :nothing_uploaded, text: "You haven't uploaded anything!"

  def remove_all_gifs
    until nothing_uploaded_div.present? do
      gif_imgs.first.click
      edit
      delete_div.click
      confirm_div.click
      grid_a.wait_until &:present?
    end
  end

  def content
    gif_imgs
  end
end
