class Code < ApplicationRecord
  belongs_to :product
  belongs_to :codable, polymorphic: true
  belongs_to :user

  has_many :prices
end
