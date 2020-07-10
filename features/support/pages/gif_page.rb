class GifPage
  include BasicPage

  h1 :title, text: 'Animated GIF'
  video :gif, alt: 'Animated GIF'

  def has_uploaded_gif?
    title_h1.present? && gif_video.present?
  end
end
