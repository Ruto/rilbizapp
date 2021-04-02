class Structure < ApplicationRecord
  has_ancestry
  belongs_to :structurable, polymorphic: true
  belongs_to :user
  has_many :organizations, as: :organizable
end
