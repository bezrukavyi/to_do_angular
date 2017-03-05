class Comment < ApplicationRecord
  default_scope { order(:created_at) }

  belongs_to :task

  validates :title, length: { maximum: 50 }, presence: true
end
