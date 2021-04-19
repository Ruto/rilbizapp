class Account < ApplicationRecord
  belongs_to :accountable, polymorphic: true
  belongs_to :user
end
