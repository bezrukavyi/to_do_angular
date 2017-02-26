class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :title, length: { maximum: 50 }, presence: true
end
