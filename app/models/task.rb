class Task < ApplicationRecord
  belongs_to :project

  validates :title, length: { maximum: 50 }, presence: true
end
