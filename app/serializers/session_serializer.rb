class SessionSerializer < ActiveModel::Serializer
  attributes :id, :username, :token
end