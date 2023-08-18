class Category < ApplicationRecord
  belongs_to :entity
  belongs_to :group

  validates :group_id, presence: true
  validates :entity_id, presence: true
end
