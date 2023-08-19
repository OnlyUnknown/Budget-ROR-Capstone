class Group < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :entities, through: :categories
  validates :name, presence: true
  validates :icon, presence: true
end
