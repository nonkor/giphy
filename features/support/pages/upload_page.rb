class UploadPage
  include BasicPage

  div :modal, class: /ModalTitle/
  file_field :upload
  text_field :url, type: 'url'
  span :private, text: 'Off'
  text_field :tag, placeholder: 'Enter tags'
  button :confirm, text: 'Upload to GIPHY'
  div :progress_bar, class: /progress-bar/

  def upload_gif_by_path(path)
    upload_file_field.set path
  end

  def upload_gif_by_url(url)
    self.url = url
  end

  def add_info(tag: nil, type: :private)
    self.tag = tag if tag
    private_span.click if type == :private
    confirm
    progress_bar_div.wait_while &:present?
  end

  def notice
    modal_div.text
  end
end
