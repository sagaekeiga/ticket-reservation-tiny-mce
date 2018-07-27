class Ticket < ApplicationRecord
  # -------------------------------------------------------------------------------
  # Relations
  # -------------------------------------------------------------------------------
  has_many :deliveries, dependent: :destroy
end
