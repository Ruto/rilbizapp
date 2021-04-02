class Organization < ApplicationRecord
  has_ancestry
  belongs_to :organizable, polymorphic: true, optional: true
  belongs_to :user
  has_many :structures, as: :structurable

end
