class Group < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :entities, through: :categories
end
