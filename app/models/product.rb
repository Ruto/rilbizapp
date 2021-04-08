class Product < ApplicationRecord
  has_ancestry
  belongs_to :user
  has_many :codes
end
