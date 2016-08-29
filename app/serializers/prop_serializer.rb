class PropSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url

  def image_url
    object.prop.url
  end

end