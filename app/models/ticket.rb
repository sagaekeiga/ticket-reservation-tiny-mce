class Ticket < ApplicationRecord
  # -------------------------------------------------------------------------------
  # Relations
  # -------------------------------------------------------------------------------
  has_many :deliveries, dependent: :destroy
  has_many :ticket_images, dependent: :destroy
end
