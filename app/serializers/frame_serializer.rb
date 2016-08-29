class FrameSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url

  def image_url
    object.frame.thumb("#{@instance_options[:width_screen]}x#{@instance_options[:height_size]}#").url
  end

end