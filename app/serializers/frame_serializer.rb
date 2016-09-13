class FrameSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :thumb_url

  def image_url
    object.frame.thumb("#{@instance_options[:width_screen]}x#{@instance_options[:height_size]}#").url
  end

  def potrait_image_url
    object.frame.thumb("#{@instance_options[:height_size]}x#{@instance_options[:width_screen]}#").url
  end

  def thumb_url
    object.frame.thumb("480x320#").url
  end

end