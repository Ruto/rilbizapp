class Product < ApplicationRecord
  has_ancestry
  belongs_to :user
end
