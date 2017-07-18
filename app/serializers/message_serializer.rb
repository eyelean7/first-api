class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :author, :created_at, :updated_at
  belongs_to :group

end
