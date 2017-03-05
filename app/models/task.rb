class Task < ApplicationRecord
  default_scope { order(:created_at) }

  belongs_to :project
  has_many :comments

  validates :title, length: { maximum: 100 }, presence: true
end
