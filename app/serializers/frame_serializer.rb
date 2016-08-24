class FrameSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url

  def image_url
    object.frame.url
  end

end