class Price < ApplicationRecord
  belongs_to :priceable, polymorphic: true
  belongs_to :code
  belongs_to :user
end
