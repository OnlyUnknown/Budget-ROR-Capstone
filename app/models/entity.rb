class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :categories
  has_many :groups, through: :categories
  validates :name, presence: true

  validate :categories_presence

  private

  def categories_presence
    return unless categories.empty?

    errors.add(:base, 'At least one category must be selected')
  end
end
