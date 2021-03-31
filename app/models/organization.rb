class Organization < ApplicationRecord
  has_ancestry
  belongs_to :organizable, polymorphic: true
  belongs_to :user
end
