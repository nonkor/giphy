module DataHelper
  # @return [Hash] list of channels matched by channel id
  def channels
    {
      '@snl' => 'Saturday Night Live'
    }
  end

  module_function :channels
end
