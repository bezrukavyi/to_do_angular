class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_many :attachments
end
