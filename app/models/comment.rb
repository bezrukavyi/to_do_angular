class Comment < ApplicationRecord
  belongs_to :task
  has_many :attachments, dependent: :destroy

  validates :title, length: { maximum: 50 }, presence: true
end
