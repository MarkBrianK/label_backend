class Cloth < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :likes
end
