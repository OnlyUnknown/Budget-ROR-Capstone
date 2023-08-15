class Entity < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :categorizations
end
