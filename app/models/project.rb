class Project < ApplicationRecord
  has_many :tasks

  validates :title, length: { maximum: 50 }, presence: true
end
