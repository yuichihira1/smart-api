class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :mail, :access_token
end
