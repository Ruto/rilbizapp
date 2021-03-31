class Structure < ApplicationRecord
  has_ancestry
  belongs_to :structurable, polymorphic: true
  belongs_to :user
end
