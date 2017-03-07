class Task < ApplicationRecord
  belongs_to :project
  acts_as_list scope: :project

  has_many :comments, -> { order(:created_at) }, dependent: :destroy

  validates :title, length: { maximum: 100 }, presence: true
end
